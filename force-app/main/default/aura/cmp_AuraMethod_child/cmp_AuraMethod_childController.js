({
	doAction : function(component, event, helper) {
		var params = event.getParam("arguments");
        console.log("params "+params);
        if (params) {
            var param = params.param;
            console.log(param);
            component.set('v.no_times',param);
        }
    }
   
	
})