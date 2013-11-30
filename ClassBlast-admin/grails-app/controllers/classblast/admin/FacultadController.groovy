package classblast.admin



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class FacultadController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Facultad.list(params), model:[facultadInstanceCount: Facultad.count()]
    }

    def show(Facultad facultadInstance) {
        respond facultadInstance
    }

    def create() {
        respond new Facultad(params)
    }

    @Transactional
    def save(Facultad facultadInstance) {
        if (facultadInstance == null) {
            notFound()
            return
        }

        if (facultadInstance.hasErrors()) {
            respond facultadInstance.errors, view:'create'
            return
        }

        facultadInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'facultadInstance.label', default: 'Facultad'), facultadInstance.id])
                redirect facultadInstance
            }
            '*' { respond facultadInstance, [status: CREATED] }
        }
    }

    def edit(Facultad facultadInstance) {
        respond facultadInstance
    }

    @Transactional
    def update(Facultad facultadInstance) {
        if (facultadInstance == null) {
            notFound()
            return
        }

        if (facultadInstance.hasErrors()) {
            respond facultadInstance.errors, view:'edit'
            return
        }

        facultadInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Facultad.label', default: 'Facultad'), facultadInstance.id])
                redirect facultadInstance
            }
            '*'{ respond facultadInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Facultad facultadInstance) {

        if (facultadInstance == null) {
            notFound()
            return
        }

        facultadInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Facultad.label', default: 'Facultad'), facultadInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'facultadInstance.label', default: 'Facultad'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
