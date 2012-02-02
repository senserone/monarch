package com.fh.monarch 
import com.fh.common.*
import org.apache.commons.collections.list.LazyList;
import org.apache.commons.collections.FactoryUtils;

class Bill {
    public enum BillType{
        B("Bill"),
        Q("Quotation")
        
        final String value;
 
        BillType(String value) {
            this.value = value
        }
        String toString(){
            value
        }
        String getKey(){
            name()
        }
        static list() {
            [B, Q]
        }
    }
    
    public enum BillStatus{
        DEL("Deleted"),
        PEN("Pending"),
        PRI("Printed"),
        SEN("Sent"),
        PAI("Paid")
        
        final String value
 
        BillStatus(String value) {
            this.value = value
        }
        String toString(){
            value;
        }
        String getKey(){
            name()
        }
        static list() {
            [DEL, PEN, PRI, SEN, PAI]
        }
    }
    
    static constraints = {
        printedDate( nullable:true, display:false)
        code( nullable:false, blank:false )
        isVat( nullable:false, blank:false, defalut:false )
        type( blank:false, inList:BillType.list(), minSize:1, maxSize:1 )
        status( blank:false, inList:BillStatus.list(), minSize:3, maxSize:3 )
        description( nullable:true, maxSize:1500, widget:true )
    }
    
    static mapping = {
        items sort:"ordinal"
        condition sort:"id"
        autoTimestamp true
        version false
        items cascade:"all-delete-orphan"
        conditions cascade:"all-delete-orphan" 
    }
    
    static transients = [
        "vatPrice",
        "subTotalPrice",
        "totalPrice"
    ]
    
    static hasMany = [items: BillItem, conditions: BillCondition]
     
    List items = new ArrayList() 
    List conditions = new ArrayList()
    
    BillType type
    BillStatus status
    
    Date dateCreated 
    Date lastUpdated
    Date dateOnBill
    Date printedDate
    
    String code
    boolean isVat
    String description
    
    Customer customer
    Office office
    
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
    
    def getItemsList() {
        return LazyList.decorate(
            items,
            FactoryUtils.instantiateFactory(BillItem.class))
    }
    
    def getConditionsList() {
        return LazyList.decorate(
            conditions,
            FactoryUtils.instantiateFactory(BillCondition.class))
    }
    
}
