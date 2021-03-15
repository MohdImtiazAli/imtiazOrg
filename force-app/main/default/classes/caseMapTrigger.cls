public class caseMapTrigger {

     public static void casebrain(List<Case> CaseList1){
        /* system.debug('On helper of trigger');
        /* list<case> CaseList= new list<case>();
         for(case ca:CaseList1){
             if(ca.origin=='Email' && ca.status=='working'){
                 CaseList.add(ca);
             }
         }
     for(case cs:CaseList1) {
           system.debug('AccounId==>>    '+cs.AccountId+'    ContactId=>>    '+cs.ContactId);
         }
*/
         set<id> sid= new set<id>();
         for(case c: caseList1){
             sid.add(c.contactid);
         }
       Map<Id,Id> mapName=new Map<Id,id>();
        
        List<Contact> ContactList=new List<Contact>();   
        ContactList=[select id,accountid from  Contact where id in: sid];
        
         
         for(Contact c:ContactList){
                mapName.put(c.id,c.accountid);
            } 
       
        for(Case cas:CaseList1){
            if(cas.AccountId==MapName.get(cas.ContactId)  && (cas.origin=='Email' && cas.status=='working')  ){
              cas.same1__c=true;
           //system.debug('hello');
            }
        }
        
}   
    
    
}