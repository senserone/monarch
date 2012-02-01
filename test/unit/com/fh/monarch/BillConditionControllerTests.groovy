package com.fh.monarch



import org.junit.*
import grails.test.mixin.*

@TestFor(BillConditionController)
@Mock(BillCondition)
class BillConditionControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/billCondition/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.billConditionInstanceList.size() == 0
        assert model.billConditionInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.billConditionInstance != null
    }

    void testSave() {
        controller.save()

        assert model.billConditionInstance != null
        assert view == '/billCondition/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/billCondition/show/1'
        assert controller.flash.message != null
        assert BillCondition.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/billCondition/list'


        populateValidParams(params)
        def billCondition = new BillCondition(params)

        assert billCondition.save() != null

        params.id = billCondition.id

        def model = controller.show()

        assert model.billConditionInstance == billCondition
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/billCondition/list'


        populateValidParams(params)
        def billCondition = new BillCondition(params)

        assert billCondition.save() != null

        params.id = billCondition.id

        def model = controller.edit()

        assert model.billConditionInstance == billCondition
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/billCondition/list'

        response.reset()


        populateValidParams(params)
        def billCondition = new BillCondition(params)

        assert billCondition.save() != null

        // test invalid parameters in update
        params.id = billCondition.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/billCondition/edit"
        assert model.billConditionInstance != null

        billCondition.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/billCondition/show/$billCondition.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        billCondition.clearErrors()

        populateValidParams(params)
        params.id = billCondition.id
        params.version = -1
        controller.update()

        assert view == "/billCondition/edit"
        assert model.billConditionInstance != null
        assert model.billConditionInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/billCondition/list'

        response.reset()

        populateValidParams(params)
        def billCondition = new BillCondition(params)

        assert billCondition.save() != null
        assert BillCondition.count() == 1

        params.id = billCondition.id

        controller.delete()

        assert BillCondition.count() == 0
        assert BillCondition.get(billCondition.id) == null
        assert response.redirectedUrl == '/billCondition/list'
    }
}
