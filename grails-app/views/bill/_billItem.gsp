<div id="item${i}" class="item-div" <g:if test="${hidden}">style="display:none;"</g:if>>

  <!-- id -->
  <g:hiddenField name='itemsList[${i}].id' value='${item?.id}'/>
  <!-- deleted -->
  <g:hiddenField name='itemsList[${i}].deleted' value='false'/>
  <!-- new -->
  <g:hiddenField name='itemsList[${i}].new' value='false'/>

  <!-- form field -->
  <table>
    <tr>
      <!-- model :: text field -->
      <td><label for="itemModel">Model</label></td>
      <td><g:textField name='itemsList[${i}].model' value='${item?.model}' require=""/></td>

      <!-- brand :: text field -->
      <td><label for="itemBrand">Brand</label></td>
      <td><g:textField name='itemsList[${i}].brand' value='${item?.brand}' /></td>
    
      <td><label for="itemQuantity">Quantity</label></td>
      <td><g:textField name='itemsList[${i}].quantity' min="0" value='${item?.quantity}' required=""/></td>
    </tr>

    <tr ><!-- description :: test area -->
      <td rowspan="4"><label for="itemDescription">Description</label></td>
      <td rowspan="4" colspan="3"><g:textArea name='itemsList[${i}].description' value='${item?.description}' required="" /></td>
    </tr>

    <tr>  
      <td><label for="itemUnitPrice">Unit Price</label></td>
      <td><g:textField name='itemsList[${i}].unitPrice' min="0.0" value='${item?.unitPrice}' required=""/></td>
    </tr>

    <tr>
      <td><label for="itemDiscountType">Discount Type</label></td>
      <td><g:select name="itemsList[${i}].type"
                  from="${com.fh.monarch.BillItem.DiscountType.values()}"
                  optionKey="key"
                  optionValue="value"
                  value = "${item?.discountType?.key}" required=""/></td>
    </tr>
    <tr>
      <td><label for="itemDiscount">Discount</label></td>
      <td><g:textField name='itemsList[${i}].discount' min="0.0" value='${item?.discount}'/></td>
    </tr>


  </table>
  <!-- form field -->    
</div>
