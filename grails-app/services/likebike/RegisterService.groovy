package likebike

import grails.util.Holders
import groovy.text.SimpleTemplateEngine
import org.codehaus.groovy.grails.plugins.springsecurity.NullSaltSource
import org.codehaus.groovy.grails.plugins.springsecurity.ui.RegistrationCode
import org.springframework.context.i18n.LocaleContextHolder


class RegisterService {
    def register(def form) {
        def messageSource = grails.util.GrailsWebUtil.currentApplication().mainContext.messageSource
        def mailService = grails.util.GrailsWebUtil.currentApplication().mainContext.mailService
        def saltSource = grails.util.GrailsWebUtil.currentApplication().mainContext.saltSource
        def grailsLinkGenerator = grails.util.GrailsWebUtil.currentApplication().mainContext.grailsLinkGenerator
        form.validate()
        def json = [:]
        if (!form.validate()) {
            form.getErrors().allErrors.each {
                json.put(it.field, messageSource.getMessage(it, LocaleContextHolder.getLocale()))
            }
            json.put("status", false)
        }
        else {
            String password = form.password //springSecurityService.encodePassword(form.password)
            User user = new User(
                    email: form.email,
                    username: form.username,
                    password: password,
                    accountLocked: true,
                    enabled: true
            )
            user.save(flush: true)

            String salt = saltSource instanceof NullSaltSource ? null : form.username
            def registrationCode = new RegistrationCode(username: user.username).save()
            String url = grailsLinkGenerator.link( action: 'verifyRegistration', params: [t: registrationCode.token])
            def conf = Holders.config
            def body = conf.emailBody
            if (body.contains('$')) {
                new SimpleTemplateEngine().createTemplate(body).make([user: user, url: url])
            }
            mailService.sendMail {
                to form.email
                from conf.emailFrom
                subject conf.emailSubject
                html body.toString()
            }
            json.put('status', true)
        }
        return json
    }

     def static usernameValidator = { value ->
        if (value) {
            if (User.findByUsername(value)) {
                return 'registerCommand.username.unique'
            }
        }
    }
}


