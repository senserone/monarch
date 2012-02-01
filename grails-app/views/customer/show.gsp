
<%@ page import="com.fh.common.Customer" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-customer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-customer" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list customer">
			
				<g:if test="${customerInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="customer.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${customerInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerInstance?.customerCode}">
				<li class="fieldcontain">
					<span id="customerCode-label" class="property-label"><g:message code="customer.customerCode.label" default="Customer Code" /></span>
					
						<span class="property-value" aria-labelledby="customerCode-label"><g:fieldValue bean="${customerInstance}" field="customerCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="customer.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${customerInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerInstance?.phoneNumber}">
				<li class="fieldcontain">
					<span id="phoneNumber-label" class="property-label"><g:message code="customer.phoneNumber.label" default="Phone Number" /></span>
					
						<span class="property-value" aria-labelledby="phoneNumber-label"><g:fieldValue bean="${customerInstance}" field="phoneNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerInstance?.faxNumber}">
				<li class="fieldcontain">
					<span id="faxNumber-label" class="property-label"><g:message code="customer.faxNumber.label" default="Fax Number" /></span>
					
						<span class="property-value" aria-labelledby="faxNumber-label"><g:fieldValue bean="${customerInstance}" field="faxNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="customer.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${customerInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerInstance?.office}">
				<li class="fieldcontain">
					<span id="office-label" class="property-label"><g:message code="customer.office.label" default="Office" /></span>
					
						<span class="property-value" aria-labelledby="office-label"><g:link controller="office" action="show" id="${customerInstance?.office?.id}">${customerInstance?.office?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${customerInstance?.id}" />
					<g:link class="edit" action="edit" id="${customerInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
