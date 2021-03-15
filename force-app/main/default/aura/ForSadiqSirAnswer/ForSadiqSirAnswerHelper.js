({
    SetPickList : function(component, event, helper) {
        var action=component.get("c.forPickList");
        action.setCallback(this,function(response){
            
            var state=response.getState();
            console.log(state);
            
            if(state=="SUCCESS"){
                console.log(JSON.stringify(response.getReturnValue()));
                component.set('v.PickList',response.getReturnValue())
            }
        });
        
        $A.enqueueAction(action);
    },
    AddRows:function(component,event,helper){
        var oppListOfRow=component.get("{!v.OpportunityList}");
        console.log("before push: "+oppListOfRow);
        oppListOfRow.push({
            'sobjectType': 'Opportunity',
            'Name':'',
            'CloseDate':'',
            'StageName':''
        });
        console.log("before push: "+oppListOfRow);
        component.set("v.OpportunityList",oppListOfRow);
    },
    
    
    
    removeRow: function(component, event, helper) {
        
        var opList = component.get("v.OpportunityList");
        
        var selectedItem = event.currentTarget;
        
        console.log("selectedItem"+selectedItem);
        
        
        var index = selectedItem.dataset.record;
        console.log("index::  "+index);
        
        opList.splice(index, 1);
        component.set("v.OpportunityList", opList);
    },
    Cancel:function(component,event,helper){
        component.set("v.OpportunityList",[]);
    },
    Save:function(component,event,helper){
        var isRequired=validateRequired(component, event);
        if (isRequired) {
            var action=component.get("c.forSaveOpportunityInAccount");
            var recordId=component.get("v.recordId");
            action.setParams({
                "OpportunityList":component.get("v.OpportunityList"),
                "Acid":recordId
            });
            action.setCallback(this,function(response){
                var state=response.getState();
                if(state=="SUCCESS"){
                    component.set("v.OpportunityList", []);
                    alert('Your Opportunity is inserted');
                }
            });
            $A.enqueueAction(action);
        }
        function validateRequired(component, event){
            var isValid = true;
            var allContactRows = component.get("v.OpportunityList");
            for (var indexVar = 0; indexVar < allContactRows.length; indexVar++) {
                if (allContactRows[indexVar].Name == '') {
                    isValid = false;
                    alert('Name Can\'t be Blank on Row ' + (indexVar + 1));
                }else if(allContactRows[indexVar].CloseDate == ''){
                    isValid = false;
                    alert('Date Can\'t be Blank on Row ' + (indexVar + 1));
                }else if(allContactRows[indexVar].StageName  == '' ){
                    isValid = false;
                    alert('StageName Can\'t be Blank on Row ' + (indexVar + 1));
                }
            }
            return isValid;
        }
    }
    
    
})