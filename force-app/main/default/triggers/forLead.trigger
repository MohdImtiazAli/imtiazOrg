trigger forLead on Lead (After insert) {

    if(trigger.isAfter && trigger.isInsert){
        forLead.stopOwner(trigger.new);
    }
}