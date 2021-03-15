public class homeworks {
//question create custom field nomber of contact,number of opportuntites,number of opportunity line item in account
// and then put thier filed
    public static void home(){
        List<Account> Aopporlist=new List<Account>();
                      Aopporlist=[select id,(select id from opportunities),(select id from contacts) from account limit 49999];
        
        for(Account a:Aopporlist){
            a.numberOfOpportunity__c=a.opportunities.size();
            a.numberOfContacts__c=a.contacts.size();
            system.debug('Numbere of opportunity'+ a.numberOfOpportunity__c);
        }
        update Aopporlist;
        /*
        List<Account> Aconlist=new List<Account>();
                       Aconlist=[select id,(select id from Contacts) from Account limit 49999];
        
        for(Account a:Aconlist){
            a.numberOfContacts__c=a.Contacts.size();
        }
        update Aconlist;
        
        */
    }
}