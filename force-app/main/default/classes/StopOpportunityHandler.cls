public class StopOpportunityHandler {

    public static void OpportunityStop(List<Opportunity> newOportunityList){
        /*  List<Opportunity> OpportunityList=new List<Opportunity>();
        OpportunityList=[select id,accountid from Opportunity where id in: newOportunityList];*/
        
       // system.debug('OpportunityList== '+OpportunityList);
        
        set<Id> setidA=new Set<Id>();
        for(Opportunity op:newOportunityList){
            setidA.add(op.accountid);
        }
        
        List<Account> accountList=new List<Account>();
        accountList=[select id,name from Account where Working_In__c='Asia' and id in: setidA];
        system.debug('accountList== '+accountList);
        
        List<Opportunity> OpportunityListOLD=new List<Opportunity>();
        OpportunityListOLD=[select id,name,accountid from Opportunity where accountid in: accountList and StageName='closed won'];
        system.debug('OpportunityListOLD== '+OpportunityListOLD);
        map<Id,integer> oldMap=new map<Id,Integer>();
        
        for(Opportunity opC:OpportunityListOLD){
            if(!oldMap.containsKey(opC.AccountId)){
                oldMap.put(opC.AccountId,1);
            }else{
                integer i=oldMap.get(opC.AccountId);
                i++;
                oldMap.put(opC.AccountId,i);
            }
        }
        
        for(Id id1:oldMap.keySet()){
            for(Opportunity ops:newOportunityList){
                if(id1==ops.AccountId){
                   
                    if(oldMap.get(id1)>1){
                        ops.addError('you have 2 closed won');
                    }
                }
            }
        }
        
    }
}