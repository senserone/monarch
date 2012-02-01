<%@ page import="com.fh.monarch.BillCondition" %>



<div class="fieldcontain ${hasErrors(bean: billConditionInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="billCondition.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${billConditionInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: billConditionInstance, field: 'about', 'error')} ">
	<label for="about">
		<g:message code="billCondition.about.label" default="About" />
		
	</label>
	<g:textField name="about" value="${billConditionInstance?.about}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: billConditionInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="billCondition.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="1500" value="${billConditionInstance?.description}"/>
</div>

