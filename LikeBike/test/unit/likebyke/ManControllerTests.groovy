package likebyke



import org.junit.*
import grails.test.mixin.*

@TestFor(ManController)
@Mock(Man)
class ManControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/man/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.manInstanceList.size() == 0
        assert model.manInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.manInstance != null
    }

    void testSave() {
        controller.save()

        assert model.manInstance != null
        assert view == '/man/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/man/show/1'
        assert controller.flash.message != null
        assert Man.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/man/list'

        populateValidParams(params)
        def man = new Man(params)

        assert man.save() != null

        params.id = man.id

        def model = controller.show()

        assert model.manInstance == man
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/man/list'

        populateValidParams(params)
        def man = new Man(params)

        assert man.save() != null

        params.id = man.id

        def model = controller.edit()

        assert model.manInstance == man
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/man/list'

        response.reset()

        populateValidParams(params)
        def man = new Man(params)

        assert man.save() != null

        // test invalid parameters in update
        params.id = man.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/man/edit"
        assert model.manInstance != null

        man.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/man/show/$man.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        man.clearErrors()

        populateValidParams(params)
        params.id = man.id
        params.version = -1
        controller.update()

        assert view == "/man/edit"
        assert model.manInstance != null
        assert model.manInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/man/list'

        response.reset()

        populateValidParams(params)
        def man = new Man(params)

        assert man.save() != null
        assert Man.count() == 1

        params.id = man.id

        controller.delete()

        assert Man.count() == 0
        assert Man.get(man.id) == null
        assert response.redirectedUrl == '/man/list'
    }
}
