package likebike.presenters

import grails.util.Holders
import org.springframework.context.i18n.LocaleContextHolder

class HomePresenter{

    def index = {
        return [view: 'index']
    }

    def map(def loaded) {
        if(loaded) {
            def messageSource = Holders.applicationContext.getBean("messageSource")
            if (loaded == "true") {
                def successMessage = messageSource.getMessage('route.fileLoad.successMessage', null, LocaleContextHolder.getLocale())
                return [ view: 'map', model: [loadedCode: true, loadedMessage: successMessage]]
            } else {
                def errorsMessage = messageSource.getMessage('route.fileLoad.errorMessage', null, LocaleContextHolder.getLocale())
                return [ view: 'map', model: [loadedCode: false, loadedMessage: errorsMessage]]

            }
        }
        return [view: 'map']
    }
}