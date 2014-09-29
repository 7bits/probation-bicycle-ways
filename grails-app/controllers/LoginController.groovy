import javax.servlet.http.HttpServletResponse
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

class LoginController {
    def loginPresenter
    def loginService
    /**
     * The redirect action for Ajax requests.
     */
    def authAjax = {
        response.setHeader 'Location', SpringSecurityUtils.securityConfig.auth.ajaxLoginFormUrl
        response.sendError HttpServletResponse.SC_UNAUTHORIZED
    }

    /**
     * Callback after a failed login. Redirects to the auth page with a warning message.
     */
    def authfail() {
        render loginPresenter.authfail(loginService.authfail())
    }

    /**
     * The Ajax success redirect url.
     */
    def ajaxSuccess = {
        render loginPresenter.ajaxSuccess(loginService.ajaxSuccess())
    }

    /**
     * Check if user is authenticated
     */
    def checkAuth = {
        render loginPresenter.checkAuth(loginService.checkAuth())
    }

    /**
     * Logging user out
     */
    def logout = {
        redirect url: SpringSecurityUtils.securityConfig.logout.filterProcessesUrl
    }
}
