package likebike

import grails.plugin.cache.CacheEvict
import org.springframework.dao.DataIntegrityViolationException
import grails.converters.*
import grails.plugins.springsecurity.Secured
import grails.plugin.cache.CacheEvict

class RouteController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST", load_file: "GET"]
    def routeService
    def routePresenter

    def getUsersRoute() {
        render routePresenter.getUsersRoute(routeService.getUsersRoute())
    }

    def getProcessed(){
        def id = params.id
        render routePresenter.getProcessed(routeService.getProcessed(id))
    }

    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    def loadFile() {
        def file = params.userFile
        redirect routePresenter.loadFile(routeService.loadFile(file))
        return
    }

    def getRoute() {
        render routePresenter.getRoute(routeService.getRoute())
    }
}
