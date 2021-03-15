trigger Aman on Policy__c (before update) {

    If(Trigger.isBefore && trigger.isUpdate){
        AmanHandler.handlePolicy(trigger.new);
    }
}