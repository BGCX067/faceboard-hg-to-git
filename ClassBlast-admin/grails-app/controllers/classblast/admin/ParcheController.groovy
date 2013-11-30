package classblast.admin



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ParcheController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Parche.list(params), model:[parcheInstanceCount: Parche.count()]
    }

    def show(Parche parcheInstance) {
        respond parcheInstance
    }

    def create() {
        respond new Parche(params)
    }

    @Transactional
    def save(Parche parcheInstance) {
        if (parcheInstance == null) {
            notFound()
            return
        }

        if (parcheInstance.hasErrors()) {
            respond parcheInstance.errors, view:'create'
            return
        }

        parcheInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'parcheInstance.label', default: 'Parche'), parcheInstance.id])
                redirect parcheInstance
            }
            '*' { respond parcheInstance, [status: CREATED] }
        }
    }

    def edit(Parche parcheInstance) {
        respond parcheInstance
    }

    @Transactional
    def update(Parche parcheInstance) {
        if (parcheInstance == null) {
            notFound()
            return
        }

        if (parcheInstance.hasErrors()) {
            respond parcheInstance.errors, view:'edit'
            return
        }

        parcheInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Parche.label', default: 'Parche'), parcheInstance.id])
                redirect parcheInstance
            }
            '*'{ respond parcheInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Parche parcheInstance) {

        if (parcheInstance == null) {
            notFound()
            return
        }

        parcheInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Parche.label', default: 'Parche'), parcheInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'parcheInstance.label', default: 'Parche'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
