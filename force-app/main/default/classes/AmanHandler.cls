public class AmanHandler {

    public static void handlePolicy(List<Policy__c> newPolicyList){
                system.debug('newPolicyList='+newPolicyList);

        set<Id> newSetOpportunityName=new set<Id>();
        for(Policy__c pl:newPolicyList){
            newSetOpportunityName.add(pl.Opportunity_Name__c);
        }
      
        List<Opportunity> OpportunityList=new List<Opportunity>();
        OpportunityList=[select id,Policy_Number__c from Opportunity where id in: newSetOpportunityName];
         
        for(Policy__c pl:newPolicyList){
            for(Opportunity op:OpportunityList){
                if(pl.Opportunity_Name__c==op.id && pl.Policy_Number__c==op.Policy_Number__c){
                    
                        op.StageName='closed won';
                   
                    
                }
                else if(pl.Parent_Policy__c!=null){
                    system.debug('inside');
                        pl.Renew_Policy__c=true;
                        pl.Opportunity_Name__c=op.id;
                    }
                    
               
            }
        }
   
        update OpportunityList;
        
    }
}
/*
 * 
 * List<Policy__c> policyList=new List<Policy__c>();
        policyList=[select id,Opportunity_Name__c,Parent_Policy__c,Policy_Number__c,Renew_Policy__c from Policy__c where 	Opportunity_Name__c!=null and id in:newPolicyList];
        
        system.debug('policyList='+policyList);
        
 * 
 * 
 */