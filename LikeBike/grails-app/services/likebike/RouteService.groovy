package likebike

class RouteService {

    void loadFromFile(String xml, def currentUser) {
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

    void genRoute(ArrayList<Double> listPoints) {
        Route route = new Route()
        route.name = "generationRoute"
        route.save()

        //log.error(listPoints.size())
        for (int i = 0; i < listPoints.size(); i += 2) {
            //log.error(i)
            //log.error(listPoints.get(i))
            Point point = new Point()
            point.latitude = listPoints.get(i).toDouble()
            point.longitude = listPoints.get(i + 1).toDouble()
            point.routeIndex = i / 2
            point.route = route
            point.save(flush: true)
        }
    }

    def getUsersRoute(def currentUser) {
        return convertRouteListToArray(currentUser.route)
    }

    def getRoute() {
        return convertRouteListToArray(Route.list())
    }

    def convertRouteListToArray(def routes) {
        def routeArray = [];
        def i = 0;
        routes.each {
            //def routeName = it.name;
            def Points = [];
            it.point.each {
                Points[it.routeIndex] = [it.latitude, it.longitude];
            }
            routeArray[i] = Points;
            i = i + 1;
        }
        return routeArray
    }
}
