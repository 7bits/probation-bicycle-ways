package likebike

import grails.util.Holders
import groovy.text.SimpleTemplateEngine
import org.codehaus.groovy.grails.plugins.springsecurity.ui.RegistrationCode

class RegisterService {
    def mailService
    def grailsLinkGenerator

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
                    enabled: true
            )
            user.save(flush: true)
            def registrationCode = new RegistrationCode(username: user.username).save()
            String url = grailsLinkGenerator.link( action: 'verifyRegistration', params: [t: registrationCode.token])
            def conf = Holders.config
            def body = conf.emailBody
            new SimpleTemplateEngine().createTemplate(body).make([user: user, url: url])
            mailService.sendMail {
                to form.email
                from conf.emailFrom
                subject conf.emailSubject
                html body.toString()
            }
            errorsMap.put('status', true)
        }
        return errorsMap
    }
}
