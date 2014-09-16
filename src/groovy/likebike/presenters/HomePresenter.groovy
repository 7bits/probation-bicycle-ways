package likebike.presenters

class HomePresenter{

    def index = {
        return [view: 'index']
    }

    def map(def loaded) {
        if(loaded) {
            if (loaded == "true") {
                return [ view: 'map', model: [loadedCode: true, loadedMessage: "Ваш файл был загружен"]]
            } else {
                return [ view: 'map', model: [loadedCode: false, loadedMessage: "Ваш файл не был загружен"]]

            }
        }
        return [view: 'map']

    }
}