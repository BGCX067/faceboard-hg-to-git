package classblast.admin



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PublicacionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Publicacion.list(params), model:[publicacionInstanceCount: Publicacion.count()]
    }

    def show(Publicacion publicacionInstance) {
        respond publicacionInstance
    }

    def create() {
        respond new Publicacion(params)
    }

    @Transactional
    def save(Publicacion publicacionInstance) {
        if (publicacionInstance == null) {
            notFound()
            return
        }

        if (publicacionInstance.hasErrors()) {
            respond publicacionInstance.errors, view:'create'
            return
        }

        publicacionInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'publicacionInstance.label', default: 'Publicacion'), publicacionInstance.id])
                redirect publicacionInstance
            }
            '*' { respond publicacionInstance, [status: CREATED] }
        }
    }

    def edit(Publicacion publicacionInstance) {
        respond publicacionInstance
    }

    @Transactional
    def update(Publicacion publicacionInstance) {
        if (publicacionInstance == null) {
            notFound()
            return
        }

        if (publicacionInstance.hasErrors()) {
            respond publicacionInstance.errors, view:'edit'
            return
        }

        publicacionInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Publicacion.label', default: 'Publicacion'), publicacionInstance.id])
                redirect publicacionInstance
            }
            '*'{ respond publicacionInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Publicacion publicacionInstance) {

        if (publicacionInstance == null) {
            notFound()
            return
        }

        publicacionInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Publicacion.label', default: 'Publicacion'), publicacionInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'publicacionInstance.label', default: 'Publicacion'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
