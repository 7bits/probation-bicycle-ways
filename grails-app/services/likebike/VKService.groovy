package likebike

import grails.util.Holders

class VKService {
    static final int MAX_NUMBER_OF_IVANS = 100;
    def springSecurityService

    def auth(String  uid, String usersHash, String firstName, String lastName) {
        String secretKey = Holders.config.vkSecretKey
        String API_ID = Holders.config.apiId
        def ourHash = (API_ID + uid + secretKey).encodeAsMD5()
        if (usersHash == ourHash) {
            def user = User.findByUid(uid)
            if (!user) {
                def username = firstName + " " + lastName
                if(User.findByUsername(username)) {
                    int i;
                    for (i = 1; i < MAX_NUMBER_OF_IVANS; i++) {
                        if (!User.findByUsername(username + i)) {
                            username += i
                            break
                        }
                    }
                    if(i == MAX_NUMBER_OF_IVANS){
                        return "IvanError"
                    }
                }
                user = new User(username: username,
                        uid: uid,
                        enabled: true,
                        email: ""
                )
                def roleUser = Role.findByAuthority('ROLE_USER')
                UserRole.create(user, roleUser, true)
                user.save(flush: true)
            }
            springSecurityService.reauthenticate(user.username)
        }
    }
}
