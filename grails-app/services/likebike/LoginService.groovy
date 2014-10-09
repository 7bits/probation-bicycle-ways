package likebike

import grails.util.Holders
import org.springframework.context.i18n.LocaleContextHolder
@Grab(group='org.codehaus.groovy.modules.http-builder', module='http-builder', version='0.5.0-RC2' )
import groovyx.net.http.*
import static groovyx.net.http.ContentType.*
import static groovyx.net.http.Method.*

/**
 * Responsible for logging users in and out
 */
class LoginService {
    def springSecurityService
    def messageSource
    def grailsLinkGenerator
    static final int MAX_NUMBER_OF_IVANS = 100;

    def code(String code){
        def http = new HTTPBuilder( 'https://oauth.vk.com' )
        def String appUrl = grailsLinkGenerator.link( action: 'vk', controller:'login', absolute:true)
        // perform a GET request, expecting JSON response data
        def response
        http.request( POST, JSON ) {
            uri.path = 'access_token'
            uri.query = [ client_id:Holders.config.apiId, client_secret: Holders.config.vkSecretKey, code:code, redirect_uri: appUrl]

            // response handler for a success response code:
            response.success = { resp, json ->
                response = json
            }

            // handler for any failure status code:
            response.failure = { resp ->
                response = resp
            }
        }
        vk(response['uid'], response['hash'], response['first_name'], response['last_name'])
    }
    /**
     * Used to authenticate user with his VK account. Should be correspondent to current VK API
     * @param uid user's VK id
     * @param usersHash Hash that VK gives us to confirm this user's session
     * @param firstName First Name of logging user
     * @param lastName Last Name of logging user
     */
    def vk(String uid, String usersHash, String firstName, String lastName) {
        String secretKey = Holders.config.vkSecretKey
        String API_ID = Holders.config.apiId
        def ourHash = (API_ID + uid + secretKey).encodeAsMD5()
        if (usersHash == ourHash) {
            def user = User.findByUid(uid)
            if (!user) {
                def username = firstName + " " + lastName
                if (User.findByUsername(username)) {
                    int i;
                    for (i = 1; i < MAX_NUMBER_OF_IVANS; i++) {
                        if (!User.findByUsername(username + i)) {
                            username += i
                            break
                        }
                    }
                    if (i == MAX_NUMBER_OF_IVANS) {
                        return "IvanError"
                    }
                }
                user = new User(username: username,
                        uid: uid,
                        enabled: true,
                        email: ""
                )
                user.save(flush: true)
                def roleUser = Role.findByAuthority('ROLE_USER')
                UserRole.create(user, roleUser, true)
           }
            springSecurityService.reauthenticate(user.username)
        }
    }

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

    /**
     * @return [logged: boolean, username: String]
     */
    def checkAuth = {
        return [logged: springSecurityService.isLoggedIn(), username: springSecurityService.authentication.name]
    }
}
