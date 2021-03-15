({
    handleClicks : function(component, event, helper) {
       
        var description=component.get("v.Description");
        var dueDate=component.get("v.DueDate");
        var reminderDate=component.get("v.ReminderDate");
        console.log("description:: "+description+"  dueDate::"+dueDate+"  reminderDate::"+reminderDate);
        
        var action=component.get('c.forTodList');
        action.setParams({
            description:description,
            dueDate:dueDate,
            reminderDate:reminderDate
        });
        action.setCallback(this,function(response){
            if(response.getReturnValue()!=null){
                
                console.log(JSON.stringify(response.getReturnValue()));
                alert("Your Task Is Added");
                var value = response.getReturnValue();
                 component.set("v.toDoData",value);
            }
        });
        $A.enqueueAction(action);
          component.set("v.Description",[]);
          component.set("v.DueDate",[]);
          component.set("v.ReminderDate",[]);
    }
})