package likebike

import grails.util.Holders

class VkController {

    static final int MAX_NUMBER_OF_IVANS = 100;

    def springSecurityService

    def auth() {
        String uid = params['uid']
        String secretKey = Holders.config.vkSecretKey
        String API_ID = Holders.config.apiId
        def hash = params['hash']
        def ourHash = (API_ID + uid + secretKey).encodeAsMD5()
        if (hash == ourHash) {
            def user = likebike.User.findByUid(uid)
            if (!user) {
                def username = params['first_name'] + " " + params['last_name']
                if(likebike.User.findByUsername(username)) {
                    int i;
                    for (i = 1; i < MAX_NUMBER_OF_IVANS; i++) {
                        if (!likebike.User.findByUsername(username + i)) {
                            username += i
                            break
                        }
                    }
                    if(i == MAX_NUMBER_OF_IVANS){
                        render "У нас и так хватает людей с именем, таким же, как ваше. Убирайтесь или, либо смените имя."
                    }
                }
                user = new likebike.User(username: username,
                        uid: uid,
                        enabled: true,
                        password: hash
                )
                user.save(flush: true)
                def roleUser = Role.findByAuthority('ROLE_USER')
                UserRole.create(user, roleUser, true)
            }
            springSecurityService.reauthenticate(user.username)
        }
        redirect(controller: 'home', action: 'index')
    }
}
