package likebike

/**
 * Responsible for core pages of the app
 */
class HomeController {
    def homePresenter

    /**
     * Handles main page
     */
    def index = {
        render homePresenter.index()
    }

    /**
     * Handles map page
     */
    def map = {
        render homePresenter.map(params.loaded)
        return
    }
}