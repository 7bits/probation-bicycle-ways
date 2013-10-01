package likebike

import org.springframework.dao.DataIntegrityViolationException

class PointController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [pointInstanceList: Point.list(params), pointInstanceTotal: Point.count()]
    }

    def create() {
        [pointInstance: new Point(params)]
    }

    def save() {
        def pointInstance = new Point(params)
        if (!pointInstance.save(flush: true)) {
            render(view: "create", model: [pointInstance: pointInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'point.label', default: 'Point'), pointInstance.id])
        redirect(action: "show", id: pointInstance.id)
    }

    def show(Long id) {
        def pointInstance = Point.get(id)
        if (!pointInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'point.label', default: 'Point'), id])
            redirect(action: "list")
            return
        }

        [pointInstance: pointInstance]
    }

    def edit(Long id) {
        def pointInstance = Point.get(id)
        if (!pointInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'point.label', default: 'Point'), id])
            redirect(action: "list")
            return
        }

        [pointInstance: pointInstance]
    }

    def update(Long id, Long version) {
        def pointInstance = Point.get(id)
        if (!pointInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'point.label', default: 'Point'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (pointInstance.version > version) {
                pointInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'point.label', default: 'Point')] as Object[],
                        "Another user has updated this Point while you were editing")
                render(view: "edit", model: [pointInstance: pointInstance])
                return
            }
        }

        pointInstance.properties = params

        if (!pointInstance.save(flush: true)) {
            render(view: "edit", model: [pointInstance: pointInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'point.label', default: 'Point'), pointInstance.id])
        redirect(action: "show", id: pointInstance.id)
    }

    def delete(Long id) {
        def pointInstance = Point.get(id)
        if (!pointInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'point.label', default: 'Point'), id])
            redirect(action: "list")
            return
        }

        try {
            pointInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'point.label', default: 'Point'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'point.label', default: 'Point'), id])
            redirect(action: "show", id: id)
        }
    }
}
