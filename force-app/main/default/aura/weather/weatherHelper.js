({
	handleClicks : function(component, event, helper) {
		var action=component.get('c.forWeather');
        var cityName=component.get("v.city");
        action.setParams({
            "city":cityName
        });
        
        action.setCallback(this,function(response){
            console.log(JSON.stringify(response.getReturnValue()));
            if(response.getReturnValue()!=null){
                
               var value = response.getReturnValue();
                 component.set("v.data",value);
                
            }
        });
        $A.enqueueAction(action);
        
	}
})