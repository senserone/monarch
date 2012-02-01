
<%@ page import="com.fh.common.Office" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'office.label', default: 'Office')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-office" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-office" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="title" title="${message(code: 'office.title.label', default: 'Title')}" />
					
						<g:sortableColumn property="prefixCode" title="${message(code: 'office.prefixCode.label', default: 'Prefix Code')}" />
					
						<g:sortableColumn property="logoTitle" title="${message(code: 'office.logoTitle.label', default: 'Logo Title')}" />
					
						<g:sortableColumn property="address" title="${message(code: 'office.address.label', default: 'Address')}" />
					
						<g:sortableColumn property="faxNumber" title="${message(code: 'office.faxNumber.label', default: 'Fax Number')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'office.email.label', default: 'Email')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${officeInstanceList}" status="i" var="officeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${officeInstance.id}">${fieldValue(bean: officeInstance, field: "title")}</g:link></td>
					
						<td>${fieldValue(bean: officeInstance, field: "prefixCode")}</td>
					
						<td>${fieldValue(bean: officeInstance, field: "logoTitle")}</td>
					
						<td>${fieldValue(bean: officeInstance, field: "address")}</td>
					
						<td>${fieldValue(bean: officeInstance, field: "faxNumber")}</td>
					
						<td>${fieldValue(bean: officeInstance, field: "email")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${officeInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
