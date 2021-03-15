trigger q8Opportunity on Opportunity (after update) {
    
    if(trigger.isafter && trigger.isUpdate){
       // q8OpportunityHandler.onOpportunity(trigger.new);
         q8OpportunityHandler.onOpportunity1(trigger.new);
    }
  
}