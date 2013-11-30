package classblast.admin



import grails.test.mixin.*
import spock.lang.*

@TestFor(MesaredondaController)
@Mock(Mesaredonda)
class MesaredondaControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.mesaredondaInstanceList
            model.mesaredondaInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.mesaredondaInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def mesaredonda = new Mesaredonda()
            mesaredonda.validate()
            controller.save(mesaredonda)

        then:"The create view is rendered again with the correct model"
            model.mesaredondaInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            mesaredonda = new Mesaredonda(params)

            controller.save(mesaredonda)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/mesaredonda/show/1'
            controller.flash.message != null
            Mesaredonda.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def mesaredonda = new Mesaredonda(params)
            controller.show(mesaredonda)

        then:"A model is populated containing the domain instance"
            model.mesaredondaInstance == mesaredonda
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def mesaredonda = new Mesaredonda(params)
            controller.edit(mesaredonda)

        then:"A model is populated containing the domain instance"
            model.mesaredondaInstance == mesaredonda
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            status == 404

        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def mesaredonda = new Mesaredonda()
            mesaredonda.validate()
            controller.update(mesaredonda)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.mesaredondaInstance == mesaredonda

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            mesaredonda = new Mesaredonda(params).save(flush: true)
            controller.update(mesaredonda)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/mesaredonda/show/$mesaredonda.id"
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
            def mesaredonda = new Mesaredonda(params).save(flush: true)

        then:"It exists"
            Mesaredonda.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(mesaredonda)

        then:"The instance is deleted"
            Mesaredonda.count() == 0
            response.redirectedUrl == '/mesaredonda/index'
            flash.message != null
    }
}
