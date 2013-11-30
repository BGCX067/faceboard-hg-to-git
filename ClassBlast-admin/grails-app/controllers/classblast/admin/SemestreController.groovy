package classblast.admin



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SemestreController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Semestre.list(params), model:[semestreInstanceCount: Semestre.count()]
    }

    def show(Semestre semestreInstance) {
        respond semestreInstance
    }

    def create() {
        respond new Semestre(params)
    }

    @Transactional
    def save(Semestre semestreInstance) {
        if (semestreInstance == null) {
            notFound()
            return
        }

        if (semestreInstance.hasErrors()) {
            respond semestreInstance.errors, view:'create'
            return
        }

        semestreInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'semestreInstance.label', default: 'Semestre'), semestreInstance.id])
                redirect semestreInstance
            }
            '*' { respond semestreInstance, [status: CREATED] }
        }
    }

    def edit(Semestre semestreInstance) {
        respond semestreInstance
    }

    @Transactional
    def update(Semestre semestreInstance) {
        if (semestreInstance == null) {
            notFound()
            return
        }

        if (semestreInstance.hasErrors()) {
            respond semestreInstance.errors, view:'edit'
            return
        }

        semestreInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Semestre.label', default: 'Semestre'), semestreInstance.id])
                redirect semestreInstance
            }
            '*'{ respond semestreInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Semestre semestreInstance) {

        if (semestreInstance == null) {
            notFound()
            return
        }

        semestreInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Semestre.label', default: 'Semestre'), semestreInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'semestreInstance.label', default: 'Semestre'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
