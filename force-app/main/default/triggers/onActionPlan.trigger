trigger onActionPlan on ActionPlan__c (After insert) {
 
    if(trigger.isAfter && trigger.isInsert){
        onActionPlanController.moveTaskToActionPlan(trigger.new);
    }
}