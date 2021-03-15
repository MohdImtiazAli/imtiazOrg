({
    showListData:function(component,event,helper){
        alert("Hi");
        var action=component.get("c.accountListData");
       
        action.setCallback(this,function(response){
            alert(JSON.stringify(response.getReturnValue()));
            if(response.getReturnValue()!=null){
                console.log(JSON.stringify(response.getReturnValue()))
                component.set("v.accountList",response.getReturnValue())
            }
        });
        $A.enqueueAction(action);
    },
	forSubmittingData : function(component,event,helper) {
        var nameOfAttribute=component.get("v.Name");
        console.log("nameOfAttribute===> "+nameOfAttribute);
        
        var phoneOfAttribute=component.get("v.Phone");
        console.log("phoneOfAttribute===> "+phoneOfAttribute);
        var action=component.get("c.forAccountInsert");
        action.setParams({
            Accname:nameOfAttribute,
            Accphone:phoneOfAttribute
        });
         action.setCallback(this,function(response){
            var state=response.getState();
            if(state=="SUCCESS"){
                alert("Your Account is Inserted");
                console.log(JSON.stringify(response.getReturnValue()));
                var Account=response.getReturnValue();
                
           component.set('v.showData',Account);
           component.set('v.data',JSON.stringify(response.getReturnValue()));
            }else if(state=="ERROR"){
                alert("for error==> "+state.getError());
                $A.log("Errors", state.getError());
            }
        });

        
       $A.enqueueAction(action);
           
	}
})