
<%@ page import="com.fh.test.Test" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'test.label', default: 'Test')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-test" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-test" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="onlyFilter">
				<thead>
					<tr>
					
						<th><g:message code="test.title.label" default="Title" /></th>
					
						<th><g:message code="test.isShow.label" default="Is Show" /></th>
					
						<th><g:message code="test.price.label" default="Price" /></th>
					
						<th><g:message code="test.printedDate.label" default="Printed Date" /></th>
					
						<th><g:message code="test.status.label" default="Status" /></th>
					
						<th><g:message code="test.description.label" default="Description" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${testInstanceList}" status="i" var="testInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${testInstance.id}">${fieldValue(bean: testInstance, field: "title")}</g:link></td>
					
						<td><g:formatBoolean boolean="${testInstance.isShow}" /></td>
					
						<td>${fieldValue(bean: testInstance, field: "price")}</td>
					
						<td><g:formatDate date="${testInstance.printedDate}" type="date" style="SHORT"/></td>
					
						<td>${fieldValue(bean: testInstance, field: "status")}</td>
					
						<td>${fieldValue(bean: testInstance, field: "description")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${testInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
