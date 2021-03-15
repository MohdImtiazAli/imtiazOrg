({
	helperMethod : function(component, event, helper) {
        console.log("hi");
		console.log(component.get("{!v.FirstName}"));
        console.log(component.get("{!v.LastName}"));
        console.log(component.get("{!v.Email}"));
        console.log(component.get("{!v.Phone}"));
        var action=component.get("c.forContact");
        action.setParams({
            FN:component.get("{!v.FirstName}"),
            LN:component.get("{!v.LastName}"),
            Eml:component.get("{!v.Email}"),
            Phn:component.get("{!v.Phone}"),
        });
        action.setCallback(this,function(response){
            console.log(JSON.stringify(response.getReturnValue()));
            if(response.getReturnValue()!=null){
                alert("Your Contact is Inserted");
            }
        });
        $A.enqueueAction(action);
	}
})