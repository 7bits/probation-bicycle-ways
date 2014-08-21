package likebike

class VkController {

    def springSecurityService

    def auth() {
        def params = params
        String uid = params['uid']
        String secret_key = "YIe1xEs8vWkImchof0Ll";
        String API_ID = "4512659"
        def hash = params['hash']
        def ourHash = (API_ID + uid + secret_key).encodeAsMD5()
        if (hash == ourHash) {
            def user = likebike.User.findByUid(uid)
            if (!user) {
                user = new likebike.User(username: params['first_name'] + " " + params['last_name'],
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
