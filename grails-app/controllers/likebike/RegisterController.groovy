package likebike

/**
 * Responsible for registration of user.
 */
class RegisterController {
    def registerService
    def registerPresenter

    /**
     *  Registers user.
     *  params should contain form data
     *  username
     *  email
     *  password
     *  password2 password confirmation
     */
    def register = {
        RegisterForm form = new RegisterForm(params)
        render registerPresenter.register(registerService.register(form))
        return
    }

    /**
     * Handles register confirmation link
     * @param params.t - registration token from url
     */
    def verifyRegistration = {
        registerService.verifyRegistration(params.t)
        redirect controller:'home', action:'index'
        return
    }
}

