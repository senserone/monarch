package com.fh.common

class Customer {
    
    String title
    String address 
    String customerCode   
    String faxNumber
    String email
    String phoneNumber
    
    Office office
    
    static mapping = {
        version false
    }
    
    static constraints = {
        title(nullable:false,blank:false)
        customerCode(nullable:true,blank:true)
        address(nullable:true, maxSize:1500,widget:true)
        phoneNumber(nullable:true,blank:true)
        faxNumber(nullable:true,blank:true)
        email(nullable:true,blank:true)
    }
}
