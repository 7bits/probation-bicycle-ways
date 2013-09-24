package likebike

class HomeController {

    def index = {
        render view: 'index'
    }
    def map = {
        render view: 'map'
    }

}