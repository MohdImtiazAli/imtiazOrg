/*trigger Gaurav2 on OpportunityLineItem (After insert) {

    if(trigger.isAfter && trigger.isInsert){
        Gaurav2.gaurav(trigger.new);
    }
}
*/
trigger Gaurav2 on OpportunityLineItem (Before delete) {

    if(trigger.isBefore && trigger.isDelete){
        Gaurav2.gauravdelete(trigger.old);
    }
}