package likebike

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.*

class UserController extends grails.plugins.springsecurity.ui.UserController {

	def getAllUser() {
		def users = User.list()
		render users as JSON
	}
}
