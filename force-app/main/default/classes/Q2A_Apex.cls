public class Q2A_Apex {
      @AuraEnabled
    public static List<Account> forAccount(){
     List<Opportunity> opportunityList=new List<Opportunity>();
        opportunityList=[select id,accountid from Opportunity where accountid!=null limit 1000];
        
           set<Id> accountset=new set<Id>();
        for(Opportunity op:opportunityList){
            accountset.add(op.accountid);
        }
        List<Contact> ContactList=new List<Contact>();
        ContactList=[select id,accountid from Contact where accountid!=null];
        
        set<Id> accountsetID=new set<Id>();
        for(Contact con:ContactList){
            accountsetID.add(con.accountid);
        }
        List<Account> accountList=new List<Account>();
        accountList=[select id,name from Account where id in: accountset and id in: accountsetID];
        
         
        return  accountList;
    }
    @AuraEnabled
    public static List<Opportunity> forOpportunity(String ACId){
        List<Opportunity> opportunityList=new List<Opportunity>();
        opportunityList=[select id,accountid,Name from Opportunity where accountid=:ACId];
        system.debug(opportunityList);
         return opportunityList;
    }
     @AuraEnabled
    public static List<Contact> forContact(String ACId){
       List<Contact> ContactList=new List<Contact>();
        ContactList=[select id,LastName,accountid from Contact where accountid =: ACId];
        system.debug(ContactList);
         return ContactList;
    }
}
/*
 *  
*/