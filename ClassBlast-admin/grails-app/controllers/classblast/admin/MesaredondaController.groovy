package classblast.admin



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class MesaredondaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Mesaredonda.list(params), model:[mesaredondaInstanceCount: Mesaredonda.count()]
    }

    def show(Mesaredonda mesaredondaInstance) {
        respond mesaredondaInstance
    }

    def create() {
        respond new Mesaredonda(params)
    }

    @Transactional
    def save(Mesaredonda mesaredondaInstance) {
        if (mesaredondaInstance == null) {
            notFound()
            return
        }

        if (mesaredondaInstance.hasErrors()) {
            respond mesaredondaInstance.errors, view:'create'
            return
        }

        mesaredondaInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'mesaredondaInstance.label', default: 'Mesaredonda'), mesaredondaInstance.id])
                redirect mesaredondaInstance
            }
            '*' { respond mesaredondaInstance, [status: CREATED] }
        }
    }

    def edit(Mesaredonda mesaredondaInstance) {
        respond mesaredondaInstance
    }

    @Transactional
    def update(Mesaredonda mesaredondaInstance) {
        if (mesaredondaInstance == null) {
            notFound()
            return
        }

        if (mesaredondaInstance.hasErrors()) {
            respond mesaredondaInstance.errors, view:'edit'
            return
        }

        mesaredondaInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Mesaredonda.label', default: 'Mesaredonda'), mesaredondaInstance.id])
                redirect mesaredondaInstance
            }
            '*'{ respond mesaredondaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Mesaredonda mesaredondaInstance) {

        if (mesaredondaInstance == null) {
            notFound()
            return
        }

        mesaredondaInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Mesaredonda.label', default: 'Mesaredonda'), mesaredondaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'mesaredondaInstance.label', default: 'Mesaredonda'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
