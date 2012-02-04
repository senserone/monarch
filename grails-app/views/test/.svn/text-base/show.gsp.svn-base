
<%@ page import="com.fh.test.Test" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'test.label', default: 'Test')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-test" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-test" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list test">
			
				<g:if test="${testInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="test.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${testInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${testInstance?.isShow}">
				<li class="fieldcontain">
					<span id="isShow-label" class="property-label"><g:message code="test.isShow.label" default="Is Show" /></span>
					
						<span class="property-value" aria-labelledby="isShow-label"><g:formatBoolean boolean="${testInstance?.isShow}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${testInstance?.price}">
				<li class="fieldcontain">
					<span id="price-label" class="property-label"><g:message code="test.price.label" default="Price" /></span>
					
						<span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${testInstance}" field="price"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${testInstance?.printedDate}">
				<li class="fieldcontain">
					<span id="printedDate-label" class="property-label"><g:message code="test.printedDate.label" default="Printed Date" /></span>
					
						<span class="property-value" aria-labelledby="printedDate-label"><g:formatDate date="${testInstance?.printedDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${testInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="test.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${testInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${testInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="test.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${testInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${testInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="test.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${testInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${testInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="test.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${testInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${testInstance?.id}" />
					<g:link class="edit" action="edit" id="${testInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
