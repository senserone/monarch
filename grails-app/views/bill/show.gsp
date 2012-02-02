
<%@ page import="com.fh.monarch.Bill" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bill.label', default: 'Bill')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-bill" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-bill" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list bill">
			
				<g:if test="${billInstance?.printedDate}">
				<li class="fieldcontain">
					<span id="printedDate-label" class="property-label"><g:message code="bill.printedDate.label" default="Printed Date" /></span>
					
						<span class="property-value" aria-labelledby="printedDate-label"><g:formatDate date="${billInstance?.printedDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${billInstance?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="bill.code.label" default="Code" /></span>
					
						<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${billInstance}" field="code"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${billInstance?.isVat}">
				<li class="fieldcontain">
					<span id="isVat-label" class="property-label"><g:message code="bill.isVat.label" default="Is Vat" /></span>
					
						<span class="property-value" aria-labelledby="isVat-label"><g:formatBoolean boolean="${billInstance?.isVat}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${billInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="bill.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${billInstance}" field="type"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${billInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="bill.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${billInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${billInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="bill.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${billInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${billInstance?.conditions}">
				<li class="fieldcontain">
					<span id="conditions-label" class="property-label"><g:message code="bill.conditions.label" default="Conditions" /></span>
					
						<g:each in="${billInstance.conditions}" var="c">
						<span class="property-value" aria-labelledby="conditions-label"><g:link controller="billCondition" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${billInstance?.customer}">
				<li class="fieldcontain">
					<span id="customer-label" class="property-label"><g:message code="bill.customer.label" default="Customer" /></span>
					
						<span class="property-value" aria-labelledby="customer-label"><g:link controller="customer" action="show" id="${billInstance?.customer?.id}">${billInstance?.customer?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${billInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="bill.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${billInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${billInstance?.dateOnBill}">
				<li class="fieldcontain">
					<span id="dateOnBill-label" class="property-label"><g:message code="bill.dateOnBill.label" default="Date On Bill" /></span>
					
						<span class="property-value" aria-labelledby="dateOnBill-label"><g:formatDate date="${billInstance?.dateOnBill}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${billInstance?.items}">
				<li class="fieldcontain">
					<span id="items-label" class="property-label"><g:message code="bill.items.label" default="Items" /></span>
					
						<g:each in="${billInstance.items}" var="i">
						<span class="property-value" aria-labelledby="items-label"><g:link controller="billItem" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${billInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="bill.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${billInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${billInstance?.office}">
				<li class="fieldcontain">
					<span id="office-label" class="property-label"><g:message code="bill.office.label" default="Office" /></span>
					
						<span class="property-value" aria-labelledby="office-label"><g:link controller="office" action="show" id="${billInstance?.office?.id}">${billInstance?.office?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${billInstance?.id}" />
					<g:link class="edit" action="edit" id="${billInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
