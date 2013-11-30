package classblast.admin



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TipoRolController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TipoRol.list(params), model:[tipoRolInstanceCount: TipoRol.count()]
    }

    def show(TipoRol tipoRolInstance) {
        respond tipoRolInstance
    }

    def create() {
        respond new TipoRol(params)
    }

    @Transactional
    def save(TipoRol tipoRolInstance) {
        if (tipoRolInstance == null) {
            notFound()
            return
        }

        if (tipoRolInstance.hasErrors()) {
            respond tipoRolInstance.errors, view:'create'
            return
        }

        tipoRolInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'tipoRolInstance.label', default: 'TipoRol'), tipoRolInstance.id])
                redirect tipoRolInstance
            }
            '*' { respond tipoRolInstance, [status: CREATED] }
        }
    }

    def edit(TipoRol tipoRolInstance) {
        respond tipoRolInstance
    }

    @Transactional
    def update(TipoRol tipoRolInstance) {
        if (tipoRolInstance == null) {
            notFound()
            return
        }

        if (tipoRolInstance.hasErrors()) {
            respond tipoRolInstance.errors, view:'edit'
            return
        }

        tipoRolInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'TipoRol.label', default: 'TipoRol'), tipoRolInstance.id])
                redirect tipoRolInstance
            }
            '*'{ respond tipoRolInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(TipoRol tipoRolInstance) {

        if (tipoRolInstance == null) {
            notFound()
            return
        }

        tipoRolInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'TipoRol.label', default: 'TipoRol'), tipoRolInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoRolInstance.label', default: 'TipoRol'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
