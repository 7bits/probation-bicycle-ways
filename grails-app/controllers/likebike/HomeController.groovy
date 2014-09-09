package likebike

class HomeController {

    def index = {
        render view: 'index'
    }

    def map = {
        if(params.loaded) {
            def params = params
            if (params.loaded == "true") {
                render view: 'map', model: [loadedCode: true, loadedMessage: "Ваш файл был загружен"]
                return
            } else {
                render( view: 'map', model: [loadedCode: false, loadedMessage: "Ваш файл не был загружен"])
                return
            }
        }
        render view: 'map'
        return
    }
}