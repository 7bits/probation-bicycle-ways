package likebike

import grails.util.Holders
import groovy.text.SimpleTemplateEngine
import org.codehaus.groovy.grails.plugins.springsecurity.ui.RegistrationCode

class RegisterService {
    def mailService
    def grailsLinkGenerator
    def springSecurityService

    /**
     * Creates new user if form data is valid and sends him email with confirmation link
     * @param form - form object with registration data
     * @return json {success:true} on success and errors object if there is validation errors.
     */
    def register(form) {
        def errors = [:]
        if (!form.validate()) {
            errors = form.getErrors().allErrors
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
        }
        return errors
    }
    /**
     * Verifies user by confirmation token. Unlocks account and gives role to user.
     * @param t registration token that is in registration confirmation email
     */
    def verifyRegistration(t) {
        def registrationCode = t ? RegistrationCode.findByToken(t) : null
        RegistrationCode.withTransaction { status ->
            def user = User.findByUsername(registrationCode.username)
            if (!user) {
                return
            }
            user.accountLocked = false
            user.save(flush:true)
            UserRole.create user, Role.findByAuthority('ROLE_USER')
            registrationCode.delete()
            springSecurityService.reauthenticate user.username
        }
    }
}
