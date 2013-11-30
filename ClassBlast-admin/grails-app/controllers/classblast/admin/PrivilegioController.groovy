package classblast.admin



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PrivilegioController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Privilegio.list(params), model:[privilegioInstanceCount: Privilegio.count()]
    }

    def show(Privilegio privilegioInstance) {
        respond privilegioInstance
    }

    def create() {
        respond new Privilegio(params)
    }

    @Transactional
    def save(Privilegio privilegioInstance) {
        if (privilegioInstance == null) {
            notFound()
            return
        }

        if (privilegioInstance.hasErrors()) {
            respond privilegioInstance.errors, view:'create'
            return
        }

        privilegioInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'privilegioInstance.label', default: 'Privilegio'), privilegioInstance.id])
                redirect privilegioInstance
            }
            '*' { respond privilegioInstance, [status: CREATED] }
        }
    }

    def edit(Privilegio privilegioInstance) {
        respond privilegioInstance
    }

    @Transactional
    def update(Privilegio privilegioInstance) {
        if (privilegioInstance == null) {
            notFound()
            return
        }

        if (privilegioInstance.hasErrors()) {
            respond privilegioInstance.errors, view:'edit'
            return
        }

        privilegioInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Privilegio.label', default: 'Privilegio'), privilegioInstance.id])
                redirect privilegioInstance
            }
            '*'{ respond privilegioInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Privilegio privilegioInstance) {

        if (privilegioInstance == null) {
            notFound()
            return
        }

        privilegioInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Privilegio.label', default: 'Privilegio'), privilegioInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'privilegioInstance.label', default: 'Privilegio'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
