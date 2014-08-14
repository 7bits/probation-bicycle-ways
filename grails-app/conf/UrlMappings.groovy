import likebike.RegisterCommand

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?" {
            constraints {
                // apply constraints here
            }
        }
        "/"(controller: "home", action: "index")
        "/map"(view: "/home/map")
        "500"(view: '/error')
        "/bla"(view: "/home/_header")
        "/loginPage"(view: "/loginPage")
    }
}
