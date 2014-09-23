package likebike

class VkController {

    def VKService
    def vKPresenter

    /**
     *  Handles VK authorisation.
     *  params should be correspondent to vk api
     */
    def auth = {
        redirect(vKPresenter.auth(VKService.auth(params['uid'], params['hash'], params['first_name'], params['last_name'])))
    }
}
