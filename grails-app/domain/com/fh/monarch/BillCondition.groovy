package com.fh.monarch

class BillCondition {
    
    String title
    String about
    String description
    boolean deleted
    static transients = [ 'deleted' ]
    
    static constraints = {
        title( nullable:false, blank:false)
        about( nullable:true, blank:true)
        description( nullable:true, maxSize:1500, widget:true)
    }
    
    static mapping = {
         version false
    }
}
