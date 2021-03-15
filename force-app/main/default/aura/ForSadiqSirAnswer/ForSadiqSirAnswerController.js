({
	doInit : function(component, event, helper) {
	helper.SetPickList(component, event, helper);	
	},
    addRow:function(component,event,helper){
       helper.AddRows(component,event,helper); 
    },
    removeRow:function(component,event,helper){
       helper.removeRow(component,event,helper); 
    },
    Cancel:function(component,event,helper){
       helper.Cancel(component,event,helper); 
    },
    Save:function(component,event,helper){
       helper.Save(component,event,helper); 
    },
})