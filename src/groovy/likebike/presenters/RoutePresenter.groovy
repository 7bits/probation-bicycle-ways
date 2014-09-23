package likebike.presenters

import grails.artefact.Artefact
import grails.converters.JSON
import grails.util.Holders
import org.springframework.context.i18n.LocaleContextHolder

class RoutePresenter {
    static def messageSource = Holders.applicationContext.getBean("messageSource")

    def fetchRoute(result) {
        return result as JSON
    }

    def fetchUsersRoute(result) {
        return result as JSON
    }

    def fetchProcessed(result){
        def out = [successMessage: messageSource.getMessage('route.getProcessed.successMessage', null, null, LocaleContextHolder.getLocale()),
         errorMessage: messageSource.getMessage('route.getProcessed.errorMessage', null, null, LocaleContextHolder.getLocale()),
         list: result]
        return out as JSON
    }

    def loadFile(loaded) {
        if (loaded) {
            return [uri: '/home/map?loaded=true']
        }
        return [uri: '/home/map?loaded=false']
    }
}
