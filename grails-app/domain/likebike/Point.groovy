package likebike

class Point {
    double latitude
    double longitude
    int routeIndex

    Route route

    static constraints = {
        latitude size: 1..9, scale: 6, blank: false, unique: false
        longitude size: 1..9, scale: 6, blank: false, unique: false
        routeIndex size: 1..15, blank: false, unique: false
    }
}
