({
     
    helperMethod : function(component, event, helper) {
        var action=component.get("c.AllObjects");
        action.setCallback(this,function(response){
            console.log(response.getReturnValue());
            if(response.getReturnValue()!=null){
                component.set("v.objectList",response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    findFields:function(component, event, helper) {
        console.log("inside field");
        // var object1=component.find('forId').get('v.value');
        var objidx=event.getSource().get("v.value");
        component.set("v.selectedObject",objidx);
       // alert(objidx);
        var objList=component.get("v.objectList");
        console.log(objidx);  
        console.log(objList[objidx]);
        var action=component.get("c.forallObjects");
         
        action.setParams({
           "fld":objidx
        })
        action.setCallback(this,function(response){
            if(response.getReturnValue()!=null){
                console.log('success');
                component.set("v.objects",response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    findFieldTypes:function(component, event, helper) {
       var objectidx =event.getSource().get("v.value");
        console.log("inside field2 objectidx= "+objectidx);
        
      
        
        var action=component.get("c.ValueSobjFieldType");
         
        action.setParams({
           "objField":objectidx,
            "obj":component.get("v.selectedObject")
        })
        action.setCallback(this,function(response){
            if(response.getReturnValue()!=null){
                console.log('success2');
                component.set("v.Field",response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
})