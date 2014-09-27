package likebike
import grails.plugin.cache.Cacheable
import grails.util.Holders
import org.xml.sax.SAXParseException

class RouteService {

    def fileService
    def springSecurityService

    def fetchUsersRoute() {
        def user = springSecurityService.getCurrentUser()
        if(user == null){
            user = User.find { username == "anonymous" }
        }
        def route = fetchUsersRoute(user)
        return route
    }

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

    @Cacheable('routes')
    def fetchRoute() {
        return convertRouteListToArray(Route.list())
    }

    void loadFromFile(String xml, currentUser) throws SAXParseException {
        def data = new XmlParser().parseText(xml)

        Route route = new Route()
        route.user = currentUser
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

    def fetchUsersRoute(currentUser) {
        return convertRouteListToArray(currentUser.route)
    }

    private def convertRouteListToArray(routes) {
        def routeArray = [];
        def i = 0;
        def indexPoint = 0;
        final int removeCount = 10;
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
