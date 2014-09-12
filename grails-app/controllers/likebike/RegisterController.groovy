package likebike

import grails.validation.Validateable
import org.springframework.context.i18n.LocaleContextHolder as LCH
import org.codehaus.groovy.grails.plugins.springsecurity.NullSaltSource
import org.codehaus.groovy.grails.plugins.springsecurity.ui.RegistrationCode
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import grails.converters.*
import grails.util.Holders


class RegisterController extends grails.plugins.springsecurity.ui.RegisterController {
    def index = {
        redirect( [controller: "home", action: "index"])
    }

    def register = {

        def outErrors = []
//
//        if (params['username'] == '') {
//            outErrors.username = 'Имя не может быть пустым '
//        } else {
//            if (lookupUserClass().findByUsername(params['username'])) {
//                outErrors.username = 'Это имя уже используется'
//            }
//        }
//
//        if (!EmailValidator.getInstance().isValid(params['email'])) {
//            outErrors.email = 'Неправильный E-mail'
//        }
//        if (params['email'] == '') {
//            outErrors.email = 'E-mail не может быть пустым'
//        }
//        if (params['password'] == '') {
//            outErrors.password = 'Неверный пароль. Пароль не должен быть короче 8 символов. '
//        }
//        if (params['password2'] == '') {
//            outErrors.password2 = 'Введите пароль повторно'
//        }
//
//        if (params['password2'] != params['password']) {
//            outErrors.password2 = 'Пароли не совпадают'
//        }
//
//        String passwordVal = params['password'];
//        if (!(
//        passwordVal
//                && passwordVal.length() >= 8
//                && passwordVal.length() <= 64
//        )) {
//            outErrors.password = 'Пароль не должен быть короче 8-ми и длиннее 64-х символов'
//        }
        RegisterCommand command = new RegisterCommand()
        command.username = (params['username'])
        command.email = (params['email'])
        command.password = (params['password'])
        command.password2 = (params['password2'])
        command.validate()

        if (!command.validate()) {
            def jsonErrors = [:]
            command.getErrors().allErrors.each {
                jsonErrors.put(it.field, messageSource.getMessage(it, LCH.getLocale()))
            }
            render jsonErrors as JSON
            return
        }

        String password = command.password //springSecurityService.encodePassword(command.password)
        User user = new User(command)
        if (!user.validate()) {
            def a =
            render user.getErrors() as JSON
            return
        }
        user.save(flush: true)

        String salt = saltSource instanceof NullSaltSource ? null : command.username
        def registrationCode = new RegistrationCode(username: user.username).save()
        String url = "http://" + generateLink('verifyRegistration', [t: registrationCode.token])
        def conf = Holders.config
        def body = conf.emailBody
        if (body.contains('$')) {
            body = evaluate(body, [user: user, url: url])
        }
        mailService.sendMail {
            to command.email
            from conf.emailFrom
            subject conf.emailSubject
            html body.toString()
        }

        render command as JSON
    }

    protected String generateLink(String action, linkParams) {
        createLink(base: "velo-omsk.org",
                controller: 'register', action: action,
                params: linkParams)
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

@Validateable
class RegisterCommand  {

    String username
    String email
    String password
    String password2

    static constraints = {
        username blank: false, validator: { value, command ->
            if (value) {
                User User = new User(username: value)
                if (User.findByUsername(value)) {
                    return 'registerCommand.username.unique'
                }
            }
        }
        email blank: false, email: true
        password blank: false, validator: grails.plugins.springsecurity.ui.RegisterController.passwordValidator
        password2 validator: grails.plugins.springsecurity.ui.RegisterController.password2Validator
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

