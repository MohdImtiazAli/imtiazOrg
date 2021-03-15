({
	doSave : function(component, event, helper) {
		var action=component.get("c.createContact");
        console.log(component.get("v.contObj"));
        action.setParams({
            "contObj":component.get("v.contObj")
        });
        action.setCallback(this,function(data){
            if(data.getState()==="SUCCESS"){
                console.log("SUCCESS");
                console.log(data.getReturnValue());
            }
        }  )
        $A.enqueueAction(action);
	}
})