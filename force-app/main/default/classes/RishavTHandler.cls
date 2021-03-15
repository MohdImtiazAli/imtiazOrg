public class RishavTHandler {
    
    public static void Rishav(List<Opportunity> newOppList){
        system.debug('newOppList'+newOppList);
        List<Opportunity> oppList=new List<Opportunity>();
        oppList=[select id,(select id from OpportunityLineItems),(select id from OpportunityContactRoles) from Opportunity where id in:newOppList and (stageName='qualification' or stageName='Prospecting')];
        system.debug('oppList'+oppList);
        
        map<Id,Opportunity> OPPMap=new map<Id,Opportunity>();
        for(Opportunity op:newOppList){
            OPPMap.put(op.id,op);
        }
        
       for(Opportunity op:oppList){
            system.debug('inside1'+op.OpportunityLineItems.size());
            system.debug('inside2'+op.OpportunityContactRoles.size());
            
            if(OPPMap.containsKey(op.id) && op.OpportunityLineItems.size()==2 && op.OpportunityContactRoles.size()>2){
                 OPPMap.get(op.id).addError('not allowed');
                system.debug('insideF');
            }
        } 
        
    }
    
    
    public static void rishavT2(List<Opportunity> NewOpportunityList){
        system.debug('NewOpportunityList');
        set<Id> accountset=new set<Id>();
        for(Opportunity op:NewOpportunityList){
            if(op.StageName=='closed won'){
                accountset.add(op.AccountId);
            }
        }
           system.debug('accountset'+accountset);
        map<Id,Opportunity> OpprtunityMap=new map<Id,Opportunity>();
        for(Opportunity op:NewOpportunityList){
             if(op.StageName=='closed won'){
               OpprtunityMap.put(op.accountid,op);
            }
            
        }
        List<Account> AccountList=new List<Account>();
        AccountList=[select id,Working__c,(select id from Opportunities where StageName='closed won') from Account where Working__c='Asia' and id in: accountset];
                   system.debug('AccountList'+AccountList);

        for(Account ac:AccountList){
            if(ac.Opportunities.size()>2){
                  system.debug('ac.Opportunities.size()'+ac.Opportunities.size());
                if(OpprtunityMap.containsKey(ac.id)){
                    system.debug('inside');
                    OpprtunityMap.get(ac.id).addError('Stop for Creating More Opportunity');
                }
            }
        }
        
    }
    
}
/*
*  for(Opportunity op:newOppList){
for(Account ac:accountList){
if(ac.contacts.size()>2 && ){

}
}
} 
* 
*  set<Id> accountSet=new set<Id>();
for(Opportunity op:oppList){
accountSet.add(op.accountid);
}
List<Account> accountList=new List<Account>();
accountList=[select id,name,(select id from Contacts) from account where id in: accountSet];


for(Opportunity op:newOppList){
for(Account ac:accountList){
if(ac.contacts.size()>2 && op.OpportunityLineItems.size()>2 ){
op.addError('Not allowed');
}
}
} 
*/