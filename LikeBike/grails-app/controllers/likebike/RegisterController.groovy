package likebike

import org.codehaus.groovy.grails.plugins.springsecurity.NullSaltSource
import org.codehaus.groovy.grails.plugins.springsecurity.ui.RegistrationCode
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import org.codehaus.groovy.grails.commons.ApplicationHolder as AH
import grails.converters.*

class RegisterController extends grails.plugins.springsecurity.ui.RegisterController {

    def register = {

        def out = [sdasd: "asdfdfsd"]
        render params.command as JSON

        if (command.hasErrors()) {
            redirect(controller: "home", action: "index", model: [command: command])
            return
        }

        String salt = saltSource instanceof NullSaltSource ? null : command.username
        String password = springSecurityService.encodePassword(command.password, salt)
        def user = lookupUserClass().newInstance(
                email: command.email,
                username: command.username,
                password: password,
                accountLocked: true,
                enabled: true
        )
        if (!user.validate() || !user.save(flash: true)) {
            // TODO
        }

        def registrationCode = new RegistrationCode(username: user.username).save()
        String url = generateLink('verifyRegistration', [t: registrationCode.token])

        def conf = SpringSecurityUtils.securityConfig
        def body = conf.ui.register.emailBody
        if (body.contains('$')) {
            body = evaluate(body, [user: user, url: url])
        }
        mailService.sendMail {
            to command.email
            from conf.ui.register.emailFrom
            subject conf.ui.register.emailSubject
            html body.toString()
        }

        redirect(controller: "home", action: "index", model: [command: command])
    }

    def verifyRegistration = {

        String token = params.t;
        def registrationCode = token ? RegistrationCode.findByToken(token) : null;

        super.verifyRegistration();

        if (registrationCode) {
            def user = lookupUserClass().findByUsername(registrationCode.username);
            if (user) {
                user.afterRegisteration();
            }
        }
    }

    def forgotPassword = {

        if (!request.post) {
            // show the form
            return
        }

        String username = params.username
        if (!username) {
            flash.error = message(code: 'spring.security.ui.forgotPassword.username.missing')
            return
        }

        def user = lookupUserClass().findByUsername(username)
        if (!user) {
            flash.error = message(code: 'spring.security.ui.forgotPassword.user.notFound')
            return
        }

        def registrationCode = new RegistrationCode(username: user.username).save()

        String url = generateLink('resetPassword', [t: registrationCode.token])

        def conf = SpringSecurityUtils.securityConfig
        def body = conf.ui.forgotPassword.emailBody
        if (body.contains('$')) {
            body = evaluate(body, [user: user, url: url])
        }
        mailService.sendMail {
            to user.email
            from conf.ui.forgotPassword.emailFrom
            subject conf.ui.forgotPassword.emailSubject
            html body.toString()
        }

        [emailSent: true]
    }

    def resetPassword = { ResetPasswordCommand command ->

        String token = params.t

        def registrationCode = token ? RegistrationCode.findByToken(token) : null
        if (!registrationCode) {
            flash.error = message(code: 'spring.security.ui.resetPassword.badCode')
            redirect uri: SpringSecurityUtils.securityConfig.successHandler.defaultTargetUrl
            return;
        }

        if (!request.post) {
            return [token: token, command: new ResetPasswordCommand()]
        }

        command.username = registrationCode.username
        command.validate()

        if (command.hasErrors()) {
            return [token: token, command: command]
        }

        String salt = saltSource instanceof NullSaltSource ? null : registrationCode.username
        RegistrationCode.withTransaction { status ->
            def user = lookupUserClass().findByUsername(registrationCode.username)
            user.password = springSecurityService.encodePassword(command.password, salt)
            user.save()
            registrationCode.delete()
        }

        springSecurityService.reauthenticate registrationCode.username

        flash.message = message(code: 'spring.security.ui.resetPassword.success')

        def conf = SpringSecurityUtils.securityConfig
        String postResetUrl = conf.ui.register.postResetUrl ?: conf.successHandler.defaultTargetUrl
        redirect uri: postResetUrl
    }
}




class RegisterCommand {

    String username
    String email
    String password
    String password2

    static constraints = {
        username blank: false, validator: { value, command ->
            if (value) {
                def User = AH.application.getDomainClass(
                        SpringSecurityUtils.securityConfig.userLookup.userDomainClassName).clazz
                if (User.findByUsername(value)) {
                    return 'registerCommand.username.unique'
                }
            }
        }
        email blank: false, email: true
        password blank: false, minSize: 8, maxSize: 64, validator: passwordValidator
        password2 validator: RegisterController.password2Validator
    }

    static final passwordValidator = { String password, command ->

        if (command.username && command.username.equals(password)) {
            return 'command.password.error.username'
        }

        if (
                password
                        && password.length() >= 8
                        && password.length() <= 64
                        && (
                !password.matches('^.*\\p{Alpha}.*$')
                        || !password.matches('^.*\\p{Digit}.*$')
                )
        ) {
            return 'command.password.error.strength'
        }
    }
}

class ResetPasswordCommand {

    String username
    String password
    String password2

    static constraints = {
        password blank: false, minSize: 8, maxSize: 64, validator: passwordValidator
        password2 validator: RegisterController.password2Validator
    }

    static final passwordValidator = { String password, command ->

        if (command.username && command.username.equals(password)) {
            return 'command.password.error.username'
        }

        if (
                password
                        && password.length() >= 8
                        && password.length() <= 64
                        && (
                !password.matches('^.*\\p{Alpha}.*$')
                        || !password.matches('^.*\\p{Digit}.*$')
                )
        ) {
            return 'command.password.error.strength'
        }
    }
}

