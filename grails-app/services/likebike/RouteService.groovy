package likebike

import grails.converters.JSON
import grails.plugin.cache.Cacheable
import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException
import org.xml.sax.SAXParseException

class RouteService {

    def fileService
    def springSecurityService

    def getUsersRoute() {
        def user = springSecurityService.getCurrentUser()
        if(user == null){
            user = User.find { username == "anonymous" }
        }
        def route = getUsersRoute(user)
        return route
    }

    def getProcessed(){
        def user = springSecurityService.getCurrentUser()
        def id = user.id
        if(id) {
            def rows = fileService.getProcessed(id)
            List filesList = []
            rows.each() {
                filesList << [it['file_name'], it['processed']]
                fileService.setAlert(it['id'])
            }
            return [successMessage: "Обработаны файлы: ", errorMessage: "Неправильный формат файла в: ", list: filesList]
        }
        return ['error':'no user']
    }

    def loadFile(def formFile) {
        if (formFile && formFile.size) {
            File file = new likebike.File()
            file.user = springSecurityService.getCurrentUser()
            file.user_alert = false
            if(file.user == null){
                file.user = User.find { username == "anonymous" }
                file.user_alert = true
            }
            file.processed = File.NOT_PROCESSED
            file.file_name = formFile.fileItem.name
            file.save()
            String xmlData = new String(formFile.bytes)
            java.io.File fileToProcess = new java.io.File("userfiles/" + file.id + ".userfile")
            fileToProcess.write(xmlData)
            return true
        }
        return false
    }

    @Cacheable('routes')
    def getRoute() {
        return convertRouteListToArray(Route.list())
    }

    void loadFromFile(String xml, def currentUser) throws SAXParseException {
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

    def getUsersRoute(currentUser) {
        return convertRouteListToArray(currentUser.route)
    }

    def convertRouteListToArray(def routes) {
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
