package likebike

/**
 * Named route
 */
class Route {

    static hasMany = [point: Point]
    String name

    User user
    static constraints = {
        name blank: false, unique: false, size: 1..30
    }
}
