package likebike

import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import org.springframework.context.i18n.LocaleContextHolder

class LoginService {
    def springSecurityService
    def messageSource

    /**
     * Callback after a failed login. Redirects to the auth page with a warning message.
     */
    def authfail = {
        return [success: false, errorMessage: messageSource.getMessage("springSecurity.errors.login.fail", null, LocaleContextHolder.getLocale())]
    }

    /**
     * The Ajax success redirect url.
     */
    def ajaxSuccess = {
        return [success: true, username: springSecurityService.authentication.name]
    }

    def checkAuth = {
        return [logged: springSecurityService.isLoggedIn(), username: springSecurityService.authentication.name]
    }

    def logout = {
        return SpringSecurityUtils.securityConfig.logout.filterProcessesUrl
    }
}
