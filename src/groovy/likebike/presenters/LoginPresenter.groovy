package likebike.presenters

import grails.converters.JSON
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

import javax.servlet.http.HttpServletResponse

/**
 * Created by roman on 27.09.14.
 */
class LoginPresenter {

    /**
     * Callback after a failed login. Redirects to the auth page with a warning message.
     */
    def authfail(result) {
        return result as JSON
    }

    /**
     * The Ajax success redirect url.
     */
    def ajaxSuccess(result) {
        return result as JSON
    }

    def checkAuth(result) {
        return result as JSON
    }
}
