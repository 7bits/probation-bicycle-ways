package likebike

class HomeController {

    def index = {
        def command = new RegisterCommand()
        render view: 'index', model: [command: command]
    }

}