
<%@ page import="com.fh.common.Customer" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-customer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-customer" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="onlyFilter">
				<thead>
					<tr>
					
						<th><g:message code="customer.title.label" default="Title" /></th>
					
						<th><g:message code="customer.customerCode.label" default="Customer Code" /></th>
					
						<th><g:message code="customer.address.label" default="Address" /></th>
					
						<th><g:message code="customer.phoneNumber.label" default="Phone Number" /></th>
					
						<th><g:message code="customer.faxNumber.label" default="Fax Number" /></th>
					
						<th><g:message code="customer.email.label" default="Email" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${customerInstanceList}" status="i" var="customerInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${customerInstance.id}">${fieldValue(bean: customerInstance, field: "title")}</g:link></td>
					
						<td>${fieldValue(bean: customerInstance, field: "customerCode")}</td>
					
						<td>${fieldValue(bean: customerInstance, field: "address")}</td>
					
						<td>${fieldValue(bean: customerInstance, field: "phoneNumber")}</td>
					
						<td>${fieldValue(bean: customerInstance, field: "faxNumber")}</td>
					
						<td>${fieldValue(bean: customerInstance, field: "email")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${customerInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
