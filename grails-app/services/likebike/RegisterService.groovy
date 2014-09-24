package likebike

import grails.util.Holders
import groovy.text.SimpleTemplateEngine
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import org.codehaus.groovy.grails.plugins.springsecurity.ui.RegistrationCode

class RegisterService {
    def mailService
    def grailsLinkGenerator
    def springSecurityService

    def register(form) {
        def errorsMap = [:]
        if (!form.validate()) {
            errorsMap = form.getErrors().allErrors
        }
        else {
            String password = form.password
            User user = new User(
                    email: form.email,
                    username: form.username,
                    password: password,
                    accountLocked: true,
                    enabled: true,
                    uid: ''
            )
            user.save(flush: true)
            def registrationCode = new RegistrationCode(username: user.username).save()
            String url = grailsLinkGenerator.link( action: 'verifyRegistration',
                    params: [t: registrationCode.token],
                    absolute:true)
            def body = Holders.config.emailBody
            def emailFrom = Holders.config.emailFrom
            def subj = Holders.config.emailSubject
            body = new SimpleTemplateEngine().createTemplate(body).make([user: user, url: url])
            mailService.sendMail {
                to form.email
                from emailFrom
                subject subj
                html body.toString()
            }
            errorsMap.put('status', true)
        }
        return errorsMap
    }

    def verifyRegistration(t) {

        def conf = SpringSecurityUtils.securityConfig
        String defaultTargetUrl = conf.successHandler.defaultTargetUrl

        String token = t

        def registrationCode = token ? RegistrationCode.findByToken(token) : null
        User user = new User(username: registrationCode.username)
        if (!user) {
            return
        }
        user.accountLocked = false
        user.save(flush:true)
        def userRole = new Role(authority: 'ROLE_USER').save(flush: true)
        UserRole.create user, userRole, true
        registrationCode.delete()
        if (!user) {
            return
        }
        springSecurityService.reauthenticate user.username
    }
}
