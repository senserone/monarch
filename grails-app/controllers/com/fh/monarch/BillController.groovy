package com.fh.monarch

import org.springframework.dao.DataIntegrityViolationException

class BillController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService
    
    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [billInstanceList: Bill.list(params), billInstanceTotal: Bill.count()]
    }

    def create() {
        println springSecurityService.principal
        [billInstance: new Bill(params)]
    }

    def save() {
        println params
        def billInstance = new Bill(params)
        
        def _toBeDeleted = billInstance.items.findAll {(it?.deleted || (it==null))}
        
        if(_toBeDeleted){
            billInstance.items.removeAll(_toBeDeleted)
        }
        
        billInstance.items.eachWithIndex(){ item, i ->
            item.ordinal = i
        }
        
            
        if (!billInstance.save(flush: true)) {
            render(view: "create", model: [billInstance: billInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'bill.label', default: 'Bill'), billInstance.id])
        redirect(action: "show", id: billInstance.id)
        
    }

    def show() {
        def billInstance = Bill.get(params.id)
        if (!billInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'bill.label', default: 'Bill'), params.id])
            redirect(action: "list")
            return
        }

        [billInstance: billInstance]
    }

    def edit() {
        def billInstance = Bill.get(params.id)
        if (!billInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bill.label', default: 'Bill'), params.id])
            redirect(action: "list")
            return
        }

        [billInstance: billInstance]
    }

    def update() {
        def billInstance = Bill.get(params.id)
        if (!billInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bill.label', default: 'Bill'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (billInstance.version > version) {
                billInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'bill.label', default: 'Bill')] as Object[],
                          "Another user has updated this Bill while you were editing")
                render(view: "edit", model: [billInstance: billInstance])
                return
            }
        }

        billInstance.properties = params
        
        def _toBeDeleted = billInstance.items.findAll {(it?.deleted || (it==null))}
        
        if(_toBeDeleted){
            billInstance.items.removeAll(_toBeDeleted)
        }
         
        if (!billInstance.save(flush: true)) {
            render(view: "edit", model: [billInstance: billInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'bill.label', default: 'Bill'), billInstance.id])
        redirect(action: "show", id: billInstance.id)
    }

    def delete() {
        def billInstance = Bill.get(params.id)
        if (!billInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'bill.label', default: 'Bill'), params.id])
            redirect(action: "list")
            return
        }

        try {
            billInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'bill.label', default: 'Bill'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'bill.label', default: 'Bill'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
