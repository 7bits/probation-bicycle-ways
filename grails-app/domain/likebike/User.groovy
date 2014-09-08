package likebike

import org.apache.commons.validator.EmailValidator

class User {

    transient springSecurityService
    static hasMany = [route: Route]

    String username
    String password
    boolean enabled
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired
    String uid

    static constraints = {
        username blank: false, unique: true
        uid blank: true
        password maxSize: 64, minSize: 8
    }

    static mapping = {
        password column: '`password`'
    }

    Set<Role> getAuthorities() {
        UserRole.findAllByUser(this).collect { it.role } as Set
    }

    def beforeInsert() {
        encodePassword()
    }

    def beforeUpdate() {
        if (isDirty('password')) {
            encodePassword()
        }
    }

    protected void encodePassword() {
        password = springSecurityService.encodePassword(password)
    }
}