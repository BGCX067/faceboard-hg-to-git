package classblast.admin



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class NotificacionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Notificacion.list(params), model:[notificacionInstanceCount: Notificacion.count()]
    }

    def show(Notificacion notificacionInstance) {
        respond notificacionInstance
    }

    def create() {
        respond new Notificacion(params)
    }

    @Transactional
    def save(Notificacion notificacionInstance) {
        if (notificacionInstance == null) {
            notFound()
            return
        }

        if (notificacionInstance.hasErrors()) {
            respond notificacionInstance.errors, view:'create'
            return
        }

        notificacionInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'notificacionInstance.label', default: 'Notificacion'), notificacionInstance.id])
                redirect notificacionInstance
            }
            '*' { respond notificacionInstance, [status: CREATED] }
        }
    }

    def edit(Notificacion notificacionInstance) {
        respond notificacionInstance
    }

    @Transactional
    def update(Notificacion notificacionInstance) {
        if (notificacionInstance == null) {
            notFound()
            return
        }

        if (notificacionInstance.hasErrors()) {
            respond notificacionInstance.errors, view:'edit'
            return
        }

        notificacionInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Notificacion.label', default: 'Notificacion'), notificacionInstance.id])
                redirect notificacionInstance
            }
            '*'{ respond notificacionInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Notificacion notificacionInstance) {

        if (notificacionInstance == null) {
            notFound()
            return
        }

        notificacionInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Notificacion.label', default: 'Notificacion'), notificacionInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'notificacionInstance.label', default: 'Notificacion'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
