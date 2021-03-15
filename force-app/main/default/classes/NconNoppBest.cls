public class NconNoppBest {
    
    //fill number of contacts and number of opportunity
    public static void get_Contect_Opportunity(){
        List <Account> acclist =new List <Account>();
        acclist=[select id,numberOfOpportunity__c,numberOfContacts__c,(select id from opportunities),(select id,name from contacts) from Account limit 10000];
        for(Account ac:acclist){
            ac.numberOfOpportunity__c=ac.opportunities.size();
            ac.numberOfContacts__c=ac.contacts.size();
        }
        update acclist;
    }
}