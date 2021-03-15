({
	helperMethod : function(component, event, helper) {
		console.log(component.get('v.Name'));
        console.log(component.get('v.Phone'));
        console.log(component.get('v.AccountNumber'));
        console.log(component.get('v.BillingCity'));
        console.log(component.get('v.BillingCountry'));
        
         var action=component.get('c.ForAccount');
        action.setParams({
            Name: component.get('v.Name'),
            Phone: component.get('v.Phone'),
            ANumber: component.get('v.AccountNumber'),
            City: component.get('v.BillingCity'),
            Country: component.get('v.BillingCountry'),
        });
        action.setCallback(this,function(response){
            if(response.getReturnValue()!=null){
                console.log(JSON.stringify(response.getReturnValue()));
               alert("account is inserted") 
            }
        });
      $A.enqueueAction(action);
	}
})