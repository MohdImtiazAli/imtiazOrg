({
    doInit_helper : function(c,e,h) {
        var action=c.get("c.forOpportunity");
        action.setCallback(this,function(response){
            if(response.getReturnValue()!=null){
                c.set("v.OpportunityList",response.getReturnValue());
                //console.log(JSON.stringify(response.getReturnValue()));
            }
        });
        $A.enqueueAction(action); 
    },
    OpportunityCloseDate : function(c,e,h){
        var Opportunityid=e.getSource().get("v.value");
        console.log("Opportunityid",Opportunityid);
        var action=c.get("c.OpportunityClose");
        action.setParams({
            opid:Opportunityid
        })
        action.setCallback(this,function(response){
            if(response.getState()==="SUCCESS"){
                console.log( 'response-->'+ JSON.stringify(response.getReturnValue()));             
                c.set("v.OpportunityList1",response.getReturnValue())
                
            }
        });
        $A.enqueueAction(action);
    },
    
})