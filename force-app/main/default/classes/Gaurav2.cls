public class Gaurav2 {
    public static void gaurav(List<OpportunityLineItem> newOPLIlist){
        system.debug('newopli'+newOPLIlist.size());
        set<Id> opportunitySet=new set<Id>();
        for(OpportunityLineItem opl:newOPLIlist){
            opportunitySet.add(opl.opportunityid);
        }
        
        List<opportunityLineItem> forOpliList=new List<opportunityLineItem>();
        forOpliList=[select id,opportunityid from opportunityLineItem where opportunityid in: opportunitySet];
        integer i=0;
        for(opportunityLineItem opl:forOpliList){
            i++;
        }
        system.debug(i);
        
        List<Opportunity> opportunityList=new List<Opportunity>();
        opportunityList=[select id,accountid from Opportunity where id in: opportunitySet];
        system.debug('opportunityList'+opportunityList.size());
        
        set<Id> Accountset=new set<Id>();
        for(Opportunity op:opportunityList){
            Accountset.add(op.accountid);
        }
        
        List<Account> accountList=new List<Account>();
        accountList=[select id from Account where id in: Accountset];
        system.debug('accountList------>'+accountList.size());
        
        double totalcount=0;
        for(Account ac:accountList){
            integer count=0;
            for(OpportunityLineItem opl:newOPLIlist){
                if(ac.id==opl.opportunity.accountid){
                    count++; 
                }
                
            }
            ac.numberOfOpportunityLineItem__c=i+count;
            
        }
        update accountList;
        
        
        
        
        
        
    }
    
    public static void gauravdelete(List<OpportunityLineItem> oldOPLIlist){
        system.debug('oldOPLIlist.size()'+oldOPLIlist.size());
        set<Id> opportunitySet=new set<Id>();
        for(OpportunityLineItem opl:oldOPLIlist){
            opportunitySet.add(opl.opportunityid);
        }
        
        List<Opportunity> opportunityList=new List<Opportunity>();
        opportunityList=[select id,accountid from Opportunity where id in: opportunitySet];
        system.debug('opportunityList'+opportunityList.size());
        
        set<Id> Accountset=new set<Id>();
        for(Opportunity op:opportunityList){
            Accountset.add(op.accountid);
        }
        
        List<Account> accountList=new List<Account>();
        accountList=[select id from Account where id in: Accountset];
        system.debug('accountList------>'+accountList.size());
        
        List<Opportunity> opportunityList2=new List<Opportunity>();
        opportunityList2=[select id,accountid from Opportunity where accountid in: accountList];
         system.debug('opportunityList2------>'+opportunityList2.size());
        
        
        
        List<opportunityLineItem> forOpliList=new List<opportunityLineItem>();
        forOpliList=[select id,opportunityid from opportunityLineItem where opportunityid in: opportunityList2];
         system.debug('forOpliList------>'+forOpliList.size());
        
        map<Id,List<OpportunityLineItem>> MapCountOpl=new map<Id,List<OpportunityLineItem>>();
        for(OpportunityLineItem opl:forOpliList){
            if(!MapCountOpl.containsKey(opl.Opportunity.accountid)){
                List<OpportunityLineItem> countList=new List<OpportunityLineItem>();
                countList.add(opl);
                MapCountOpl.put(opl.Opportunity.accountid,countList);
            }else{
                List<OpportunityLineItem> countList=MapCountOpl.get(opl.Opportunity.accountid); 
                countList.add(opl);
                MapCountOpl.put(opl.Opportunity.accountid,countList);
            }
        }
        for(Account ac:accountList){
            ac.numberOfOpportunityLineItem__c=MapCountOpl.get(ac.id).size();
        }
        
    }
}
/*

List<opportunityLineItem> forOpliList=new List<opportunityLineItem>();
forOpliList=[select id,opportunityid,Opportunity.accountid from opportunityLineItem where Opportunity.accountid!=null];




*/