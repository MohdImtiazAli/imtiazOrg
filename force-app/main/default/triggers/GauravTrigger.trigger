trigger GauravTrigger on Time__c (After insert) {

    if(trigger.isAfter && trigger.isInsert){
        GauravTriggerHandler.handle(trigger.new);
    }
}