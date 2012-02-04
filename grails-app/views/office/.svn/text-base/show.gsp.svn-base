
<%@ page import="com.fh.common.Office" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'office.label', default: 'Office')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-office" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-office" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list office">
			
				<g:if test="${officeInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="office.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${officeInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${officeInstance?.prefixCode}">
				<li class="fieldcontain">
					<span id="prefixCode-label" class="property-label"><g:message code="office.prefixCode.label" default="Prefix Code" /></span>
					
						<span class="property-value" aria-labelledby="prefixCode-label"><g:fieldValue bean="${officeInstance}" field="prefixCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${officeInstance?.logoTitle}">
				<li class="fieldcontain">
					<span id="logoTitle-label" class="property-label"><g:message code="office.logoTitle.label" default="Logo Title" /></span>
					
						<span class="property-value" aria-labelledby="logoTitle-label"><g:fieldValue bean="${officeInstance}" field="logoTitle"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${officeInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="office.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${officeInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${officeInstance?.faxNumber}">
				<li class="fieldcontain">
					<span id="faxNumber-label" class="property-label"><g:message code="office.faxNumber.label" default="Fax Number" /></span>
					
						<span class="property-value" aria-labelledby="faxNumber-label"><g:fieldValue bean="${officeInstance}" field="faxNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${officeInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="office.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${officeInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${officeInstance?.vatNumber}">
				<li class="fieldcontain">
					<span id="vatNumber-label" class="property-label"><g:message code="office.vatNumber.label" default="Vat Number" /></span>
					
						<span class="property-value" aria-labelledby="vatNumber-label"><g:fieldValue bean="${officeInstance}" field="vatNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${officeInstance?.phoneNumber}">
				<li class="fieldcontain">
					<span id="phoneNumber-label" class="property-label"><g:message code="office.phoneNumber.label" default="Phone Number" /></span>
					
						<span class="property-value" aria-labelledby="phoneNumber-label"><g:fieldValue bean="${officeInstance}" field="phoneNumber"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${officeInstance?.id}" />
					<g:link class="edit" action="edit" id="${officeInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
