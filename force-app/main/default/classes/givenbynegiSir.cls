public class givenbynegiSir {
    
    public static void questions(){
        List<OpportunityContactRole> ocrList=new List<OpportunityContactRole>();
        ocrList=[select id,contactid,opportunityid from OpportunityContactRole];
        
        Set<Id> SetId1=new Set<Id>();
        Set<Id> SetId2=new Set<Id>();
/*        for(OpportunityContactRole ocr:ocrList){
            SetId1.add(ocr.ContactId);
            SetId2.add(ocr.OpportunityId);
        } */
        
        
        
        map<id,list<id> > MapName=new map<id,list<id>>();
        for(OpportunityContactRole op:ocrList){
            SetId1.add(op.ContactId);
            SetId2.add(op.OpportunityId);
            if(!mapName.containsKey(op.OpportunityId)){
                List<id> listid=new List<id>();
                listid.add(op.ContactId);
                mapName.put(op.OpportunityId,listid);
            }else{
                List<id> listid=mapName.get(op.OpportunityId);
                listid.add(op.ContactId);
                mapName.put(op.OpportunityId,listid);
            }
        }
        
        
        List<Opportunity> opportunityList=new List<Opportunity>();
        opportunityList=[select id,accountid from Opportunity where id in: SetId2];
        
        List<Contact> contactList=new List<Contact>();
        contactList=[select id,accountid from contact where accountid!=null and id in: SetId1];
        
        map<id,list<id>> MapName1=new map<id,list<id>>();
        for(Contact con:contactList){
            if(!MapName1.containsKey(con.AccountId)){
                List<id> lid=new List<id>();
                lid.add(con.id);
                MapName1.put(con.AccountId,lid);
            }else{
                List<id> lid=MapName1.get(con.AccountId); 
                lid.add(con.id);
                MapName1.put(con.AccountId,lid);
            }
        }
        
        map<id,List<id>> mapName2=new map<id,List<id>>();
        for(Opportunity opp:opportunityList){
            if(!mapName2.containsKey(opp.accountid)){
                mapName2.put(opp.accountid,MapName.get(opp.id));
            }else{
                List<id> listold=MapName.get(opp.id);
                List<id> listnew=mapName2.get(opp.accountid);
                for(id i1 : listold){
                    listnew.add(i1);
                }
                //listnew.addall(listold);
                 mapName2.put(opp.accountid,listnew);
            }
        }
        
        
        Set<Id> SetId3=new Set<Id>();
        for(Opportunity oppr:opportunityList){
            SetId3.add(oppr.accountid);
        }
          List<Account> AccountList=new List<Account>();
        AccountList=[select id,tick__c from Account where  id in: SetId3];
        
      
        for(Account ac:AccountList){
            boolean a=true;
            if(MapName1.get(ac.id).size()==mapName2.get(ac.id).size()){
                for(Id id1: mapName2.get(ac.id)){
                   if(!MapName1.get(ac.id).contains(id1)){
                        a=false;
                    }
                }
                if(a==true){
                    ac.tick__c=true;
                }
            }
           
            }
        update accountList;

    }
}