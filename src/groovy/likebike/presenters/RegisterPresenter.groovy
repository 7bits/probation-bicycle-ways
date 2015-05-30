package likebike.presenters

import grails.converters.JSON
import grails.util.Holders
import org.springframework.context.i18n.LocaleContextHolder

class RegisterPresenter {

    /**
     * Returns json with data about registration success
     * @param result errors object of there is any or empty map if there is not
     * @return json with [status: false, and list of errors] if there is errors and [status: true] if there is not
     */
    def register(def result) {
        if(result instanceof Map) {
            return ['status': true] as JSON
        }
        else{
            def out = [:]
            def messageSource = Holders.applicationContext.getBean("messageSource")
            result.each {
                out.put(it.field, messageSource.getMessage(it, LocaleContextHolder.getLocale()))
            }   //Refactor on your own risk
            out.put('status', false)
            return out as JSON
        }

    }
}
