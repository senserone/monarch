<%@ page import="com.fh.monarch.Bill" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'bill.label', default: 'Bill')}" />
  <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>
  <a href="#create-bill" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
  <div class="nav" role="navigation">
    <ul>
      <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
      <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
    </ul>
  </div>
  <div id="create-bill" class="content scaffold-create" role="main">
    <h1><g:message code="default.create.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
      <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${billInstance}">
      <ul class="errors" role="alert">
        <g:eachError bean="${billInstance}" var="error">
          <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
      </ul>
    </g:hasErrors>
    <g:form action="save" >
      <fieldset class="form">
        <g:render template="form"/>
      </fieldset>
      <fieldset class="buttons">
        <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
      </fieldset>
    </g:form>
    <!-- Render the phone template (_item.gsp) hidden so we can clone it -->
    <g:render template='billItem' model="['item':null,'i':'_clone','hidden':true]"/>
    <!-- Render the phone template (_item.gsp) hidden so we can clone it -->
  </div>
</body>
</html>
