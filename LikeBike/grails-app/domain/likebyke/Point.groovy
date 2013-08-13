package likebyke

class Point {
	double latitude
    double longitude
	int route_index

	Route route

	static constraints = {
        latitude size: 1..9, scale: 6, blank: false, unique: false
		longitude size: 1..9, scale: 6, blank: false, unique: false
		route_index size: 1..15, blank: false, unique: false         
    }
}
