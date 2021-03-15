({
	handleClicks : function(component, event, helper) {
		var userN=component.get("v.UserName");
        var passwd=component.get("v.Password");
        console.log(userN+' '+passwd);
        var action=component.get("c.login");
        action.setParams({
            user:userN,
            Pass:passwd
        });
        action.setCallback(this,function(response){
            if(response.getReturnValue()!=="SUCCESS"){
                alert("Login SucessFul");
            }
        } );
     
        $A.enqueueAction(action);
          component.set("v.UserName",'');
        component.set("v.Password",'');
	}
})