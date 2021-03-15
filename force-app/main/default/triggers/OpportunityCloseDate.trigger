trigger OpportunityCloseDate on Opportunity (before insert) {

    if(trigger.isBefore){
        if(trigger.isInsert){
            OpportunityCloseDateHandler.OpportunityClose(trigger.new);
        }
    }
    
}