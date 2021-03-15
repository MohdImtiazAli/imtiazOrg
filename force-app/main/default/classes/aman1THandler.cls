public class aman1THandler {
    
    public static void aman(List<Contact> newContactList){
        Set<Id> AccountSet=new Set<Id>();
        for(Contact con:newContactList){
            AccountSet.add(con.accountid);
        }
                List<Account> AccountList=new List<Account>();
        AccountList=[select id,Count_of_Contacts__c,(select id from Contacts) from Account where id in:AccountSet];

        List<Contact> deleteContact=new List<Contact>();
        for(Account ac:AccountList){
             ac.Count_of_Contacts__c=ac.contacts.size();
           
        }       
        if(AccountList.size()>0){
             update AccountList;
        }
        
        
    }
    
    public static void amanDelete(List<Contact> newContactList){
        Set<Id> AccountSet=new Set<Id>();
        for(Contact con:newContactList){
            AccountSet.add(con.accountid);
        }
                List<Account> AccountList=new List<Account>();
        AccountList=[select id,Count_of_Contacts__c,(select id from Contacts) from Account where id in:AccountSet];

        List<Contact> deleteContact=new List<Contact>();
        for(Account ac:AccountList){
            for(Contact con:newContactList){
                if(con.AccountId==ac.id){
                    ac.Count_of_Contacts__c=ac.contacts.size();
                } 
            }
        }       
        if(AccountList.size()>0){
             update AccountList;
        }
        
        
    }

}
/*
 *  for(Contact con:newContactList){
                if(con.AccountId==ac.id){
                   
                } 
            }
 * List<Contact> conList=new List<Contact>();
        conList=[select id,accountid from Contact where accountid in:AccountSet];
        
        map<Id,List<Contact>> ContactCountMap=new map<Id,List<Contact>>();
        for(Contact con:conList){
            if(!ContactCountMap.containsKey(con.AccountId)){
                List<Contact> conList1=new List<Contact>();
                conList1.add(con);
                ContactCountMap.put(con.AccountId,conList1);
                
            }else{
                 List<Contact> conList1=ContactCountMap.get(con.AccountId);
                conList1.add(con);
                ContactCountMap.put(con.AccountId,conList1);
            }
        }
 * 
 * 
 */