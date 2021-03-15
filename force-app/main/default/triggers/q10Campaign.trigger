trigger q10Campaign on Campaign (after update) {

    if(trigger.isAfter && trigger.isUpdate){
        q10CampaignHandler.campaignHandler(trigger.new);
    }
    
}