<%@ page import="com.fh.test.Test" %>



<div class="fieldcontain ${hasErrors(bean: testInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="test.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${testInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: testInstance, field: 'isShow', 'error')} ">
	<label for="isShow">
		<g:message code="test.isShow.label" default="Is Show" />
		
	</label>
	<g:checkBox name="isShow" value="${testInstance?.isShow}" />
</div>

<div class="fieldcontain ${hasErrors(bean: testInstance, field: 'price', 'error')} ">
	<label for="price">
		<g:message code="test.price.label" default="Price" />
		
	</label>
	<g:field type="number" name="price" value="${fieldValue(bean: testInstance, field: 'price')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: testInstance, field: 'printedDate', 'error')} ">
	<label for="printedDate">
		<g:message code="test.printedDate.label" default="Printed Date" />
		
	</label>
	<g:datePicker name="printedDate" precision="day"  value="${testInstance?.printedDate}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: testInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="test.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="status" from="${testInstance.constraints.status.inList}" required="" value="${fieldValue(bean: testInstance, field: 'status')}" valueMessagePrefix="test.status"/>
</div>

<div class="fieldcontain ${hasErrors(bean: testInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="test.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="1500" value="${testInstance?.description}"/>
</div>

