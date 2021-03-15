({
    doInit : function(component, event, helper) {
        component.set("v.AccountColumns",[
            {
                label : 'Name',
                fieldName : 'Name',
                type : 'text',
                sortable : true
            },
            {
                label : 'Rating',
                fieldName : 'Rating',
                type : 'text',
                sortable : true
            },
            {
                label : 'Number Of Employees',
                fieldName : 'NumberOfEmployees',
                type : 'Number',
                sortable : true
            }
            
        ]);
        helper.getAccountDetails(component, event, helper);
    },
    handleSort:function(component, event, helper) {
        var sortBy = event.getParam("fieldName");
        console.log(sortBy);
        var sortDirection = event.getParam("sortDirection");
        console.log(sortDirection);
        
        component.set("v.sortBy",sortBy);
        component.set("v.sortDirection",sortDirection);
        helper.sortYourData(component,sortBy,sortDirection);
    }
})