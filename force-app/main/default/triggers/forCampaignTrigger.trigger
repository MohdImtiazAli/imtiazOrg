trigger forCampaignTrigger on CampaignMember (after insert) {

    if(trigger.isafter && trigger.isInsert){
         forCampaignTriggerHandler.sendemail(trigger.new);
    }
}