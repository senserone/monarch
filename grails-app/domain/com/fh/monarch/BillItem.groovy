package com.fh.monarch

class BillItem {
    public enum DiscountType{
        N("No Discount"),
        P("Percent"),
        B("Baht")
        
        final String value;
 
        DiscountType(String value) {
            this.value = value;
        }
        String toString(){
            value;
        }
        String getKey(){
            name()
        }
        static list() {
            [N,P,B]
        }
    }
    
    
    Integer ordinal
    String model
    String brand
    String description
    
    Integer quantity
    
    Double unitPrice
    Double discount
    
    DiscountType discountType
    
    Double total

    static belongsTo = [bill: Bill]
    
    boolean deleted
    static transients = [ 'deleted', 'total' ]
    
    static constraints = {
        ordinal( nullable:false, blank:false )
        model( nullable:false, blank:true )
        brand( nullable:true, blank:true )
        description( nullable:false, blank:false, maxSize:1500, widget:true )
        unitPrice( nullable:false, blank:false, min: 0d )
        quantity( nullable:false, blank:false, min: 0 )
        discountType( blank:false, inList:DiscountType.list(), minSize:1, maxSize:1 )
        discount( nullable:true, blank:true, min: 0d )
        total( display:false, min: 0d )
    }
    
    static mapping = {
        version false
    }
    
    def String toString() {
        return "($ordinal) ${model} - ${total}"
    }
    
    def double getTotal(){
        def result = 0d
        
        if(discount?.key){
            def dt = discountType?.key
            if(dt=="No Discount"){
                result = quantity*unitPrice
            }else if(dt=="Percent"){
                result = (quantity*unitPrice)*(1-(discount/100))
            }else if(dt=="Baht"){
                result = (quantity*unitPrice) - discount
            }
        }
        
        return result
    }
}
