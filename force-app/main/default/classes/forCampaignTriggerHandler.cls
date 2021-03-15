public class forCampaignTriggerHandler {
   //https://trailblazers.salesforce.com/answers?feedtype=RECENT&criteria=BESTANSWERS#!/feedtype=SINGLE_QUESTION_DETAIL&dc=All&criteria=OPENQUESTIONS&id=9064S000000DUizQAG 
    public static void sendemail(List<CampaignMember> campaignMemberList){
        system.debug('campaignMemberList-->'+campaignMemberList);
        for(CampaignMember cm:campaignMemberList){
            if(cm.Email!=null){
                system.debug('inside');
                String address=cm.Email;
                String Subject='You are now CampaignMember';
                String Body='Your are successfully registered';
                
                EmailManagers.sendMessage(Address,Subject,Body);
            }else if(cm.Email==null){
                cm.Email.adderror('email is required');
            }
        }
        
        
    }
}