package classblast.web



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SeccionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def inicio(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Seccion.list(params), model:[seccionInstanceCount: Seccion.count()]
    }

    def mostrar(Seccion seccionInstance) {
        respond seccionInstance
    }

    def create() {
        respond new Seccion(params)
    }

    @Transactional
    def save(Seccion seccionInstance) {
        if (seccionInstance == null) {
            notFound()
            return
        }

        if (seccionInstance.hasErrors()) {
            respond seccionInstance.errors, view:'create'
            return
        }

        seccionInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'seccionInstance.label', default: 'Seccion'), seccionInstance.id])
                def map = seccionInstance
				//redirect seccionInstance
				redirect action:'mostrar',id:3
            }
            '*' { /*respond seccionInstance, [status: CREATED]*/
				redirect view:'error'}
        }
    }

    def edit(Seccion seccionInstance) {
        respond seccionInstance
    }

    @Transactional
    def update(Seccion seccionInstance) {
        if (seccionInstance == null) {
            notFound()
            return
        }

        if (seccionInstance.hasErrors()) {
            respond seccionInstance.errors, view:'edit'
            return
        }

        seccionInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Seccion.label', default: 'Seccion'), seccionInstance.id])
                redirect seccionInstance
            }
            '*'{ respond seccionInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Seccion seccionInstance) {

        if (seccionInstance == null) {
            notFound()
            return
        }

        seccionInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Seccion.label', default: 'Seccion'), seccionInstance.id])
                redirect action:"inicio", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'seccionInstance.label', default: 'Seccion'), params.id])
                redirect action: "inicio", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
