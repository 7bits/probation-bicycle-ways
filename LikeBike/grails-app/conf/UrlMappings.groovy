import likebike.RegisterCommand

class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}
		"/"(controller: "home", action: "index")
		"/map"(view:"/map")
		"500"(view:'/error')
	}
}
