({
     
	handleClick : function(component, event, helper) {
         component.set('v.columns', [
            {label: 'Humidity', fieldName: 'humidity', type: 'string'},
            {label: 'Max Temperature', fieldName: 'maxTemp', type: 'string'},
            {label: 'Min Temperature', fieldName: 'minTemp', type: 'string'},
            {label: 'Pressure', fieldName: 'pressure', type: 'string'}
        ]);
         var sortBy = event.getParam("fieldName");
          component.set("v.sortBy",sortBy);
		helper.handleClicks(component, event, helper);
        
        
	},
    showSpinner: function(component, event, helper) {
        component.set("v.Spinner", true); 
   },
    
    hideSpinner : function(component,event,helper){
       component.set("v.Spinner", false);
    }
})