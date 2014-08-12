package likebike

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.*
import grails.plugins.springsecurity.Secured
import org.springframework.web.multipart.MultipartHttpServletRequest

class RouteController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST", load_file: "GET"]

    def fileService
    def routeService
    def SpringSecurityService

    def getUsersRoute() {
        def user = SpringSecurityService.getCurrentUser()
        if(user == null){
            user = User.find { username == "anonymous" }
        }
        def route = routeService.getUsersRoute(user)
        render route as JSON
    }

    @Secured(['ROLE_ADMIN'])
    def genRoute() {

        ArrayList<Double> searchFields = request.getParameterValues('array[]')
        routeService.genRoute(searchFields)

        def out = ["route is imported"]

        render out as JSON
    }

    def generateRoute() {
    }

    def getProcessed(){
        if(params.id) {
            def rows = fileService.getProcessed(params.id)
            List resultList = []
            rows.each() {
                resultList << it['file_name']
                fileService.setAlert(it['id'])
            }
            render resultList as JSON
        }
        def error = ['error':'no user']
        render error as JSON
    }

    def loadFile() {
        if (params.userFile.size) {
            File file = new likebike.File()
            file.user = SpringSecurityService.getCurrentUser()
            file.user_alert = false
            if(file.user == null){
                file.user = User.find { username == "anonymous" }
                file.user_alert = true
            }
            file.processed = false
            def params = params
            file.file_name = params.userFile.fileItem.name
            file.save()
            String xmlData = new String(params.userFile.bytes)
            java.io.File fileToProcess = new java.io.File("userfiles/" + file.id + ".userfile")
            fileToProcess.write(xmlData)
            redirect(uri: '/map?loaded=true')
            return
        }
        redirect(uri: '/map?loaded=false')
        return
    }

    def getRoute() {
        def route = routeService.getRoute()
        render route as JSON
    }

    @Secured(['ROLE_ADMIN'])
    def index() {
        redirect(action: "list", params: params)
    }

    @Secured(['ROLE_ADMIN'])
    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [routeInstanceList: Route.list(params), routeInstanceTotal: Route.count()]
    }

    @Secured(['ROLE_ADMIN'])
    def create() {
        [routeInstance: new Route(params)]
    }

    @Secured(['ROLE_ADMIN'])
    def save() {
        def routeInstance = new Route(params)
        if (!routeInstance.save(flush: true)) {
            render(view: "create", model: [routeInstance: routeInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'route.label', default: 'Route'), routeInstance.id])
        redirect(action: "show", id: routeInstance.id)
    }

    @Secured(['ROLE_ADMIN'])
    def show(Long id) {
        def routeInstance = Route.get(id)
        if (!routeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'route.label', default: 'Route'), id])
            redirect(action: "list")
            return
        }

        [routeInstance: routeInstance]
    }

    @Secured(['ROLE_ADMIN'])
    def edit(Long id) {
        def routeInstance = Route.get(id)
        if (!routeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'route.label', default: 'Route'), id])
            redirect(action: "list")
            return
        }

        [routeInstance: routeInstance]
    }

    @Secured(['ROLE_ADMIN'])
    def update(Long id, Long version) {
        def routeInstance = Route.get(id)
        if (!routeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'route.label', default: 'Route'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (routeInstance.version > version) {
                routeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'route.label', default: 'Route')] as Object[],
                        "Another user has updated this Route while you were editing")
                render(view: "edit", model: [routeInstance: routeInstance])
                return
            }
        }

        routeInstance.properties = params

        if (!routeInstance.save(flush: true)) {
            render(view: "edit", model: [routeInstance: routeInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'route.label', default: 'Route'), routeInstance.id])
        redirect(action: "show", id: routeInstance.id)
    }

    @Secured(['ROLE_ADMIN'])
    def delete(Long id) {
        def routeInstance = Route.get(id)
        if (!routeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'route.label', default: 'Route'), id])
            redirect(action: "list")
            return
        }

        try {
            routeInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'route.label', default: 'Route'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'route.label', default: 'Route'), id])
            redirect(action: "show", id: id)
        }
    }
}
