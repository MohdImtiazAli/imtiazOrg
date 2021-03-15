/*trigger FORCONTACT on Contact (after update) {

    if(trigger.isAfter && trigger.isUpdate){
        FORCONTACThandler.forContacs(trigger.old);
    }
}
*/
trigger FORCONTACT on Contact (after insert) {

    if(trigger.isAfter && trigger.isInsert){
        FORCONTACThandler.handle(trigger.new);
    }
    
}