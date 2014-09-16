package likebike.presenters

class VKPresenter {
    def auth(ivans) {
        if(ivans) {
            return [uri: '/home/?ivans=' + ivans]
        }
        else{
            return [controller: 'home', action: 'index']
        }
    }
}
