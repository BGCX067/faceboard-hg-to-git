package classblast.admin



import grails.test.mixin.*
import spock.lang.*

@TestFor(TipoRolController)
@Mock(TipoRol)
class TipoRolControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.tipoRolInstanceList
            model.tipoRolInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.tipoRolInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def tipoRol = new TipoRol()
            tipoRol.validate()
            controller.save(tipoRol)

        then:"The create view is rendered again with the correct model"
            model.tipoRolInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            tipoRol = new TipoRol(params)

            controller.save(tipoRol)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/tipoRol/show/1'
            controller.flash.message != null
            TipoRol.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def tipoRol = new TipoRol(params)
            controller.show(tipoRol)

        then:"A model is populated containing the domain instance"
            model.tipoRolInstance == tipoRol
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def tipoRol = new TipoRol(params)
            controller.edit(tipoRol)

        then:"A model is populated containing the domain instance"
            model.tipoRolInstance == tipoRol
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            status == 404

        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def tipoRol = new TipoRol()
            tipoRol.validate()
            controller.update(tipoRol)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.tipoRolInstance == tipoRol

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            tipoRol = new TipoRol(params).save(flush: true)
            controller.update(tipoRol)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/tipoRol/show/$tipoRol.id"
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
            def tipoRol = new TipoRol(params).save(flush: true)

        then:"It exists"
            TipoRol.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(tipoRol)

        then:"The instance is deleted"
            TipoRol.count() == 0
            response.redirectedUrl == '/tipoRol/index'
            flash.message != null
    }
}
