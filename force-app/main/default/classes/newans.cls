public class newans {

     public static void tickAccount(){
        List<Account> accountList=new List<Account>();
        accountList=[select id,(select id from contacts) from account limit 10000];
        
        List<Contact> contactList=new List<Contact>();
        contactList=[select id,accountid from contact where accountid!=null];

        
        List<Opportunity> opportunityList=new List<Opportunity>();
        opportunityList=[select id,accountid from Opportunity where accountid in: accountList];
       
        List<OpportunityContactRole> ocrList=new List<OpportunityContactRole>();
        ocrList=[select id,contactid,opportunityid from OpportunityContactRole where opportunityid in: opportunityList];
         
         
         for(Account acc:accountList){
             system.debug(acc.contacts.size());
             for(OpportunityContactRole ocr:ocrList){
                 
             }
             
         }
          map<id,List<Contact>> newmapName=new map<id,List<Contact>>();
         for(Contact con:contactList){
            if(!newmapName.containsKey(con.AccountId)){
               List<Contact> contactsList=new List<Contact>();
                contactsList.add(con);
                newmapName.put(con.AccountId,contactsList);
                
            }else{
                List<Contact> contactsList=newmapName.get(con.AccountId);
                contactsList.add(con);
                newmapName.put(con.AccountId,contactsList);
            }
        }
         
         
          map<id, List<OpportunityContactRole>>mapName3=new map<id, List<OpportunityContactRole>>();
        for(OpportunityContactRole ocr:ocrList){
            if(!mapName3.containskey(ocr.OpportunityId)){
                List<OpportunityContactRole> newList=new List<OpportunityContactRole>();
                newList.add(ocr);
                mapName3.put(ocr.OpportunityId,newList);
            }else{
                 List<OpportunityContactRole> newList=mapName3.get(ocr.OpportunityId);
                newList.add(ocr);
                mapName3.put(ocr.OpportunityId,newList);
            }
        }
         
         
          map<id, List<OpportunityContactRole>> mapNames=new map<id, List<OpportunityContactRole>>();
         
         for(Opportunity opp:opportunityList){
             if(!mapNames.containsKey(opp.AccountId)){
                 mapNames.put(opp.AccountId,mapName3.get(opp.Id));
             } else{
                 
             }
         }
         
         
         
         
     }
     }