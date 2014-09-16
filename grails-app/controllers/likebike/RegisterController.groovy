package likebike
class RegisterController {
    def registerService
    def registerPresenter

    def register = {
        RegisterForm form = new RegisterForm(params)
        render registerPresenter.register(registerService.register(form))
        return
    }
}

