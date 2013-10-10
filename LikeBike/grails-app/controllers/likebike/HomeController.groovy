package likebike

class HomeController {

    def index = {
        render view: 'index'
    }
    def map = {
        render view: 'map'
    }
    def header = {
        render view: 'header'
    }
    def footer = {
        render view: 'footer'
    }

}