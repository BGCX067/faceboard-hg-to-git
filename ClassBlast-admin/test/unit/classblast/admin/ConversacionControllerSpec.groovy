package classblast.admin



import grails.test.mixin.*
import spock.lang.*

@TestFor(ConversacionController)
@Mock(Conversacion)
class ConversacionControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.conversacionInstanceList
            model.conversacionInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.conversacionInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def conversacion = new Conversacion()
            conversacion.validate()
            controller.save(conversacion)

        then:"The create view is rendered again with the correct model"
            model.conversacionInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            conversacion = new Conversacion(params)

            controller.save(conversacion)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/conversacion/show/1'
            controller.flash.message != null
            Conversacion.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def conversacion = new Conversacion(params)
            controller.show(conversacion)

        then:"A model is populated containing the domain instance"
            model.conversacionInstance == conversacion
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def conversacion = new Conversacion(params)
            controller.edit(conversacion)

        then:"A model is populated containing the domain instance"
            model.conversacionInstance == conversacion
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            status == 404

        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def conversacion = new Conversacion()
            conversacion.validate()
            controller.update(conversacion)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.conversacionInstance == conversacion

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            conversacion = new Conversacion(params).save(flush: true)
            controller.update(conversacion)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/conversacion/show/$conversacion.id"
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
            def conversacion = new Conversacion(params).save(flush: true)

        then:"It exists"
            Conversacion.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(conversacion)

        then:"The instance is deleted"
            Conversacion.count() == 0
            response.redirectedUrl == '/conversacion/index'
            flash.message != null
    }
}
