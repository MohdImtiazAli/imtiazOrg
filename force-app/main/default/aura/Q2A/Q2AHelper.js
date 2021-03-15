({
    helperMethod : function(c,e,h) {
        var action=c.get('c.forAccount');
        /* action.setParams({
               
            });*/
        action.setCallback(this,function(response){
            
            if(response.getReturnValue() != null){
                
                c.set('v.AccountList', response.getReturnValue());
                                            
                console.log( 'response-->'+ JSON.stringify(response.getReturnValue()));
            }
            
            
        });
        
        $A.enqueueAction(action);
        
    },
    OpportunityfromAccount:function(c,e,h){
        var Accountsid=e.getSource().get("v.value");
        var action=c.get("c.forOpportunity");
        action.setParams({
            ACId:Accountsid
        }); 
        action.setCallback(this,function(response){
            if(response.getState()==="SUCCESS"){
                console.log( 'response-->'+ JSON.stringify(response.getReturnValue()));             
                c.set("v.Opportunities",response.getReturnValue())
                
            }
        });
        $A.enqueueAction(action);
    },
    
     ContactfromAccount:function(c,e,h){
        var Accountsid=e.getSource().get("v.value");
        var action=c.get("c.forContact");
        action.setParams({
            ACId:Accountsid
        }); 
        action.setCallback(this,function(response){
            if(response.getState()==="SUCCESS"){
                console.log( 'response-->'+ JSON.stringify(response.getReturnValue()));             
                c.set("v.Contacts",response.getReturnValue())
                
            }
        });
        $A.enqueueAction(action);
    },
     
})