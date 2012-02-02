
<%@ page import="com.fh.monarch.BillItem" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'billItem.label', default: 'BillItem')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-billItem" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-billItem" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="onlyFilter">
				<thead>
					<tr>
					
						<th><g:message code="billItem.ordinal.label" default="Ordinal" /></th>
					
						<th><g:message code="billItem.model.label" default="Model" /></th>
					
						<th><g:message code="billItem.brand.label" default="Brand" /></th>
					
						<th><g:message code="billItem.description.label" default="Description" /></th>
					
						<th><g:message code="billItem.unitPrice.label" default="Unit Price" /></th>
					
						<th><g:message code="billItem.quantity.label" default="Quantity" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${billItemInstanceList}" status="i" var="billItemInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${billItemInstance.id}">${fieldValue(bean: billItemInstance, field: "ordinal")}</g:link></td>
					
						<td>${fieldValue(bean: billItemInstance, field: "model")}</td>
					
						<td>${fieldValue(bean: billItemInstance, field: "brand")}</td>
					
						<td>${fieldValue(bean: billItemInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: billItemInstance, field: "unitPrice")}</td>
					
						<td>${fieldValue(bean: billItemInstance, field: "quantity")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${billItemInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
