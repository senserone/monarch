<%@ page import="com.fh.common.Customer" %>



<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="customer.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${customerInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'customerCode', 'error')} ">
	<label for="customerCode">
		<g:message code="customer.customerCode.label" default="Customer Code" />
		
	</label>
	<g:textField name="customerCode" value="${customerInstance?.customerCode}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'address', 'error')} ">
	<label for="address">
		<g:message code="customer.address.label" default="Address" />
		
	</label>
	<g:textArea name="address" cols="40" rows="5" maxlength="1500" value="${customerInstance?.address}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'phoneNumber', 'error')} ">
	<label for="phoneNumber">
		<g:message code="customer.phoneNumber.label" default="Phone Number" />
		
	</label>
	<g:textField name="phoneNumber" value="${customerInstance?.phoneNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'faxNumber', 'error')} ">
	<label for="faxNumber">
		<g:message code="customer.faxNumber.label" default="Fax Number" />
		
	</label>
	<g:textField name="faxNumber" value="${customerInstance?.faxNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="customer.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${customerInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'office', 'error')} required">
	<label for="office">
		<g:message code="customer.office.label" default="Office" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="office" name="office.id" from="${com.fh.common.Office.list()}" optionKey="id" required="" value="${customerInstance?.office?.id}" class="many-to-one"/>
</div>

