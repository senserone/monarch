package com.fh.monarch
import com.fh.common.*

class Bill {
    
    public static final int TYPE_BILL = 1 
    public static final int TYPE_QUOTATION = 2
    
    public static final int STATUS_DELETED = 0
    public static final int STATUS_PENDING = 1
    public static final int STATUS_PRINTED = 2
    public static final int STATUS_SENT = 3
    public static final int STATUS_PAID = 4
    
    Date dateCreated 
    Date lastUpdated
    Date dateOnBill
    Date printedDate
    
    String code
    boolean isVat
    Integer status 
    Integer billType
    String description
    
    Customer customer
    Office office
    
    static hasMany = [items:BillItem,conditions:BillCondition]
    static constraints = {
        printedDate(nullable:true)
        code(nullable:false,blank:false)
        isVat(nullable:false,blank:false,defalut:false)
        status(inList:[STATUS_PENDING,STATUS_PRINTED,STATUS_SENT,STATUS_PAID,STATUS_DELETED])
        billType(inList:[TYPE_BILL,TYPE_QUOTATION])
        description(nullable:true, maxSize:1500,widget:true)
    }
    static mapping = {
        items sort:"ordinal"
        condition sort:"id"
        autoTimestamp true
        version false
    }
    
    def getSubTotalPrice(){
        def result = 0.0 as double
        this.items.total.each{ total ->
            result+=total as double
        }
        return result.trunc(2) 
    }
    def getVatPrice(){
        def result = 0 as double
        if(isVat) result = this.subTotalPrice * 0.07 as double
        
        return result.trunc(2) 
    }
    def getTotalPrice(){
        def result = 0 as double
        if(!isVat){
            result = this.subTotalPrice  as double
        }else{
            result = this.vatPrice + this.subTotalPrice as double
        }
        return result.trunc(2) 
    }
    static transients = [
        "vatPrice",
        "subTotalPrice",
        "totalPrice"
    ]
}
