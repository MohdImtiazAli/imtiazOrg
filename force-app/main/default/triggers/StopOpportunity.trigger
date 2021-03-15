trigger StopOpportunity on Opportunity (BEFORE insert) {

    if(Trigger.isbEFORE && trigger.isInsert){
        StopOpportunityHandler.OpportunityStop(trigger.new);
    }
}