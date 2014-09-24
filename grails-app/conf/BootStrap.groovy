import likebike.Role
import likebike.User
import likebike.UserRole

class BootStrap {

    def init = {
        servletContext ->
        environments {
            production {
                // prod initialization
                def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
                def userRole = new Role(authority: 'ROLE_USER').save(flush: true)

                def admin = new User(username: 'me', enabled: true, password: 'password', uid: "", email: '')
                admin.save(flush: true)

                UserRole.create admin, adminRole, true

                def user1 = new User(username: 'OtherUser', enabled: true, password: '87654321', uid: "", email: '')
                user1.save(flush: true)

                UserRole.create user1, userRole, true

                def user2 = new User(username: 'User', enabled: true, password: '12345678', uid: "", email: '')
                user2.save(flush: true)

                UserRole.create user2, userRole, true
            }
            test {
                // test initialization
                def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
                def userRole = new Role(authority: 'ROLE_USER').save(flush: true)

                def admin = new User(username: 'me', enabled: true, password: 'password', uid: "", email: '')
                admin.save(flush: true)

                UserRole.create admin, adminRole, true

                def user1 = new User(username: 'OtherUser', enabled: true, password: '87654321', uid: "", email: '')
                user1.save(flush: true)

                UserRole.create user1, userRole, true

                def user2 = new User(username: 'User', enabled: true, password: '12345678', uid: "", email: '')
                user2.save(flush: true)

                UserRole.create user2, userRole, true
            }
            development {
                def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
                def userRole = new Role(authority: 'ROLE_USER').save(flush: true)

                def admin = new User(username: 'me', enabled: true, password: 'password', uid: "", email: '')
                admin.save(flush: true)

                UserRole.create admin, adminRole, true

                def user1 = new User(username: 'OtherUser', enabled: true, password: '87654321', uid: "", email: '')
                user1.save(flush: true)

                UserRole.create user1, userRole, true

                def user2 = new User(username: 'User', enabled: true, password: '12345678', uid: "", email: '')
                user2.save(flush: true)

                UserRole.create user2, userRole, true
            }

        }
    }

    def destroy = {
    }

}
