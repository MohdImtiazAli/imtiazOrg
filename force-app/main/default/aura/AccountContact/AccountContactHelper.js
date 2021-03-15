({
	helperMethod : function(component,event,helper) {
		var action=component.get("c.forAccountContact");
        action.setCallback(this,function(response){
           if(response.getReturnValue() !=null){
                component.set("v.ContactList",response.getReturnValue());
                 console.log(JSON.stringify(response.getReturnValue()));
            }
        });
         $A.enqueueAction(action);
	}
})