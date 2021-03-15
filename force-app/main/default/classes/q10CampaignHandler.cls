public class q10CampaignHandler {

    public static void campaignHandler(List<Campaign> newcampaignList){
        List<Campaign> campaignList=new List<Campaign>();
        campaignList=[select id,Status from campaign where status='completed' and id in: newcampaignList];
        system.debug('new'+campaignList);
        
        List<Opportunity> opportunityList=new List<Opportunity>();
        opportunityList=[select id,campaignid from Opportunity where campaignid in: campaignList];
            system.debug('opportuniyt     '+opportunityList);
        
        List<OpportunityLineItem> oli=new List<OpportunityLineItem>();
        oli=[select id,opportunityid from OpportunityLineItem where opportunityid in: opportunityList];
         system.debug('oliiii    '+oli);
        
        for(Opportunity op:opportunityList){
            for(OpportunityLineItem opl:oli){
                if(op.id==opl.OpportunityId){
                op.StageName='closed won';
                }else if(op.Id!=opl.OpportunityId){
                    op.StageName='closed lost';
                }
            }
        }
        update opportunityList;
           }
}