package classblast.admin



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CuadernoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Cuaderno.list(params), model:[cuadernoInstanceCount: Cuaderno.count()]
    }

    def show(Cuaderno cuadernoInstance) {
        respond cuadernoInstance
    }

    def create() {
        respond new Cuaderno(params)
    }

    @Transactional
    def save(Cuaderno cuadernoInstance) {
        if (cuadernoInstance == null) {
            notFound()
            return
        }

        if (cuadernoInstance.hasErrors()) {
            respond cuadernoInstance.errors, view:'create'
            return
        }

        cuadernoInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'cuadernoInstance.label', default: 'Cuaderno'), cuadernoInstance.id])
                redirect cuadernoInstance
            }
            '*' { respond cuadernoInstance, [status: CREATED] }
        }
    }

    def edit(Cuaderno cuadernoInstance) {
        respond cuadernoInstance
    }

    @Transactional
    def update(Cuaderno cuadernoInstance) {
        if (cuadernoInstance == null) {
            notFound()
            return
        }

        if (cuadernoInstance.hasErrors()) {
            respond cuadernoInstance.errors, view:'edit'
            return
        }

        cuadernoInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Cuaderno.label', default: 'Cuaderno'), cuadernoInstance.id])
                redirect cuadernoInstance
            }
            '*'{ respond cuadernoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Cuaderno cuadernoInstance) {

        if (cuadernoInstance == null) {
            notFound()
            return
        }

        cuadernoInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Cuaderno.label', default: 'Cuaderno'), cuadernoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'cuadernoInstance.label', default: 'Cuaderno'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
