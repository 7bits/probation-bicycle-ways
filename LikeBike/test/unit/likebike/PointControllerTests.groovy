package likebike



import org.junit.*
import grails.test.mixin.*

@TestFor(PointController)
@Mock(Point)
class PointControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/point/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.pointInstanceList.size() == 0
        assert model.pointInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.pointInstance != null
    }

    void testSave() {
        controller.save()

        assert model.pointInstance != null
        assert view == '/point/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/point/show/1'
        assert controller.flash.message != null
        assert Point.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/point/list'

        populateValidParams(params)
        def point = new Point(params)

        assert point.save() != null

        params.id = point.id

        def model = controller.show()

        assert model.pointInstance == point
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/point/list'

        populateValidParams(params)
        def point = new Point(params)

        assert point.save() != null

        params.id = point.id

        def model = controller.edit()

        assert model.pointInstance == point
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/point/list'

        response.reset()

        populateValidParams(params)
        def point = new Point(params)

        assert point.save() != null

        // test invalid parameters in update
        params.id = point.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/point/edit"
        assert model.pointInstance != null

        point.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/point/show/$point.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        point.clearErrors()

        populateValidParams(params)
        params.id = point.id
        params.version = -1
        controller.update()

        assert view == "/point/edit"
        assert model.pointInstance != null
        assert model.pointInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/point/list'

        response.reset()

        populateValidParams(params)
        def point = new Point(params)

        assert point.save() != null
        assert Point.count() == 1

        params.id = point.id

        controller.delete()

        assert Point.count() == 0
        assert Point.get(point.id) == null
        assert response.redirectedUrl == '/point/list'
    }
}
