trigger q7Opportunity on Opportunity (after update,before update) {
    if(trigger.isbefore && trigger.isUpdate){
        q7Opportunity.Opportunityclosed(trigger.old,trigger.new);
    }
    
}