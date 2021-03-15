({
    doInit_helper : function(c,e,h) {
        try{
            var action=c.get('c.createAccount');
            console.log("helper try");
            action.setParams({
                "ac":c.get("v.createAcc")
            })
            action.setCallback(this,function(response){
               
                if(response.getState()==="SUCCESS"){
                    console.log("HIII");
                    // c.set('v.createAcc', response.getReturnValue());
                    alert('Account Inserted');
                     console.log( 'response-->'+ JSON.stringify(response.getReturnValue()));
                }
                
                
            });
            $A.enqueueAction(action);
            
        }
        catch(err){
            console.log("errorr");
        }
        
    },
    
    method2:function(){
        
    }
})