<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'bill.label', default: 'Bill')}" />
  <title><g:message code="default.edit.label" args="[entityName]" /></title>


  <style>
    #dialog-fieldset { padding:0; border:0; margin-top:25px; }
    input.text { margin-bottom:12px; width:95%; padding: .4em; }
    #condDesc {color: #00AA00;}
  </style>

  <script type="text/javascript">
    $(document).ready(function()
        {
          
          check();
          $('#code').attr("disabled", "disabled");
          
          $('#isVisible').click(function(){
           check();
          });
          
/***** aboun Add Item Dialog *****/
          
          var model = $( "#itemModel" ),
              brand = $( "#itemBrand" ),
              desc = $( "#itemDesc" ),
              qtt = $( "#itemQtt" ),
              ppi = $( "#itemPPI" ),
              disType = "DISCOUNT_TYPE_NO_DISCOUNT",
              disTypeText = "No Discount",
              disAmount = $( "#itemDisAmount" ), 
              itemRowCount = $("#itemAmount").val(),
              allFields = $( [] ).add( model ).add( brand ).add( desc ).add(qtt).add(ppi).add(disAmount),
              tips = $( ".validateTips" );
              
          function clear_form_elements(ele) {
            $(ele).find(':input').each(function() {
              switch(this.type) {
                  case 'password':
                  case 'select-multiple':
                  case 'select-one':
                  case 'text':
                  case 'textarea':
                      $(this).val('');
                      break;
                  case 'checkbox':
                  case 'radio':
                      this.checked = false;
              }
          });

}
          $("#addItem").click(function() {
                        clear_form_elements($( "#dialog-itemform" ));
                        $( "#dialog-item" ).dialog("open");
                        return false;
                });
                
          $(".delete").live('click', function(event) {
                        $(this).parent().parent().remove();
          });      
          
          $("#dialog-item:ui-dialog" ).dialog( "destroy" );
                 
          function updateTips( t ) {
                  tips
                          .text( t )
                          .addClass( "ui-state-highlight" );
                  setTimeout(function() {
                          tips.removeClass( "ui-state-highlight", 1500 );
                  }, 500 );
          }

          function checkLength( o, n, min, max ) {
                  if ( o.val().length > max || o.val().length < min ) {
                          o.addClass( "ui-state-error" );
                          updateTips( "Length of " + n + " must be between " +
                                  min + " and " + max + "." );
                          return false;
                  } else {
                          return true;
                  }
          }
          function isNumber(elem,name) {
            if(!isNaN(parseFloat(elem.val())) && isFinite(elem.val())){
              return true
            } else {
              elem.addClass( "ui-state-error" );
              updateTips( name + " must be Number.");
              return false;
            }
          }
          
          function isMoreThanZero(elem, name){
            if(elem.val()>0){
              return true;
            }else{
              elem.addClass( "ui-state-error" );
              updateTips( name + " must be more than 0");
              return false;
            }
              
          }
          
          function isPositive(elem,name){
            if(elem.val()>=0){
              return true;
            }else{
              elem.addClass( "ui-state-error" );
              updateTips( name + " must be Positive Number.");
              return false;
            }
          }

          $("#dialog-item").dialog({
                        autoOpen: false,
                        height: 640,
                        width: 700,
                        show: "clip",
                        hide: "clip",
                        title: "Add New Item",
                        buttons: {
                                "Add Item": function() {
                                  var bValid = true;
                                  
                                  allFields.removeClass( "ui-state-error" );
                                  
                                  bValid = bValid && checkLength( model, "Model", 1, 50 );
                                  
                                  bValid = bValid && isNumber( qtt, "Quantity");
                                  bValid = bValid && isMoreThanZero( qtt, "Quantity"); // > 0
                                  
                                  bValid = bValid && isNumber( ppi, "Price Per Item");
                                  bValid = bValid && isPositive( ppi, "Price Per Item"); // >=0
                                  
                                  
                                  if(disAmount.val() != ""){
                                    bValid = bValid && isNumber( disAmount, "Discount Amount");
                                    bValid = bValid && isPositive( disAmount, "Discount Amount");
                                  }
                                  
                                  if(bValid){
                                    $( "#items tbody" ).append( '<tr id=itemRow'+ itemRowCount +'>' +
                                            '<td><input type="hidden" name="models" value="'+model.val()+'"/>' + model.val() + '</td>' + 
                                            '<td><input type="hidden" name="brands" value="'+brand.val()+'"/>' + brand.val() + '</td>' + 
                                            '<td><input type="hidden" name="descs" value="'+desc.val()+'"/>' + desc.val() + '</td>' +
                                            '<td><input type="hidden" name="qtts" value="'+Number(qtt.val())+'"/>' + qtt.val() + '</td>'+ 
                                            '<td><input type="hidden" name="ppis" value="'+Number(ppi.val())+'"/>' + ppi.val() + '</td>' + 
                                            '<td><input type="hidden" name="disTypes" value="'+disType+'"/>' + disTypeText + '</td>' +
                                            '<td><input type="hidden" name="disAmounts" value="'+Number(getDisAmount(disType,disAmount.val()))+'"/>' + getDisAmount(disType,disAmount.val()) + '</td>' +
                                            '<td><input type="hidden" name="totalPrices" value="'+Number(getTotalPrice(qtt.val(), ppi.val(), disType, disAmount.val()))+ '"/>' + getTotalPrice(qtt.val(), ppi.val(), disType, disAmount.val()) + '</td>' +
                                            '<td><a href="#" class="delete">remove</a></td>'+
                                    '</tr>'); 
                                    itemRowCount = itemRowCount + 1;
                                    $( this ).dialog( "close" );
                                  }
                                },
                                Cancel: function() {
                                        $( this ).dialog( "close" );
                                }
                        }
                });
                
          
          
          function getDisAmount(disType,disAmount){
            var result = 0;
            if(disType!="DISCOUNT_TYPE_NO_DISCOUNT" && disAmount != ""){
             result = disAmount;
            }
            return parseFloat(result);
          }
          function getTotalPrice(qtt,ppi,disType,disAmount){
            var total = qtt * ppi;
            if(disType != "DISCOUNT_TYPE_NO_DISCOUNT"){
              if(disType=="DISCOUNT_TYPE_PERCENT"){
                total = total*(100-disAmount)/100;
              } else if(disType=="DISCOUNT_TYPE_BAHT"){
                total = total-disAmount;
              }
            }
            return parseFloat(total);
          }
          
          $("#discountLabel").hide();
          
          $("#itemNoDiscount").click(function(){
            disType = "DISCOUNT_TYPE_NO_DISCOUNT";
            disTypeText = "No Discount";
            $("#discountLabel").hide();
          });
          
          $("#itemDisInPercent").click(function(){
            disType = "DISCOUNT_TYPE_PERCENT";
            disTypeText = "Percent";
            $("#discountLabel").show();
          });
          
          $("#itemDisInBaht").click(function(){
            disType = "DISCOUNT_TYPE_BAHT";
            disTypeText ="Baht";
            $("#discountLabel").show();
          });
          
/*@@@@@ End Add Item dialog @@@@@*/

/***** Add Condition *****/
      var condId = $('#condSelect option:selected').val(),
      condTitle = $("#condTitle"),
      condDesc = $( "#itemBrand" ),
      condRowCount = 0;
      
      $("#addCond").click(function() {
          $( "#dialog-condition" ).dialog("open");
          showCondDesc();
          return false;
      });
                
      $('#condSelect').change(function(){
        showCondDesc();
        condId = $('#condSelect option:selected').val()
      });
      
      function showCondDesc(){
         $.ajax({
          url:"${request.contextPath}/billCondition/getCondDesc",
          dataType: 'text',
          data: {
                  id: $('#condSelect option:selected').val(),
          },
          success: function(data) {
            $('#condDesc').html(""+data);
          }
        });
      }
      
      $("#dialog-condition").dialog({
                        autoOpen: false,
                        height: 300,
                        width: 500,
                        show: "clip",
                        hide: "clip",
                        title: "Add New Condition",
                        buttons: {
                          "Add Condition": function(){
                            var condDesc = $('#condDesc').text();
                            $('#conds tbody').append('<tr id=itemRow'+ condRowCount +'>'+
                               '<td><input type="hidden" name="conditions" value="'+ condId +'"/>' + condDesc + '</td>' +
                               '<td><a href="#" class="delete">remove</a></td>'+
                            '</tr>'); 
                            condRowCount = condRowCount + 1;
                            $( this ).dialog( "close" );
                            return false;
                          },
                          Cancel: function() {
                                  $( this ).dialog( "close" );
                          }
                        }
                });
/*@@@@@ End Add Condition @@@@@@*/
     });
        
    function check(){
       if($('#isVisible').attr('checked')==false){
              $('#code').removeAttr("disabled");
            }else{
              $('#code').attr("disabled", "disabled");
            }
    }
  </script>


</head>
<body>
  <a href="#edit-bill" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
  <div class="nav" role="navigation">
    <ul>
      <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
      <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
    </ul>
  </div>
  <div id="edit-bill" class="content scaffold-edit" role="main">
    <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
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
    <g:form action="update" >
      <g:hiddenField name="id" value="${billInstance?.id}" />
      <fieldset class="form">
        <!-- bill type -->
        <div class="fieldcontain ${hasErrors(bean: billInstance, field: 'billType', 'error')} required" >
          <label for="billType">
            <g:message code="bill.billType.label" default="Bill Type" />
            <span class="required-indicator">*</span>
          </label>
          <g:radioGroup name="billType" required=""
                        labels="['TYPE_BILL','TYPE_QUOTATION']"
                        values="[1,2]"
                        value="${billInstance.billType}">${it.radio} ${it.label} 
          </g:radioGroup>
        </div>
        <!-- date on bill -->
        <div class="fieldcontain ${hasErrors(bean: billInstance, field: 'dateOnBill', 'error')} ">
          <label for="dateOnBill">
            <g:message code="bill.dateOnBill.label" default="Date on Bill" />
            <span class="required-indicator">*</span>
          </label>
          <g:datePicker name="dateOnBill" required="" value="${new Date()}" precision="day" />
        </div>

        <!-- Bill Description-->
        <div class="fieldcontain ${hasErrors(bean: billInstance, field: 'description', 'error')} ">
          <label for="description">
            <g:message code="bill.code.label" default="Description" />
          </label>
          <g:textArea id="description" name="description" title="Bill's description" value="${billInstance?.description}"/>
        </div>

        <!-- Bill Code Auto Gen?-->
        <div class="fieldcontain ${hasErrors(bean: billInstance, field: 'code', 'error')} ">
          <label for="code">
            <g:message code="bill.code.label" default="Code Auto Gen?" />
            <span class="required-indicator">*</span>
          </label>
          <g:checkBox id="isVisible" name="isAutoGen" value="${true}"/>
          <g:textField id="code" name="code" title="Put Bill Code Here" value="${billInstance?.code}"/>
          <g:hiddenField id="hiddenCode" name="hiddenCode" value="${billInstance?.code}"/>
        </div>

        <!-- is Vat -->
        <div class="fieldcontain ${hasErrors(bean: billInstance, field: 'isVat', 'error')} ">
          <label for="isVat">
            <g:message code="bill.isVat.label" default="Is vat?" />
          </label>
          <g:checkBox id="isVat" name="isVat" value="${billInstance?.isVat}"/>
        </div>

        <!-- Customer -->  
        <div class="fieldcontain ${hasErrors(bean: billInstance, field: 'customer', 'error')} required ">
          <label for="customer">
            <g:message code="bill.customer.label" default="Customer" />
            <span class="required-indicator">*</span>
          </label>
          <g:select name="customer.id" noSelection="${['':'Choose Customer']}" required="" from="${com.fh.common.Customer.list()}" optionKey="id" optionValue="title" value="${billInstance?.customer?.id}"  />
        </div>
        <!-- Items -->
        <div class="fieldcontain ${hasErrors(bean: billInstance, field: 'items', 'error')} ">

          <table id="items">
            <thead>
              <tr>
                <th>Model</th>
                <th>Brand</th>
                <th>Description</th>
                <th>Quantity</th>
                <th>Price Per Item</th>
                <th>Discount Type</th>
                <th>Discount Amount</th>
                <th>Total Price (No Vat)</th>
                <th>delete</th>
              </tr>
            </thead>
            <tbody>
            <g:hiddenField id="itemAmount" name="itemAmount" value="${billInstance.items.size()}"/>
            <g:each in="${billInstance.items}" status="i" var="item">
              <tr id=itemRow${i}" class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td><g:hiddenField name="models" value="${item.model}"/> ${fieldValue(bean: item, field: "model")}</td>
                <td><g:hiddenField name="brands" value="${item.brand}"/> ${fieldValue(bean: item, field: "brand")}</td>
                <td><g:hiddenField name="descs" value="${item.description}"/> ${fieldValue(bean: item, field: "description")}</td>
                <td><g:hiddenField name="qtts" value="${item.quantity}"/> ${fieldValue(bean: item, field: "quantity")}</td>
                <td><g:hiddenField name="ppis" value="${item.unitPrice as double}"/> ${String.format('%,.2f',item.unitPrice as double)}</td>
                <td><g:hiddenField name="disTypes" value="${com.fh.monarch.BillItem.DISCOUNT_NAMES[item.discountType]}"/> ${com.fh.monarch.BillItem.DISCOUNT_NAMES[item.discountType]}</td>
                <td><g:hiddenField name="disAmounts" value="${item.discount}"/> ${String.format('%,.2f',item.discount as double)}</td>
                <td><g:hiddenField name="totalsPrice" value="${item.total}"/> ${String.format('%,.2f',item.total as double)}</td>
                <td><a href="#" class="delete">remove</a></td>
              </tr>
            </g:each>
            </tbody>
          </table>
          <div align="right">
            <a href="#" id="addItem" >Add Item</a>
          </div>
        </div>
        <!-- Conditions -->
        <div class="fieldcontain ${hasErrors(bean: billInstance, field: 'conditions', 'error')} ">
          <table  id="conds">
            <thead >
              <tr>
                <th>Conditions</th>
                <th></th>
              </tr>
            </thead>
            <tbody>
            </tbody>
          </table>
          <div align="right">
            <a href="#" id="addCond" >Add Condition</a>
          </div>
        </div>
        </br></br></br>
        <g:hiddenField name="dateCreated" value="${new Date()}" />
        <g:hiddenField name="status" value="${com.fh.monarch.Bill.STATUS_PENDING}" />
        <fieldset class="buttons">
          <g:submitButton name="update" class="update" value="${message(code: 'default.button.update.label', default: 'UPdate')}" />
        </fieldset>
    </g:form>

    <div id="dialog-item" title="Add New Item">
      <p class="validateTips"></p>
      <form id="dialog-itemform">
        <fieldset id="dialog-fieldset">
          <label for="itemModel">Model</label>
          <input type="text" name="itemModel" id="itemModel" required="" class="text ui-widget-content ui-corner-all" />
          <label for="itemBrand">Brand</label>
          <input type="text" name="itemBrand" id="itemBrand" value="" class="text ui-widget-content ui-corner-all" />
          <label for="itemDesc">Description</label>
          <input type="text" name="itemDesc" id="itemDesc" value="" class="text ui-widget-content ui-corner-all" />
          <label for="itemQtt">Quantity</label>
          <input type="text" name="itemQtt" id="itemQtt" required="" value="" class="text ui-widget-content ui-corner-all" />
          <label for="itemPPI">Price Per Item</label>
          <input type="text" name="itemPPI" id="itemPPI" required="" value="" class="text ui-widget-content ui-corner-all" />

          <label for="discount">Discount Type</label>
          <input type="radio" name="discount" id="itemNoDiscount" checked> No Discount</input>
          <input type="radio" name="discount" id="itemDisInPercent"> Percent</input>
          <input type="radio" name="discount" id="itemDisInBaht"> Baht</input>

          <div id="discountLabel">
            <label for="discountAmount">Discount Amount</label>
            <input type="text" name="itemDisAmount" id="itemDisAmount" value="" class="text ui-widget-content ui-corner-all" />
          </div>

        </fieldset>
      </form>
    </div> <!-- End dialog-item -->

    <div id="dialog-condition" title="Add Conditions">
      <label for="choose">Choose Condition</label>
      <g:select id="condSelect" name="condition.id" from="${com.fh.monarch.BillCondition.list()}" optionKey="id" optionValue="title"   />
      </br><label for="desc"><p>Description:</p></label></br>
      <div id="condDesc"></div>
      <div id="condId"></div>
    </div>

  </div>
</body>
</html>
