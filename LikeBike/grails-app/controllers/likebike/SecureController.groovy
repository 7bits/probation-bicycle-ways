package likebike

import grails.plugins.springsecurity.Secured

class SecureController {

	@Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def index() {
    	render 'Secure access only'
    }
}
