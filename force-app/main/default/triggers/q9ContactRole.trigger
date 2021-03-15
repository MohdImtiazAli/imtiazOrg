trigger q9ContactRole on Opportunity (after update) {

    if(trigger.isAfter && trigger.isUpdate){
       // q9ContactRole.q9contact(trigger.new);
        q9ContactRole.q9best(trigger.new);
    }
}