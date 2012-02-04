
<%@ page import="com.fh.monarch.BillCondition" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'billCondition.label', default: 'BillCondition')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-billCondition" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-billCondition" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="title" title="${message(code: 'billCondition.title.label', default: 'Title')}" />
					
						<g:sortableColumn property="about" title="${message(code: 'billCondition.about.label', default: 'About')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'billCondition.description.label', default: 'Description')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${billConditionInstanceList}" status="i" var="billConditionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${billConditionInstance.id}">${fieldValue(bean: billConditionInstance, field: "title")}</g:link></td>
					
						<td>${fieldValue(bean: billConditionInstance, field: "about")}</td>
					
						<td>${fieldValue(bean: billConditionInstance, field: "description")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${billConditionInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
