package likebike

class HomeController {

    def index = {
        render view: 'index'
    }
    def map = {
        render view: '/home/map'
    }
    def header = {
        render view: 'header'
    }
    def footer = {
        render view: 'footer'
    }
}