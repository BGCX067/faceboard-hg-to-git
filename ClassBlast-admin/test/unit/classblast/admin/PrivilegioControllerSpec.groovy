package classblast.admin



import grails.test.mixin.*
import spock.lang.*

@TestFor(PrivilegioController)
@Mock(Privilegio)
class PrivilegioControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.privilegioInstanceList
            model.privilegioInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.privilegioInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def privilegio = new Privilegio()
            privilegio.validate()
            controller.save(privilegio)

        then:"The create view is rendered again with the correct model"
            model.privilegioInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            privilegio = new Privilegio(params)

            controller.save(privilegio)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/privilegio/show/1'
            controller.flash.message != null
            Privilegio.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def privilegio = new Privilegio(params)
            controller.show(privilegio)

        then:"A model is populated containing the domain instance"
            model.privilegioInstance == privilegio
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def privilegio = new Privilegio(params)
            controller.edit(privilegio)

        then:"A model is populated containing the domain instance"
            model.privilegioInstance == privilegio
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            status == 404

        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def privilegio = new Privilegio()
            privilegio.validate()
            controller.update(privilegio)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.privilegioInstance == privilegio

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            privilegio = new Privilegio(params).save(flush: true)
            controller.update(privilegio)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/privilegio/show/$privilegio.id"
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
            def privilegio = new Privilegio(params).save(flush: true)

        then:"It exists"
            Privilegio.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(privilegio)

        then:"The instance is deleted"
            Privilegio.count() == 0
            response.redirectedUrl == '/privilegio/index'
            flash.message != null
    }
}
