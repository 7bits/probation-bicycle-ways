package likebike.presenters

import grails.converters.JSON
import grails.util.Holders
import org.springframework.context.i18n.LocaleContextHolder

class RegisterPresenter {
    static def messageSource = Holders.applicationContext.getBean("messageSource")

    def register(def result) {
        if(result instanceof Map) {
            return result as JSON
        }
        else{
            def out = [:]
            result.each {
                out.put(it.field, messageSource.getMessage(it, LocaleContextHolder.getLocale()))
                out.put('status', false)
            }
            return out as JSON
        }

    }
}
