trigger YADeleteOPLI on OpportunityLineItem (before Delete) {

    if(trigger.isBefore && trigger.isDelete){
        OPLIdelete.deletedata(trigger.old);
    }
}