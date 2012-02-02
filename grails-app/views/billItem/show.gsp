
<%@ page import="com.fh.monarch.BillItem" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'billItem.label', default: 'BillItem')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-billItem" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-billItem" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list billItem">
			
				<g:if test="${billItemInstance?.ordinal}">
				<li class="fieldcontain">
					<span id="ordinal-label" class="property-label"><g:message code="billItem.ordinal.label" default="Ordinal" /></span>
					
						<span class="property-value" aria-labelledby="ordinal-label"><g:fieldValue bean="${billItemInstance}" field="ordinal"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${billItemInstance?.model}">
				<li class="fieldcontain">
					<span id="model-label" class="property-label"><g:message code="billItem.model.label" default="Model" /></span>
					
						<span class="property-value" aria-labelledby="model-label"><g:fieldValue bean="${billItemInstance}" field="model"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${billItemInstance?.brand}">
				<li class="fieldcontain">
					<span id="brand-label" class="property-label"><g:message code="billItem.brand.label" default="Brand" /></span>
					
						<span class="property-value" aria-labelledby="brand-label"><g:fieldValue bean="${billItemInstance}" field="brand"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${billItemInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="billItem.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${billItemInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${billItemInstance?.unitPrice}">
				<li class="fieldcontain">
					<span id="unitPrice-label" class="property-label"><g:message code="billItem.unitPrice.label" default="Unit Price" /></span>
					
						<span class="property-value" aria-labelledby="unitPrice-label"><g:fieldValue bean="${billItemInstance}" field="unitPrice"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${billItemInstance?.quantity}">
				<li class="fieldcontain">
					<span id="quantity-label" class="property-label"><g:message code="billItem.quantity.label" default="Quantity" /></span>
					
						<span class="property-value" aria-labelledby="quantity-label"><g:fieldValue bean="${billItemInstance}" field="quantity"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${billItemInstance?.discountType}">
				<li class="fieldcontain">
					<span id="discountType-label" class="property-label"><g:message code="billItem.discountType.label" default="Discount Type" /></span>
					
						<span class="property-value" aria-labelledby="discountType-label"><g:fieldValue bean="${billItemInstance}" field="discountType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${billItemInstance?.discount}">
				<li class="fieldcontain">
					<span id="discount-label" class="property-label"><g:message code="billItem.discount.label" default="Discount" /></span>
					
						<span class="property-value" aria-labelledby="discount-label"><g:fieldValue bean="${billItemInstance}" field="discount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${billItemInstance?.bill}">
				<li class="fieldcontain">
					<span id="bill-label" class="property-label"><g:message code="billItem.bill.label" default="Bill" /></span>
					
						<span class="property-value" aria-labelledby="bill-label"><g:link controller="bill" action="show" id="${billItemInstance?.bill?.id}">${billItemInstance?.bill?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${billItemInstance?.id}" />
					<g:link class="edit" action="edit" id="${billItemInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
