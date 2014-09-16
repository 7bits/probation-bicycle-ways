package likebike

class HomeController {
    def homePresenter

    def index = {
        render homePresenter.index()
    }

    def map = {
        render homePresenter.map(params.loaded)
        return
    }
}