package likebyke

class Route {
	static hasMany = [point:Point]	
	String name

	static constraints = {
        name blank: false, unique: false, size: 1..30 
    }
}
