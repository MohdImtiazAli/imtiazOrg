({
	helperMethod : function(component, event, helper) {
		var action=component.get("c.forContact");
        action.setCallback(this,function(response){
            console.log(response.getReturnValue());
            if(response.getReturnValue()!=null){
                component.set("v.AccountList",response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    handleClicks: function(component, event, helper) {
     var acid=component.find('AccountId').get('v.value');
        var action=component.get("c.ContactName");
    alert(acid);
         
		 action.setParams({
            "ids":acid,
            LN:component.get("{!v.LastName}")           
        });
        action.setCallback(this,function(response){
           
            if(response.getReturnValue()!=null){
                 console.log(JSON.stringify(response.getReturnValue()));
                alert("contact is inserted");
            }
        });
        $A.enqueueAction(action);
        
    }
	
})