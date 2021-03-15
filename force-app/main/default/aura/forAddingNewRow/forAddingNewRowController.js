({
	 doInit: function(component, event, helper) {
         
        helper.createObjectData(component, event);
    },
     AddRow: function(component, event, helper) {
        console.log("inside add row");
        helper.createObjectData(component, event);
    },
     Save: function(component, event, helper) {
     
            var listOpp=component.get("v.opportunityList");
            console.log(listOpp);
            var action=component.get("c.saveOpportunity");
            action.setParams({
                ListOpportunity: listOpp
         
            });
            // set call back
            action.setCallback(this, function(response) {
                var state = response.getState();
                if (state === "SUCCESS") {
                    console.log("Inside");
                    component.set("v.opportunityList", []);
                    
                    alert('Your record has been saved!');
                }
            });
            // enqueue the server side action  
            $A.enqueueAction(action);
        },
  
    
    
    
})