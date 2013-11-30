package classblast.admin



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ArchivoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Archivo.list(params), model:[archivoInstanceCount: Archivo.count()]
    }

    def show(Archivo archivoInstance) {
        respond archivoInstance
    }

    def create() {
        respond new Archivo(params)
    }

    @Transactional
    def save(Archivo archivoInstance) {
        if (archivoInstance == null) {
            notFound()
            return
        }

        if (archivoInstance.hasErrors()) {
            respond archivoInstance.errors, view:'create'
            return
        }

        archivoInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'archivoInstance.label', default: 'Archivo'), archivoInstance.id])
                redirect archivoInstance
            }
            '*' { respond archivoInstance, [status: CREATED] }
        }
    }

    def edit(Archivo archivoInstance) {
        respond archivoInstance
    }

    @Transactional
    def update(Archivo archivoInstance) {
        if (archivoInstance == null) {
            notFound()
            return
        }

        if (archivoInstance.hasErrors()) {
            respond archivoInstance.errors, view:'edit'
            return
        }

        archivoInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Archivo.label', default: 'Archivo'), archivoInstance.id])
                redirect archivoInstance
            }
            '*'{ respond archivoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Archivo archivoInstance) {

        if (archivoInstance == null) {
            notFound()
            return
        }

        archivoInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Archivo.label', default: 'Archivo'), archivoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'archivoInstance.label', default: 'Archivo'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
