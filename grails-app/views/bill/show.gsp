<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'bill.label', default: 'Bill')}" />
  <title>Show Title</title>
  <script type="text/javascript">
  $(document).ready(function(){
    $('#office-content').hide();

    $('#office-expand').click(function(){
      $('#office-content').toggle("slow");
    });
    $('#customer-content').hide();
    $('#customer-expand').click(function(){
      $('#customer-content').toggle("slow");
    });
      
    $('#date-content').hide();
    $('#date-expand').click(function(){
      $('#date-content').toggle("slow");
    });
  });
  </script>
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
      <!-- Bill Code -->
      <g:if test="${billInstance?.code}">
        <li class="fieldcontain">
          <span id="code-label" class="property-label"><g:message code="code.label" default="Bill Code" /></span>
          <span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${billInstance}" field="code"/></span>
        </li>
      </g:if>

      <!-- Company Profile -->

      <g:if test="${com.fh.common.Office.get(billInstance.office.id)?.id}">
        <li class="fieldcontain">
          <span id="office-title-label" class="property-label"><g:message code="office.title.label" default="Office" /></span>
          <span id="office-expand" class="property-value" aria-labelledby="title-label" title="Click to show more"><strong><g:fieldValue bean="${com.fh.common.Office.get(billInstance.office.id)}" field="title"/></strong></span>
        </li>
        <div id="office-content">
          <li class="fieldcontain">
            <span id="office-address-label" class="property-label"><g:message code="office.title.label" default="Office Address" /></span>
            <span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${com.fh.common.Office.get(billInstance.office.id)}" field="address"/></span>
          </li>
          <li class="fieldcontain">
            <span id="office-phone-number-label" class="property-label"><g:message code="office.title.label" default="Office Phone Number" /></span>
            <span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${com.fh.common.Office.get(billInstance.office.id)}" field="phoneNumber"/></span>
          </li>
          <li class="fieldcontain">
            <span id="office-fax-number-label" class="property-label"><g:message code="office.title.label" default="Office Fax Number" /></span>
            <span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${com.fh.common.Office.get(billInstance.office.id)}" field="faxNumber"/></span>
          </li>
          <li class="fieldcontain">
            <span id="office-email-label" class="property-label"><g:message code="office.title.label" default="Office Email" /></span>
            <span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${com.fh.common.Office.get(billInstance.office.id)}" field="email"/></span>
          </li>
          <g:if test="${com.fh.common.Office.get(billInstance.office.id)?.vatNumber}">
            <li class="fieldcontain">
              <span id="title-label" class="property-label"><g:message code="office.title.label" default="Office Vat Number" /></span>
              <span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${com.fh.common.Office.get(billInstance.office.id)}" field="vatNumber"/></span>
            </li>
          </g:if>
        </div>
      </g:if>

      <!-- Customer profile -->
      <g:if test="${com.fh.common.Office.get(billInstance.customer.id)?.id}">
        <li class="fieldcontain">
          <span id="customer-title-label" class="property-label"><g:message code="customer.title.label" default="Customer"/></span>
          <span id="customer-expand" class="property-value" aria-labelledby="title-label" title="Click to show more"><strong><g:fieldValue bean="${com.fh.common.Customer.get(billInstance.customer.id)}" field="title"/></strong></span>
        </li>
        <div id="customer-content">
          <li class="fieldcontain">
            <span id="customer-address-label" class="property-label"><g:message code="customer.title.label" default="Customer Address"/></span>
            <span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${com.fh.common.Customer.get(billInstance.customer.id)}" field="address"/></span>
          </li>
          <li class="fieldcontain">
            <span id="customer-customer-code-label" class="property-label"><g:message code="customer.title.label" default="Customer Code"/></span>
            <span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${com.fh.common.Customer.get(billInstance.customer.id)}" field="customerCode"/></span>
          </li>
          <li class="fieldcontain">
            <span id="customer-phone-number-label" class="property-label"><g:message code="customer.title.label" default="Customer Phone Number"/></span>
            <span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${com.fh.common.Customer.get(billInstance.customer.id)}" field="phoneNumber"/></span>
          </li>
          <li class="fieldcontain">
            <span id="customer-fax-number-label" class="property-label"><g:message code="customer.title.label" default="Customer Fax Number"/></span>
            <span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${com.fh.common.Customer.get(billInstance.customer.id)}" field="faxNumber"/></span>
          </li>
          <li class="fieldcontain">
            <span id="customer-email-label" class="property-label"><g:message code="customer.title.label" default="Customer Email"/></span>
            <span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${com.fh.common.Customer.get(billInstance.customer.id)}" field="email"/></span>
          </li>
        </div>
      </g:if>

      <!-- Dates -->

      <li class="fieldcontain">
        <span id="date-on-bill-label" class="property-label"><g:message code="dateOnBill.label" default="Date on Bill"/></span>
        <span id="date-expand" class="property-value" aria-labelledby="date-on-bill-label" title="Click to show more"><strong>${String.format('%tA %<te %<tB %<tY', billInstance.dateOnBill)}</strong></span>
      </li>
      <div id="date-content">
        <li class="fieldcontain">
          <span id="date-created-label" class="property-label"><g:message code="dateCreated.label" default="Date Created"/></span>
          <span class="property-value" aria-labelledby="date-created-label">${String.format('%tA %<te %<tB %<tY', billInstance.dateCreated)}</span>
        </li>
        <li class="fieldcontain">
          <span id="last-updated-label" class="property-label"><g:message code="lastUpdated.label" default="Last Updated"/></span>
          <span class="property-value" aria-labelledby="last-updated-label">${String.format('%tA %<te %<tB %<tY', billInstance.lastUpdated)}</span>
        </li>
        <li class="fieldcontain">
          <span id="printed-date-label" class="property-label"><g:message code="printedDate.label" default="Printed Date"/></span>
        <g:if test="${billInstance?.printedDate}">
          <span class="property-value" aria-labelledby="printed-date-label">${String.format('%tA %<te %<tB %<tY', billInstance.printedDate)}</span>
        </g:if>
        </li>
      </div>


      <!-- Order table -->
      <table>
        <tr> 
          <th><g:message code="ordinal.label" default="Ordinal"/></th>
        <th><g:message code="model.label" default="Model"/></th>
        <th><g:message code="brand.label" default="Brand"/></th>
        <th><g:message code="description.label" default="Description"/></th>
        <th><g:message code="quantity.label" default="Quantity"/></th>
        <th><g:message code="unitPrice.label" default="Unit Price"/></th>
        <th><g:message code="discountType.label" default="Discount Type"/></th>
        <th><g:message code="discount.label" default="Discount"/></th>
        <th><g:message code="total.label" default="Total"/></th>
        </tr>

        <!-- Order List -->
        <g:each in="${billInstance.items}" status="i" var="item">
          <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
            <td>${fieldValue(bean: item, field: "ordinal")}</td>
            <td>${fieldValue(bean: item, field: "model")}</td>
            <td>${fieldValue(bean: item, field: "brand")}</td>
            <td>${fieldValue(bean: item, field: "description")}</td>
            <td>${fieldValue(bean: item, field: "quantity")}</td>
            <td>${String.format('%,.2f',item.unitPrice as double)}</td>
            <td>${com.fh.monarch.BillItem.DISCOUNT_NAMES[item.discountType]}</td>
            <td>${String.format('%,.2f',item.discount as double)}</td>
            <td>${String.format('%,.2f',item.total as double)}</td>
          </tr>
        </g:each>

        <!-- summary -->
        <g:if test="${billInstance.isVat}">
          <tr>
            <td></td><td></td><td></td><td></td><td></td><td></td><td></td>
            <td>Sub Total</td>
            <td>${String.format('%,.2f',billInstance.subTotalPrice)}</td>
          </tr>
          <tr>
            <td></td><td></td><td></td><td></td><td></td><td></td><td></td>
            <td>Vat</td>
            <td>${String.format('%,.2f',billInstance.vatPrice)}</td>
          </tr>
        </g:if>
        <tr>
          <td></td><td></td><td></td><td></td><td></td><td></td><td></td>
          <td>Total</td>
          <td>${String.format('%,.2f',billInstance.totalPrice)}</td>
        </tr>
      </table>
      <!-- end table -->

      <!-- Condition -->
      <g:each in="${billInstance.conditions}" status="i" var="condition">
${fieldValue(bean: condition, field: "description")} <br />
      </g:each>
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
