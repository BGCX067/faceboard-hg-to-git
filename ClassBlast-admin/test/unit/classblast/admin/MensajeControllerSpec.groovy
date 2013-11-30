package classblast.admin



import grails.test.mixin.*
import spock.lang.*

@TestFor(MensajeController)
@Mock(Mensaje)
class MensajeControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.mensajeInstanceList
            model.mensajeInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.mensajeInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def mensaje = new Mensaje()
            mensaje.validate()
            controller.save(mensaje)

        then:"The create view is rendered again with the correct model"
            model.mensajeInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            mensaje = new Mensaje(params)

            controller.save(mensaje)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/mensaje/show/1'
            controller.flash.message != null
            Mensaje.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def mensaje = new Mensaje(params)
            controller.show(mensaje)

        then:"A model is populated containing the domain instance"
            model.mensajeInstance == mensaje
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def mensaje = new Mensaje(params)
            controller.edit(mensaje)

        then:"A model is populated containing the domain instance"
            model.mensajeInstance == mensaje
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            status == 404

        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def mensaje = new Mensaje()
            mensaje.validate()
            controller.update(mensaje)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.mensajeInstance == mensaje

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            mensaje = new Mensaje(params).save(flush: true)
            controller.update(mensaje)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/mensaje/show/$mensaje.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            status == 404

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def mensaje = new Mensaje(params).save(flush: true)

        then:"It exists"
            Mensaje.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(mensaje)

        then:"The instance is deleted"
            Mensaje.count() == 0
            response.redirectedUrl == '/mensaje/index'
            flash.message != null
    }
}
