package likebike

import grails.util.Holders

/**
 * Responsible for authenticating users with theirs VK account
 */
class VKService {
    static final int MAX_NUMBER_OF_IVANS = 100;
    def springSecurityService

    /**
     * Used to authenticate user with his VK account. Should be correspondent to current VK API
     * @param uid user's VK id
     * @param usersHash Hash that VK gives us to confirm this user's session
     * @param firstName First Name of logging user
     * @param lastName Last Name of logging user
     */
    def auth(String uid, String usersHash, String firstName, String lastName) {
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
}
