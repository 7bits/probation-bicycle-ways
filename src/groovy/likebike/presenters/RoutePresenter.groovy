package likebike.presenters

import grails.converters.JSON
import grails.util.Holders
import org.springframework.context.i18n.LocaleContextHolder

class RoutePresenter {

    def fetchRoute(result) {
        return result as JSON
    }

    def fetchUsersRoute(result) {
        return result as JSON
    }

    /**
     * Takes messages from messageSource and
     * @param result
     * @return
     */
    def fetchProcessed(result){
        def messageSource = Holders.applicationContext.getBean("messageSource")
        def out = [successMessage: messageSource.getMessage('route.getProcessed.successMessage',\
                                                            null,\
                                                            LocaleContextHolder.getLocale()),
         errorMessage: messageSource.getMessage('route.getProcessed.errorMessage',\
                                                null,\
                                                LocaleContextHolder.getLocale()),
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
