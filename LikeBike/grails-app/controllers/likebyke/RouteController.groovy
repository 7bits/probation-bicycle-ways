package likebyke

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.*

class RouteController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    
    def get_route() {
        def routes = [ Route.list() ];
        def route = [];
        def i = 0;
        Route.list().each{
            //def routeName = it.name;
            def Points = [];
            it.point.each{
                Points[it.route_index] = [it.latitude, it.longitude];
            }
            route[i] = Points;
            i = i + 1;        
        }
        render route as JSON
    }

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [routeInstanceList: Route.list(params), routeInstanceTotal: Route.count()]
    }

    def create() {
        [routeInstance: new Route(params)]
    }

    def save() {
        def routeInstance = new Route(params)
        if (!routeInstance.save(flush: true)) {
            render(view: "create", model: [routeInstance: routeInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'route.label', default: 'Route'), routeInstance.id])
        redirect(action: "show", id: routeInstance.id)
    }

    def show(Long id) {
        def routeInstance = Route.get(id)
        if (!routeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'route.label', default: 'Route'), id])
            redirect(action: "list")
            return
        }

        [routeInstance: routeInstance]
    }

    def edit(Long id) {
        def routeInstance = Route.get(id)
        if (!routeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'route.label', default: 'Route'), id])
            redirect(action: "list")
            return
        }

        [routeInstance: routeInstance]
    }

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
