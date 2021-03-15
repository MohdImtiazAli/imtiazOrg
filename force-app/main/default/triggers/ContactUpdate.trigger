trigger ContactUpdate on Contact (after insert,before update,before delete,After delete) {
    if(trigger.isAfter){
        if(trigger.isInsert){
            ContactUpdateHandler.contacts(trigger.new);
        }
    }
    if(trigger.isBefore){
        if(trigger.isUpdate){
            ContactUpdateHandler.forupdateabove(trigger.new,trigger.old);
        }
    }
    if(trigger.isAfter){
    if(trigger.isdelete){
        ContactUpdateHandler.forDelete(trigger.old);
    }
    }
}