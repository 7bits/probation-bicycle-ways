import grails.converters.JSON

class LoginController {

    def springSecurityService

    def success = {
        render([success: springSecurityService.isLoggedIn()] as JSON)
    }
}
