public class Q3A_Apex {
	@AuraEnabled
    public static List<Opportunity> forOpportunity(){
        
        Date dt=date.today();
        List<Opportunity> opportunityList=new List<Opportunity>();
        
        opportunityList=[select id,Name,closeDate from Opportunity where closeDate<:dt];
        
        return opportunityList;
    }
    @AuraEnabled
    public static Opportunity OpportunityClose(String opid){
        system.debug(opid);
        Date dt=date.today();
        List<Opportunity> opportunityList=new List<Opportunity>();
        
        opportunityList=[select id,closeDate,Name from Opportunity where id=:opid];
        system.debug(opid);
        return opportunityList[0];
    }
    @AuraEnabled
    public static Opportunity OpportunityClose(Date d){
        system.debug(d);
        List<Opportunity> opportunityList=new List<Opportunity>();
        
        opportunityList=[select id,closeDate,Name from Opportunity];
        system.debug(opportunityList);
        return opportunityList[0];
    }
    
     @AuraEnabled
    public static Opportunity updateOpportunity(sObject op){
        //Opportunity opp=(Opportunity)Json.deserialize(op, Opportunity.Class);
        
        Opportunity opp=(Opportunity)op;
        update opp;
        return opp;
    }
}