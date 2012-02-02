<%@ page import="com.fh.monarch.Bill" %>


<!-- Code -->
<div class="fieldcontain ${hasErrors(bean: billInstance, field: 'code', 'error')} required">
  <label for="code">
    <g:message code="bill.code.label" default="Code" />
    <span class="required-indicator">*</span>
  </label>
  <g:textField name="code" required="" value="${billInstance?.code}"/>
</div>

<!-- Is Vat -->
<div class="fieldcontain ${hasErrors(bean: billInstance, field: 'isVat', 'error')} ">
  <label for="isVat">
    <g:message code="bill.isVat.label" default="Is Vat" />

  </label>
  <g:checkBox name="isVat" value="${billInstance?.isVat}" />
</div>

<!-- Bill Type -->
<div class="fieldcontain ${hasErrors(bean: billInstance, field: 'type', 'error')} required">
  <label for="type">
    <g:message code="bill.type.label" default="Type" />
    <span class="required-indicator">*</span>
  </label>
  <g:select name="type" from="${com.fh.monarch.Bill$BillType?.values()}" keys="${com.fh.monarch.Bill$BillType.values()*.name()}" required="" value="${billInstance?.type?.name()}"/>
</div>

<!-- Status -->
<div class="fieldcontain ${hasErrors(bean: billInstance, field: 'status', 'error')} required">
  <label for="status">
    <g:message code="bill.status.label" default="Status" />
    <span class="required-indicator">*</span>
  </label>
  <g:select name="status" from="${com.fh.monarch.Bill$BillStatus?.values()}" keys="${com.fh.monarch.Bill$BillStatus.values()*.name()}" required="" value="${billInstance?.status?.name()}"/>
</div>


<!-- Description -->
<div class="fieldcontain ${hasErrors(bean: billInstance, field: 'description', 'error')} ">
  <label for="description">
    <g:message code="bill.description.label" default="Description" />
  </label>
  <g:textArea name="description" cols="40" rows="5" maxlength="1500" value="${billInstance?.description}"/>
</div>

<!-- Customer -->
<div class="fieldcontain ${hasErrors(bean: billInstance, field: 'customer', 'error')} required">
  <label for="customer">
    <g:message code="bill.customer.label" default="Customer" />
    <span class="required-indicator">*</span>
  </label>
  <g:select id="customer" name="customer.id" from="${com.fh.common.Customer.list()}" optionValue="title" optionKey="id" required="" value="${billInstance?.customer?.id}" class="many-to-one"/>
</div>

<!-- Date on Bill -->
<div class="fieldcontain ${hasErrors(bean: billInstance, field: 'dateOnBill', 'error')} required">
  <label for="dateOnBill">
    <g:message code="bill.dateOnBill.label" default="Date On Bill" />
    <span class="required-indicator">*</span>
  </label>
  <g:datePicker name="dateOnBill" precision="day"  value="${billInstance?.dateOnBill}"  />
</div>

<!-- Items -->
<div class="fieldcontain ${hasErrors(bean: billInstance, field: 'items', 'error')} ">
  <label for="items">
    <g:message code="bill.items.label" default="Items" />
  </label>
  <g:render template="billItems" model="['billInstance':billInstance]"/>
</div>


<!-- Conditions -->
<div class="fieldcontain ${hasErrors(bean: billInstance, field: 'conditions', 'error')} ">
  <label for="conditions">
    <g:message code="bill.conditions.label" default="Conditions" />
  </label>
  <g:render template="billConditions" model="['billInstance':billInstance]"/>
</div>

<!-- Office -->
<div class="fieldcontain ${hasErrors(bean: billInstance, field: 'office', 'error')} required">
  <label for="office">
    <g:message code="bill.office.label" default="Office" />
    <span class="required-indicator">*</span>
  </label>
  <g:select id="office" name="office.id" from="${com.fh.common.Office.list()}" optionValue="title" optionKey="id" required="" value="${billInstance?.office?.id}" />
</div>

