({
     onSave: function(component, event, helper) {
             console.log("hello");
             },
    
	handleClick : function(component, event, helper) {
         component.set("v.toDoColumns",[
            {
                label : 'Description',
                fieldName : 'Description__c',
                type : 'String',
                editable: true,
                sortable : true
            },
            {
                label : 'Due Date',
                fieldName : 'Due_Date__c',
                type : 'Date',
                editable: true,
                sortable : true
            },
            {
                label : 'Reminder Date',
                fieldName : 'Reminder_Date__c',
                type : 'Date',
                editable: true,
                sortable : true
            },
             
        ]);
        var sortBy = event.getParam("fieldName");
          component.set("v.sortBy",sortBy);
        
 
		helper.handleClicks(component, event, helper);
            
	}
})