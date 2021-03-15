({
	doInit : function(c,e,h){
         h.doInit_helper(c,e,h);
    },
	  OpportunityCloseDate : function(c,e,h){
        h.OpportunityCloseDate(c,e,h);
    },
    handleClick : function(c,e,h){
        var result=c.get("v.OpportunityList1");
        console.log(JSON.stringify(result));
        var action=c.get("c.updateOpportunity");
        action.setParams({"op":result});
        action.setCallback(this,function(response){
            if(response.getState()==="SUCCESS"){
                //console.log( 'response-->'+ JSON.stringify(response.getReturnValue()));             
                alert('updated');
            }
        });
        $A.enqueueAction(action);
    }
})