/*trigger AccountContact on Account (after Update) {

    if(trigger.isAfter){
        
        if(trigger.isUpdate){
            AccountContacts.acontacts(trigger.new);
        }
    }
    
}
*/
trigger AccountContact on Account (before Insert) {

    if(trigger.isBefore){
        
        if(trigger.isInsert){
            AccountContacts.check(trigger.new,trigger.old);
        }
    }
    
}