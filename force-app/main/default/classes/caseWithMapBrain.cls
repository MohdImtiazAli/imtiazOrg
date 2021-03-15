public class caseWithMapBrain {

    //tick custem field same if case of contact id == case of contact of account id
    public static void casebrain(){
       Map<Id,Id>mapName=new Map<Id,id>();
        List<Account> AccountList=new List<Account>();   
        AccountList=[select id from  Account];
        
        List<Contact> ContactList=new List<Contact>();   
        ContactList=[select id,accountid from  Contact];
        
         for(Contact c:ContactList){
            if(!mapName.containsKey(c.id)){
                mapName.put(c.id,c.accountid);
            } 
        }
        
        List<Case>CaseList=new List<Case>();
       CaseList=[select id,same__c,contactid,accountid from Case where origin='Email' and status='working' and contactid in: ContactList];
        
        for(Case cas:CaseList){
            if(cas.AccountId==MapName.get(cas.ContactId)){
                cas.same__c=true;
            }
        }
        update CaseList;
}   
}