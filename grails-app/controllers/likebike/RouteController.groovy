package likebike

import grails.plugin.cache.Cacheable
import grails.plugins.springsecurity.Secured

/**
 * Class responsible for handling everything related to routes
 */
class RouteController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST", load_file: "GET"]
    def routeService
    def routePresenter

    /**
     *  Returns all routes of current user
     */
    def fetchUsersRoute = {
        render routePresenter.fetchUsersRoute(routeService.fetchUsersRoute())
    }

    /**
     *  Returns processed files. Two lists, contains successfully processed and processed with error routes.
     */
    def fetchProcessed = {
        render routePresenter.fetchProcessed(routeService.fetchProcessed())
    }

    /**
     *  Handles file loading
     *  params should contain userFile - file with route
     */
    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    def loadFile = {
        def file = params.userFile
        redirect routePresenter.loadFile(routeService.loadFile(file))
    }

    /**
     * Returns all routes
     */

    @Cacheable('routes')
    def fetchRoute() {
        render routePresenter.fetchRoute(routeService.fetchRoute())
    }
}
