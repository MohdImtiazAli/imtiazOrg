trigger caseMapTrigger on Case (before insert) {

    if(trigger.isBefore){
        if(trigger.isInsert){
            System.debug('On triggerr');
            caseMapTrigger.casebrain(trigger.new);
        }
    }
    
}