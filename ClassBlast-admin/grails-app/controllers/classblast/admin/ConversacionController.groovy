package classblast.admin



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ConversacionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Conversacion.list(params), model:[conversacionInstanceCount: Conversacion.count()]
    }

    def show(Conversacion conversacionInstance) {
        respond conversacionInstance
    }

    def create() {
        respond new Conversacion(params)
    }

    @Transactional
    def save(Conversacion conversacionInstance) {
        if (conversacionInstance == null) {
            notFound()
            return
        }

        if (conversacionInstance.hasErrors()) {
            respond conversacionInstance.errors, view:'create'
            return
        }

        conversacionInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'conversacionInstance.label', default: 'Conversacion'), conversacionInstance.id])
                redirect conversacionInstance
            }
            '*' { respond conversacionInstance, [status: CREATED] }
        }
    }

    def edit(Conversacion conversacionInstance) {
        respond conversacionInstance
    }

    @Transactional
    def update(Conversacion conversacionInstance) {
        if (conversacionInstance == null) {
            notFound()
            return
        }

        if (conversacionInstance.hasErrors()) {
            respond conversacionInstance.errors, view:'edit'
            return
        }

        conversacionInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Conversacion.label', default: 'Conversacion'), conversacionInstance.id])
                redirect conversacionInstance
            }
            '*'{ respond conversacionInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Conversacion conversacionInstance) {

        if (conversacionInstance == null) {
            notFound()
            return
        }

        conversacionInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Conversacion.label', default: 'Conversacion'), conversacionInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'conversacionInstance.label', default: 'Conversacion'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
