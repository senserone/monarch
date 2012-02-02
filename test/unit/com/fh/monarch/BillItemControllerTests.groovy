package com.fh.monarch



import org.junit.*
import grails.test.mixin.*

@TestFor(BillItemController)
@Mock(BillItem)
class BillItemControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/billItem/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.billItemInstanceList.size() == 0
        assert model.billItemInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.billItemInstance != null
    }

    void testSave() {
        controller.save()

        assert model.billItemInstance != null
        assert view == '/billItem/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/billItem/show/1'
        assert controller.flash.message != null
        assert BillItem.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/billItem/list'


        populateValidParams(params)
        def billItem = new BillItem(params)

        assert billItem.save() != null

        params.id = billItem.id

        def model = controller.show()

        assert model.billItemInstance == billItem
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/billItem/list'


        populateValidParams(params)
        def billItem = new BillItem(params)

        assert billItem.save() != null

        params.id = billItem.id

        def model = controller.edit()

        assert model.billItemInstance == billItem
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/billItem/list'

        response.reset()


        populateValidParams(params)
        def billItem = new BillItem(params)

        assert billItem.save() != null

        // test invalid parameters in update
        params.id = billItem.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/billItem/edit"
        assert model.billItemInstance != null

        billItem.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/billItem/show/$billItem.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        billItem.clearErrors()

        populateValidParams(params)
        params.id = billItem.id
        params.version = -1
        controller.update()

        assert view == "/billItem/edit"
        assert model.billItemInstance != null
        assert model.billItemInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/billItem/list'

        response.reset()

        populateValidParams(params)
        def billItem = new BillItem(params)

        assert billItem.save() != null
        assert BillItem.count() == 1

        params.id = billItem.id

        controller.delete()

        assert BillItem.count() == 0
        assert BillItem.get(billItem.id) == null
        assert response.redirectedUrl == '/billItem/list'
    }
}
