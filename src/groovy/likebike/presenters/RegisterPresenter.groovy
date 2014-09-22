package likebike.presenters

import grails.converters.JSON

class RegisterPresenter {

    def register(def result) {
        return result as JSON
    }
}
