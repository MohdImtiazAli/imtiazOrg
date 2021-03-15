({
   forAddingNewRow : function(component, event, helper){
       alert("event");
        component.getEvent("forAddingRow").fire();     
    },    
   forDeletingNewRow : function(component, event, helper){
     // fire the DeleteRowEvt Lightning Event and pass the deleted Row Index to Event parameter/attribute
       component.getEvent("forDeletingRow").setParams({"indexVar" : component.get("v.rowIndex") }).fire();
    }, 
  
})