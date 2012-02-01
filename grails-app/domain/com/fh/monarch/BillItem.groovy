package com.fh.monarch

class BillItem {
    public static final int DISCOUNT_TYPE_NO_DISCOUNT = 0
    public static final int DISCOUNT_TYPE_PERCENT = 1
    public static final int DISCOUNT_TYPE_BAHT = 2
    public static final DISCOUNT_NAMES = ["No Discount", "Percent", "Baht"]
    Integer ordinal
    String model
    String brand
    String description
    
    Integer quantity
    
    Double unitPrice
    Double discount
    Integer discountType
    Double total

    static belongsTo = [bill: Bill]
    
    static constraints = {
        ordinal(nullable:false,blank:false)
        model(nullable:true,blank:true)
        brand(nullable:true,blank:true)
        description(nullable:false,blank:false, maxSize:1500,widget:true)
        unitPrice(nullable:false,blank:false)
        quantity(nullable:false,blank:false)
        discountType()
        discount(nullable:true,blank:true)
    }
    
    static mapping = {
         version false
    }
}
