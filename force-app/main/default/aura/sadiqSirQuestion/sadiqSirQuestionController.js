({
	 doInit: function(component, event, helper) {
         alert("Hi");
        helper.createObjectData(component, event);
    },
    
     Save: function(component, event, helper) {
         var rid = component.get("v.recordId");
         alert("hello"+rid);
        
            
            var listOpp=component.get("v.opportunityList");
            console.log(listOpp);
            var action=component.get("c.saveOpportunity");
            alert(action);
            action.setParams({
                ListOpportunity: listOpp,
                accid:rid
            });
            // set call back
            action.setCallback(this, function(response) {
                var state = response.getState();
                if (state === "SUCCESS") {
                    console.log("Inside");
                    component.set("v.opportunityList", []);
                    helper.createObjectData(component, event);
                    alert('Your record has been saved!');
                }
            });
            // enqueue the server side action  
            $A.enqueueAction(action);
       
    },
    
     AddRow: function(component, event, helper) {
        console.log("inside add row");
        helper.createObjectData(component, event);
    },
 
     
    deleteRow: function(component, event, helper) {
         console.log("inside add delete row");
        var index = event.getParam("indexVar");
            
        var AllRowsList = component.get("v.opportunityList");
        AllRowsList.splice(index, 1);
        
        component.set("v.opportunityList", AllRowsList);
    },
    
    
    AddRow2: function(component, event, helper) {
        console.log('====================');
      var List= component.get('v.opportunityList');  
        List.push({'SObject':'Opportunity','Name':'','StageName':'','CloseDate':''});
      console.log('size               '+List.length);
        
        component.set("v.opportunityList",List);
    }
    
    
    
})