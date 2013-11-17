package classblast.web



import grails.test.mixin.*
import spock.lang.*

@TestFor(ApunteController)
@Mock(Apunte)
class ApunteControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.apunteInstanceList
            model.apunteInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.apunteInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def apunte = new Apunte()
            apunte.validate()
            controller.save(apunte)

        then:"The create view is rendered again with the correct model"
            model.apunteInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            apunte = new Apunte(params)

            controller.save(apunte)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/apunte/show/1'
            controller.flash.message != null
            Apunte.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def apunte = new Apunte(params)
            controller.show(apunte)

        then:"A model is populated containing the domain instance"
            model.apunteInstance == apunte
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def apunte = new Apunte(params)
            controller.edit(apunte)

        then:"A model is populated containing the domain instance"
            model.apunteInstance == apunte
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            status == 404

        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def apunte = new Apunte()
            apunte.validate()
            controller.update(apunte)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.apunteInstance == apunte

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            apunte = new Apunte(params).save(flush: true)
            controller.update(apunte)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/apunte/show/$apunte.id"
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
            def apunte = new Apunte(params).save(flush: true)

        then:"It exists"
            Apunte.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(apunte)

        then:"The instance is deleted"
            Apunte.count() == 0
            response.redirectedUrl == '/apunte/index'
            flash.message != null
    }
}
