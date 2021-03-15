public class nContactsNopportunity {

    public static void home(){
        Map<Id,Integer> MapName=new Map<Id,Integer>();
        
        List<Contact> ContactList=[select accountid from Contact where accountid!=null limit 49999];
        
        for(Contact con:ContactList){
            if(!MapName.containsKey(con.AccountId)){
                MapName.put(con.AccountId,1);
            }else{
               Integer count= MapName.get(con.AccountId);
                count++;
                MapName.put(con.AccountId,count);
            }
        }
        
       /* for ( Account a : myAccounts ){
    myAMap.put(a.ID, a.Name);
        }*/
        List<Account> acc=[select id,numberOfContacts__c from account];
       for(Id id1:MapName.keySet()){
           for(Account c:acc){
               if(id1==c.Id){
                   c.numberOfContacts__c=MapName.get(id1);
               }
           } 
        }
      update acc;
        
        //for opportunity
         Map<Id,Integer> MapName1=new Map<Id,Integer>();
        
        List<Opportunity> OpportunityList=[select accountid from Opportunity where accountid!=null limit 49999];
        
        for(Opportunity op:OpportunityList){
            if(!MapName1.containsKey(op.AccountId)){
                MapName1.put(op.AccountId,1);
            }else{
               Integer count= MapName1.get(op.AccountId);
                count++;
                MapName1.put(op.AccountId,count);
            }
        } 
        
         List<Account> ac=[select id from account];
       for(Id id1:MapName1.keySet()){
           for(Account c:ac){
               if(id1==c.Id){
                   c.numberOfOpportunity__c=MapName1.get(id1);
               }
           }
           update ac;
        }
        
         
    }
}