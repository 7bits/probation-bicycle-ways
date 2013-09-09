class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(view:"/index")
		"/map"(view:"/map")
		"/reg"(view:"/reg")
		"500"(view:'/error')
	}
}
