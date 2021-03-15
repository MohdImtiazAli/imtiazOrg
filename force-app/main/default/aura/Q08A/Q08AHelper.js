({
    getAccountDetails : function(component, event, helper) {
        var action=component.get("c.forAccountList");
        action.setCallback(this,function(response){
            console.log(response.getReturnValue());
            if(response.getState()==="SUCCESS"){
               var accountWrapper = response.getReturnValue();
                component.set("v.AccountData", accountWrapper.AccountList);
                var datas= component.get("v.accountData");
                alert(datas);
            }
        });
        $A.enqueueAction(action);
        
    },
    sortYourData : function(component,fieldName,sortDirection){
        var data = component.get("v.AccountData");
            
      
        var key = function(a) { 
            console.log("key fieldName==  "+a[fieldName]);
            return a[fieldName]; 
        }
       console.log("key "+key);
         if(fieldName == 'NumberOfEmployees'){ 
            data.sort(function(a,b){
                var a = key(a) ? key(a) : '';
                var b = key(b) ? key(b) : '';
                return reverse * ((a>b) - (b>a));
            }); 
        }else{// to handel text type fields 
            data.sort(function(a,b){ 
                var a = key(a) ? key(a).toLowerCase() : '';//To handle null values , uppercase records during sorting
                var b = key(b) ? key(b).toLowerCase() : '';
                return reverse * ((a>b) - (b>a));
            });    
        }
        component.set("v.AccountData",data);
    }
})