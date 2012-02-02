
<script type="text/javascript">
  
  var childCount = ${billInstance?.items.size()} + 0;
  var formClone;
  var htmlId;
  
  function addItem(){
    // show dialog Add-Item form
    clone = $("#item_clone").clone();
    htmlId = 'itemsList['+childCount+'].';
    
    clone.find("input[id$=id]")
           .attr('id',htmlId + 'id')
           .attr('name',htmlId + 'id');
           
    clone.find("input[id$=deleted]")
           .attr('id',htmlId + 'deleted')
           .attr('name',htmlId + 'deleted');
           
    clone.find("input[id$=new]")
           .attr('id',htmlId + 'new')
           .attr('name',htmlId + 'new');
    
    // model
    clone.find("input[id$=model]")
           .attr('id',htmlId + 'model')
           .attr('name',htmlId + 'model');
    
    // brand
    clone.find("input[id$=brand]")
           .attr('id',htmlId + 'brand')
           .attr('name',htmlId + 'brand');
    
    // description
    clone.find("input[id$=description]")
           .attr('id',htmlId + 'description')
           .attr('name',htmlId + 'description');
    
    // quantity
    clone.find("input[id$=quantity]")
           .attr('id',htmlId + 'quantity')
           .attr('name',htmlId + 'quantity');
    
    // unitPrice
    clone.find("input[id$=unitPrice]")
           .attr('id',htmlId + 'unitPrice')
           .attr('name',htmlId + 'unitPrice');
    
    // discountType
    clone.find("input[id$=type]")
           .attr('id',htmlId + 'type')
           .attr('name',htmlId + 'type');
           
    // discount           
    clone.find("input[id$=discount]")
           .attr('id',htmlId + 'discount')
           .attr('name',htmlId + 'discount');
    
    // id
    clone.attr('id', 'item'+childCount);
    
    $('#childItemList').append(clone);
    clone.show();
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
 
</script>
<table>
<div id="childItemList">
  <g:each var="item" in="${billInstance.items}" status="i">
    <!-- Render the billItem template (_billItem.gsp) here -->
    <tr><g:render template='billItem' model="['item':item,'i':i,'hidden':false]"/></tr>
    <!-- Render the billItem template (_billItem.gsp) here -->
  </g:each>
</div>
  </table>
<input type="button" value="Add Item" onclick="addItem();" />