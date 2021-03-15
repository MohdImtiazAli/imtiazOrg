public class brainstormnew {

    public static void tickAccount(){
        List<Account> accountList=new List<Account>();
        accountList=[select id from account limit 10000];
        
        List<Contact> contactList=new List<Contact>();
        contactList=[select id,accountid from contact where accountid!=null];
        
        Map<Id,List<Contact>> mapName=new map<id,List<Contact>>();
        Map<Id,integer> mapName2=new Map<id,integer>();
        for(Contact con:contactList){
            if(!mapName.containsKey(con.accountid)){
                mapName2.put(con.accountid,1);
                List<contact> conlist=new List<contact>();
                conlist.add(con);
                mapName.put(con.accountid,conlist);
            }else{
                integer i=mapName2.get(con.accountid);
                i++;
                mapName2.put(con.accountid,i);
                List<contact> conlist=mapName.get(con.accountid);
                conlist.add(con);
                mapName.put(con.accountid,conlist);
            }
        }
        for(id id1:mapName.keySet()){
            system.debug(mapName2.get(id1)+'==='+mapName.get(id1));
        }
        
          
        
        List<Opportunity> opportunityList=new List<Opportunity>();
        opportunityList=[select id,accountid from Opportunity where accountid in: accountList];
       
        List<OpportunityContactRole> ocrList=new List<OpportunityContactRole>();
        ocrList=[select id,contactid,opportunityid from OpportunityContactRole where opportunityid in: opportunityList];
        
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
      
         for(id id1:mapName.keySet()){
             for(id id2:mapName3.keySet()){
         /*    if(mapName.get(id1)==mapName3.get(id2)){
                 
             }*/
             }
        }
    }
}