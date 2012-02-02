<%@ page import="com.fh.monarch.BillItem" %>



<div class="fieldcontain ${hasErrors(bean: billItemInstance, field: 'ordinal', 'error')} required">
	<label for="ordinal">
		<g:message code="billItem.ordinal.label" default="Ordinal" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="ordinal" required="" value="${fieldValue(bean: billItemInstance, field: 'ordinal')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: billItemInstance, field: 'model', 'error')} ">
	<label for="model">
		<g:message code="billItem.model.label" default="Model" />
		
	</label>
	<g:textField name="model" value="${billItemInstance?.model}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: billItemInstance, field: 'brand', 'error')} ">
	<label for="brand">
		<g:message code="billItem.brand.label" default="Brand" />
		
	</label>
	<g:textField name="brand" value="${billItemInstance?.brand}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: billItemInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="billItem.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="1500" required="" value="${billItemInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: billItemInstance, field: 'unitPrice', 'error')} required">
	<label for="unitPrice">
		<g:message code="billItem.unitPrice.label" default="Unit Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="unitPrice" min="0.0" required="" value="${fieldValue(bean: billItemInstance, field: 'unitPrice')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: billItemInstance, field: 'quantity', 'error')} required">
	<label for="quantity">
		<g:message code="billItem.quantity.label" default="Quantity" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="quantity" min="0" required="" value="${fieldValue(bean: billItemInstance, field: 'quantity')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: billItemInstance, field: 'discountType', 'error')} required">
	<label for="discountType">
		<g:message code="billItem.discountType.label" default="Discount Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="discountType" from="${com.fh.monarch.BillItem$DiscountType?.values()}" keys="${com.fh.monarch.BillItem$DiscountType.values()*.name()}" required="" value="${billItemInstance?.discountType?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: billItemInstance, field: 'discount', 'error')} ">
	<label for="discount">
		<g:message code="billItem.discount.label" default="Discount" />
		
	</label>
	<g:field type="number" name="discount" min="0.0" value="${fieldValue(bean: billItemInstance, field: 'discount')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: billItemInstance, field: 'bill', 'error')} required">
	<label for="bill">
		<g:message code="billItem.bill.label" default="Bill" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="bill" name="bill.id" from="${com.fh.monarch.Bill.list()}" optionKey="id" required="" value="${billItemInstance?.bill?.id}" class="many-to-one"/>
</div>

