package likebike

import likebike.presenters.HomePresenter

class HomeController {
    static final HomePresenter homePresenter = new HomePresenter()

    def index = {
        render homePresenter.index()
    }

    def map = {
        render homePresenter.map(params.loaded)
        return
    }
}