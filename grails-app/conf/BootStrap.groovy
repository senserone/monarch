class BootStrap {

    def init = { servletContext ->
        // init Office
        def office = new com.fh.common.Office(
            title:"บริษัท โฮมอาร์ค จำกัด",
            prefixCode: "HA",
            logoTitle: "homearch.png",
            address: "19/26 ม.6 ต.คอหงส์ อ.หาดใหญ่ จ.สงขลา 90110",
            faxNumber: "074-201432",
            phoneNumber: "074-201432",
            email: "sell@homearch.in.th",
            vatNumber: "308234234234"
        ).save(flush:true, failOnError:true)

        // init User
        def isAdminExist = (com.fh.common.User.findByUsername("admin") != null)
        
        if(!isAdminExist){
            def adminRole = new com.fh.common.Role()
            adminRole.with{
                setAuthority("ROLE_ADMIN")
            }
            adminRole.save(flush:true)
            def admin = new com.fh.common.User(
                title: "สรวิศ นันทมงคลกุล",
                username: "admin",
                password: "admin",
                enabled: true,
                email: "b.soravit@gmail.com",
                phoneNumber: "086-969-3282",
                office: office
            ).save(flush:true, failOnError:true)
            
            com.fh.common.UserRole.create admin,adminRole,true
        }
        

        // init Customer
        new com.fh.common.Customer(
            title: "นายลูกค้า จ่ายดี",
            address: "41/33 ม.1 ต.คอหงส์ อ.หาดใหญ่ จ.สงขลา 90110",
            customerCode: "HA0001",
            email: "senserone@gmail.com",
            phoneNumber: "081-232-4343",
            office: office
        ).save(flush:true, failOnError:true)

        //init Conditions
        new com.fh.monarch.BillCondition(
            title: "Condition 1",
            about: "",
            description: "This is Condition1's Description"
        ).save(flush:true, failOnError:true)

        new com.fh.monarch.BillCondition(
            title: "Condition 2",
            about: "",
            description: "This is Condition2's Description"
        ).save(flush:true, failOnError:true)
    }
    def destroy = {
    }
}
