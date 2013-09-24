package likebike

import org.apache.commons.validator.EmailValidator
import org.codehaus.groovy.grails.plugins.springsecurity.NullSaltSource
import org.codehaus.groovy.grails.plugins.springsecurity.ui.RegistrationCode
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import org.codehaus.groovy.grails.commons.ApplicationHolder as AH
import grails.converters.*

class RegisterController extends grails.plugins.springsecurity.ui.RegisterController {

    def register = {

        def outErrors = [
            hasError: false,
            username: 'right',
            email: 'right',
            password: 'right',
            password2: 'right'
        ]

        if(params['username'] =='') {
            outErrors.username = 'empty'
        }
        else {
            if(lookupUserClass().findByUsername(params['username'])) {
                outErrors.username = 'userNameHold'
            }
        }
        if(params['email'] =='') {
            outErrors.email = 'empty'
        }
        if(params['password'] =='') {
            outErrors.password = 'empty'
        }
        if(params['password2'] =='') {
            outErrors.password2 = 'empty'
        }

        if(params['password2'] != params['password']) {
            outErrors.password2 = 'passwordNotMatch'
        }

        if(!EmailValidator.getInstance().isValid(params['email'])) {
            outErrors.email = 'emailNotValide'
        }

        if(( outErrors.username != 'right')||(outErrors.email != 'right')||(outErrors.password != 'right')||(outErrors.password2 != 'right') ) {
            outErrors.hasError = true
            render outErrors as JSON
            return
        }

        def command = new RegisterCommand()
        command.setUsername(params['username'])
        command.setEmail(params['email'])
        command.setPassword(params['password'])
        command.setPassword2(params['password2'])

        //if (command.hasErrors()) {
        //    //redirect(controller: "home", action: "index", model: [command: command])
        //    render command as JSON
        //}

        String salt = saltSource instanceof NullSaltSource ? null : command.username
        //not encode password
        String password = command.password //springSecurityService.encodePassword(command.password)
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

        render command as JSON
    }
    /*
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
    */

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

