package com.fh.monarch

import org.springframework.dao.DataIntegrityViolationException

class BillItemController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [billItemInstanceList: BillItem.list(params), billItemInstanceTotal: BillItem.count()]
    }

    def create() {
        [billItemInstance: new BillItem(params)]
    }

    def save() {
        def billItemInstance = new BillItem(params)
        if (!billItemInstance.save(flush: true)) {
            render(view: "create", model: [billItemInstance: billItemInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'billItem.label', default: 'BillItem'), billItemInstance.id])
        redirect(action: "show", id: billItemInstance.id)
    }

    def show() {
        def billItemInstance = BillItem.get(params.id)
        if (!billItemInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'billItem.label', default: 'BillItem'), params.id])
            redirect(action: "list")
            return
        }

        [billItemInstance: billItemInstance]
    }

    def edit() {
        def billItemInstance = BillItem.get(params.id)
        if (!billItemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'billItem.label', default: 'BillItem'), params.id])
            redirect(action: "list")
            return
        }

        [billItemInstance: billItemInstance]
    }

    def update() {
        def billItemInstance = BillItem.get(params.id)
        if (!billItemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'billItem.label', default: 'BillItem'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (billItemInstance.version > version) {
                billItemInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'billItem.label', default: 'BillItem')] as Object[],
                          "Another user has updated this BillItem while you were editing")
                render(view: "edit", model: [billItemInstance: billItemInstance])
                return
            }
        }

        billItemInstance.properties = params

        if (!billItemInstance.save(flush: true)) {
            render(view: "edit", model: [billItemInstance: billItemInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'billItem.label', default: 'BillItem'), billItemInstance.id])
        redirect(action: "show", id: billItemInstance.id)
    }

    def delete() {
        def billItemInstance = BillItem.get(params.id)
        if (!billItemInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'billItem.label', default: 'BillItem'), params.id])
            redirect(action: "list")
            return
        }

        try {
            billItemInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'billItem.label', default: 'BillItem'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'billItem.label', default: 'BillItem'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
