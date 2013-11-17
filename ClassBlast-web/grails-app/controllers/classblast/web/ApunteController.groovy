package classblast.web



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ApunteController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Apunte.list(params), model:[apunteInstanceCount: Apunte.count()]
    }

    def show(Apunte apunteInstance) {
        respond apunteInstance
    }

    def create() {
        respond new Apunte(params)
    }

    @Transactional
    def save(Apunte apunteInstance) {
        if (apunteInstance == null) {
            notFound()
            return
        }

        if (apunteInstance.hasErrors()) {
            respond apunteInstance.errors, view:'create'
            return
        }

        apunteInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'apunteInstance.label', default: 'Apunte'), apunteInstance.id])
                redirect apunteInstance
            }
            '*' { respond apunteInstance, [status: CREATED] }
        }
    }

    def edit(Apunte apunteInstance) {
        respond apunteInstance
    }

    @Transactional
    def update(Apunte apunteInstance) {
        if (apunteInstance == null) {
            notFound()
            return
        }

        if (apunteInstance.hasErrors()) {
            respond apunteInstance.errors, view:'edit'
            return
        }

        apunteInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Apunte.label', default: 'Apunte'), apunteInstance.id])
                redirect apunteInstance
            }
            '*'{ respond apunteInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Apunte apunteInstance) {

        if (apunteInstance == null) {
            notFound()
            return
        }

        apunteInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Apunte.label', default: 'Apunte'), apunteInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'apunteInstance.label', default: 'Apunte'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
