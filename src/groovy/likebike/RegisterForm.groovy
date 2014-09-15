package likebike

import grails.validation.Validateable
import org.codehaus.groovy.grails.web.servlet.mvc.GrailsParameterMap

@Validateable
class RegisterForm  {

    RegisterForm(GrailsParameterMap params){
        username = params['username']
        email = params['email']
        password = params['password']
        password2 = params['password2']
    }

    String username
    String email
    String password
    String password2

    static constraints = {
        username blank: false, validator: RegisterService.usernameValidator
        email blank: false, email: true
        password blank: false, validator: { val, obj ->
            if(!(grails.plugins.springsecurity.ui.RegisterController.checkPasswordMinLength(val, obj))){
                return 'registerForm.password.minSize'
            }
            if(!(grails.plugins.springsecurity.ui.RegisterController.checkPasswordMaxLength(val, obj))){
                return 'registerForm.password.maxSize'
            }
        }
        password2 validator: grails.plugins.springsecurity.ui.RegisterController.password2Validator
    }
}
