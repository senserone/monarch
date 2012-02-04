
<script type="text/javascript">
  
  var childCount = ${billInstance?.items.size()} + 0;
  var formClone;
  var htmlId;
  
  // about item
  function addItem(){
    // show dialog Add-Item form
    clone = $("#item_clone").clone();
    
    htmlId = 'itemsList['+childCount+'].';
    
    var modelInput = clone.find("input[id$=model]");
    var brandInput = clone.find("input[id$=brand]");
    var descriptionInput = clone.find("textarea[id$=description]");
    var quantityInput = clone.find("input[id$=quantity]");
    var unitPriceInput = clone.find("input[id$=unitPrice]");
    var discountInput = clone.find("input[id$=discount]");
           
    clone.find("input[id$=deleted]")
           .attr('id',htmlId + 'deleted')
           .attr('name',htmlId + 'deleted');
           
    clone.find("input[id$=new]")
           .attr('id',htmlId + 'new')
           .attr('name',htmlId + 'new');
    
    // model
    modelInput.attr('id',htmlId + 'model')
              .attr('name',htmlId + 'model');
    
    // brand
    brandInput.attr('id',htmlId + 'brand')
              .attr('name',htmlId + 'brand');
    
    // description
    descriptionInput.attr('id',htmlId + 'description')
                    .attr('name',htmlId + 'description');
    
    // quantity
    quantityInput.attr('id',htmlId + 'quantity')
                 .attr('name',htmlId + 'quantity');
    
    // unitPrice
    unitPriceInput.attr('id',htmlId + 'unitPrice')
                  .attr('name',htmlId + 'unitPrice');
    
    // discountType
    clone.find("select[id$=discountType]")
           .attr('id',htmlId + 'discountType')
           .attr('name',htmlId + 'discountType');
           
    // discount           
    discountInput.attr('id',htmlId + 'discount')
                 .attr('name',htmlId + 'discount');
    
    // id
    clone.attr('id', 'item'+childCount);
    
    $('#childItemList').append(clone);
    clone.show();
    
    modelInput.focus();
    brandInput.focus();
    descriptionInput.focus();
    quantityInput.focus();
    unitPriceInput.focus();
    discountInput.focus();
    childCount++;
  }
  
  //bind click event on delete buttons using jquery live
  $('.del-item').live('click', function() {
      //find the parent div
      var prnt = $(this).parents(".item-div");
      //find the deleted hidden input
      var delInput = prnt.find("input[id$=deleted]");
      //check if this is still not persisted
      var newValue = prnt.find("input[id$=new]").attr('value');
      //if it is new then i can safely remove from dom
      if(newValue == 'true'){
          prnt.remove();
      }else{
          //set the deletedFlag to true
          delInput.attr('value','true');
          //hide the div
          prnt.hide();
      }
  });
  
  $('.hide-item').live('click', function(){
    htmlId = 'itemsList['+childCount+'].';
    var prnt = $(this).parents(".item-table");
    var hidTr = prnt.find('tr[class$=hidable]')
    var itemReview = prnt.find('div[class$=item-review]')
    var hideBtn = prnt.find('span[class$=hide-item]')
    var showBtn = prnt.find('span[class$=show-item]')
    
    var modelVal = prnt.find("input[id$=model]").val();
    var quantityVal = prnt.find("input[id$=quantity]").val();
    var unitPriceVal = prnt.find("input[id$=unitPrice]").val();
    
    itemReview.text("model: " + modelVal + " | quantity: " + quantityVal + " | unit price: " + unitPriceVal );
    
    hideBtn.hide();
    hidTr.hide();
    itemReview.show();
    showBtn.show();
  });
  
  $('.show-item').live('click', function(){
    var prnt = $(this).parents(".item-table");
    var hidTr = prnt.find('tr[class$=hidable]')
    var itemReview = prnt.find('div[class$=item-review]')
    var hideBtn = prnt.find('span[class$=hide-item]')
    var showBtn = prnt.find('span[class$=show-item]')
    
    hideBtn.show();
    hidTr.show();
    itemReview.hide();
    showBtn.hide();
  });
 
</script>
<table>
  <div id="childItemList">
    <g:each var="item" in="${billInstance.items}" status="i">
      <!-- Render the billItem template (_billItem.gsp) here -->
      <g:render template='billItem' model="['item':item,'i':i,'hidden':false]"/>
      <!-- Render the billItem template (_billItem.gsp) here -->
    </g:each>
  </div>
</table>
<input type="button" value="Add Item" onclick="addItem();" />