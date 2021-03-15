trigger OnOpportunityClone on Opportunity (after update) {

    if(trigger.isAfter && trigger.IsUpdate){
        OnOpportunityCloneHandler.forclone(trigger.old);
    }
}