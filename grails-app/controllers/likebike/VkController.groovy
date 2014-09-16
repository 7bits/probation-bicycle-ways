package likebike

class VkController {

    def VKService
    def vKPresenter

    def auth() {
        redirect(vKPresenter.auth(VKService.auth(params['uid'], params['hash'], params['first_name'], params['last_name'])))
    }
}
