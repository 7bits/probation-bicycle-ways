import likebike.Role
import likebike.User
import likebike.UserRole

class BootStrap {

    def init = { servletContext ->
        environments {
            production {
                // prod initialization
                def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
                def userRole = new Role(authority: 'ROLE_USER').save(flush: true)

                def testUser = new User(username: 'me', enabled: true, password: 'password')
                testUser.save(flush: true)

                UserRole.create testUser, adminRole, true
            }
            test {
                // test initialization
                def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
                def userRole = new Role(authority: 'ROLE_USER').save(flush: true)

                def testUser = new User(username: 'me', enabled: true, password: 'password')
                testUser.save(flush: true)

                UserRole.create testUser, adminRole, true
            }
            development {
                // dev initialization
                def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
                def userRole = new Role(authority: 'ROLE_USER').save(flush: true)

                def testUser = new User(username: 'me', enabled: true, password: 'password')
                testUser.save(flush: true)

                UserRole.create testUser, adminRole, true
                // do custom init for dev here
            }

        }
    }

    def destroy = {
    }

}
