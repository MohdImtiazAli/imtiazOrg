trigger ImtiazT2 on Agreement__c (After insert) {

    if(Trigger.isAfter && trigger.isInsert){
        ImtiazT2Handler.imtiazT(trigger.new);
    }
}