package likebike.presenters

import grails.converters.JSON

class RoutePresenter {

    def getRoute(result) {
        return result as JSON
    }

    def getUsersRoute(result) {
        return result as JSON
    }

    def getProcessed(result){
        return result as JSON
    }

    def loadFile(loaded) {
        if (loaded) {
            return [uri: '/home/map?loaded=true']
        }
        return [uri: '/home/map?loaded=false']
    }
}
