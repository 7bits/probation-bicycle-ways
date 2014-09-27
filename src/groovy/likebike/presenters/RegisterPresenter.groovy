package likebike.presenters

import grails.converters.JSON
import grails.util.Holders
import org.springframework.context.i18n.LocaleContextHolder

class RegisterPresenter {

    def register(def result) {
        if(result instanceof Map) {
            return result as JSON
        }
        else{
            def out = [:]
            result.each {
                out.put(it.field, Holders.applicationContext.getBean("messageSource").getMessage(it, LocaleContextHolder.getLocale()))
            }   //Refactor on your own risk
            out.put('status', false)
            return out as JSON
        }

    }
}
