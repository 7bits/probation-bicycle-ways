package likebike

import grails.plugin.cache.Cacheable
import grails.util.Holders
import org.xml.sax.SAXParseException

/**
 * Responsible for all routes activity
 */
class RouteService {

    def fileService
    def springSecurityService

    /**
     * Returns all routes of current user.
     * @return list that represents all routes of user or empty list if there is no user or routes
     */
    def fetchUsersRoute() {
        def user = springSecurityService.getCurrentUser()
        if(user == null){
            user = User.find { username == "anonymous" }
        }
        def route = fetchUsersRoute(user)
        return route
    }

    /**
     * Get processed files of current user
     * @return list of pairs [file name, processed code] or ['error':'no user'] if there is no user
     */
    def fetchProcessed(){
        def user = springSecurityService.getCurrentUser()
        def id = user?.id
        if(id) {
            def rows = fileService.fetchProcessed(id)
            List filesList = []
            rows.each() {
                File file = File.findById(it['id'])
                filesList << [file.fileName, file.processed]
                file.userAlert = true
                file.save(flush: true)
            }
            return filesList
        }
        return ['error':'no user']
    }

    /**
     * Processes user files. Sends it to databases to deferred processing.
     * @param formFile binary data that is file
     * @return returns false if there is file and it isn't empty and true otherwise
     */
    def loadFile(formFile) {
        if (formFile && formFile.size) {
            File file = new likebike.File()
            file.user = springSecurityService.getCurrentUser()
            file.userAlert = false
            if(file.user == null){
                file.user = User.find { username == "anonymous" }
                file.userAlert = true
            }
            file.processed = File.NOT_PROCESSED
            file.fileName = formFile.fileItem.name
            file.save()
            String xmlData = new String(formFile.bytes)
            java.io.File fileToProcess = new java.io.File(Holders.config.pathToUsersFiles + file.id + ".userfile")
            fileToProcess.write(xmlData)
            return true
        }
        return false
    }

    /**
     * Collects all routes from database and caches it if it is not cached already.
     * @return all routes from database if cache is empty
     */
    def fetchRoute() {
        return convertRouteListToArray(Route.list())
    }

    /**
     * Parses xml String and sends it to database
     * @param xml String with xml that represents gpx format route file.
     * @param user id of user which is uploader of this file.
     * @throws SAXParseException if there is error in xml structure
     */
    void loadFromFile(String xml, user) throws SAXParseException {
        def data = new XmlParser().parseText(xml)

        Route route = new Route()
        route.user = user
        route.name = data.trk.name.text()
        route.save()
        for (int i = 0; data.trk.trkseg.trkpt[i] != null; i++) {
            Point point = new Point()
            point.latitude = data.trk.trkseg.trkpt[i].attributes().lat.toDouble()
            point.longitude = data.trk.trkseg.trkpt[i].attributes().lon.toDouble()
            point.routeIndex = i
            point.route = route
            point.save(flush: true)
        }
    }

    /**
     * Returns all routes of given user
     * @param user User type containing user's routes
     * @return Array that represents routes of given user
     */
    def fetchUsersRoute(user) {
        return convertRouteListToArray(user.route)
    }

    /**
     * Converts route list to array
     * @param routes - route list
     * @return - array
     */
    private def convertRouteListToArray(routes) {
        def routeArray = [];
        def i = 0;
        def indexPoint = 0;
        final int removeCount = 5;
        routes.each {
            //def routeName = it.name;
            def Points = [];
            it.point.each {
                if (it.routeIndex % removeCount == 0) {
                    indexPoint = (int)it.routeIndex / removeCount
                    Points[indexPoint] = [it.latitude, it.longitude];
                }
            }
            routeArray[i] = Points;
            i = i + 1;
        }
        return routeArray
    }


}
