trigger ExampleOpportunity3 on Opportunity (before insert) {
    
 ExampleOpportunity3.example(trigger.new);
   /* if(trigger.isBefore){
        if(trigger.isInsert){
            ExampleOpportunity3.example(trigger.new);
        }
    }*/
}