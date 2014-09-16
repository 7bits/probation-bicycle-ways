package likebike

import grails.util.Holders
import groovy.text.SimpleTemplateEngine
import org.codehaus.groovy.grails.plugins.springsecurity.ui.RegistrationCode
import org.springframework.context.i18n.LocaleContextHolder

class RegisterService {

    def messageSource
    def mailService
    def grailsLinkGenerator

    def register(def form) {
        form.validate()
        def json = [:]
        if (!form.validate()) {
            form.getErrors().allErrors.each {
                json.put(it.field, messageSource.getMessage(it, LocaleContextHolder.getLocale()))
            }
            json.put("status", false)
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
}
