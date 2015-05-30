import likebike.presenters.LoginPresenter
import likebike.presenters.RegisterPresenter
import likebike.presenters.HomePresenter
import likebike.presenters.RoutePresenter
import likebike.repository.FileRepository

beans = {
    registerPresenter(RegisterPresenter) {
    }
    homePresenter(HomePresenter) {
    }
    routePresenter(RoutePresenter) {
    }
    loginPresenter(LoginPresenter){
    }
    fileRepository(FileRepository){
    }
}
