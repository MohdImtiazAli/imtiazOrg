/*trigger Account_Contact on Account (after insert) {
 
    if(trigger.isAfter){
        if(trigger.isInsert){
           // Account_ContactHandler.addcon(trigger.new);
            Account_ContactHandler.AccountHandlerUpdate(trigger.new);
        }
    }
}*/

trigger Account_Contact on Account (after update) {
 
    if(trigger.isAfter){
        if(trigger.isUpdate){
           // Account_ContactHandler.addcon(trigger.new);
            Account_ContactHandler.AccountHandlerUpdate(trigger.new);
        }
    }
}