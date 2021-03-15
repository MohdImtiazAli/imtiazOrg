public class KripaTHandler {

    public static void kripa(List<Case> newCaseList ){
       
      system.debug('CaseList'+newCaseList);
        Set<Id> AccountSet=new Set<Id>();
        for(Case ca:newCaseList){
            if(ca.Status=='New'){
              AccountSet.add(ca.accountid);  
            }
            
        }	
        
        
        List<Account> accountList=new List<Account>();
        accountList=[select id,No_of_New_Cases__c,(select id from Cases where status='new') from Account where id in: AccountSet];
        for(Account ac:accountList){
            ac.No_of_New_Cases__c=ac.cases.size();
        }
        update accountList;
         
    }
    
    public static void kripaDelete(List<Case> newCaseList){
       
        system.debug('CaseList'+newCaseList);
        Set<Id> AccountSet=new Set<Id>();
        for(Case ca:newCaseList){
            if(ca.Status=='New'){
              AccountSet.add(ca.accountid);  
            }
            
        }	
        
        
        List<Account> accountList=new List<Account>();
        accountList=[select id,No_of_New_Cases__c,(select id from Cases where status='new') from Account where id in: AccountSet];
        for(Account ac:accountList){
            ac.No_of_New_Cases__c=ac.cases.size();
        }
        update accountList;
         
    }
}