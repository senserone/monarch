package com.fh.common

class Office {
    String title
    String prefixCode
    String logoTitle
    String address
    String faxNumber
    String email
    String vatNumber
    String phoneNumber
    
    static constraints = {
        title(nullable:false,blank:false)
        prefixCode(nullable:false,blank:false)
        logoTitle(nullable:true,blank:true)
        address(nullable:true, maxSize:1500,widget:true)
        faxNumber(nullable:true,blank:true)
        email(nullable:true,blank:true)
        vatNumber(nullable:true,blank:true)
        phoneNumber(nullable:true,blank:true)
    }
    
        
    static mapping = {
        version false
    }
}
