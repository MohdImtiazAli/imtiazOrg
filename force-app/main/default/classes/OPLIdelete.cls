public class OPLIdelete {
    
    public static void deletedata(List<OpportunityLineItem> OpportunityLineItemList){
        system.debug('OpportunityLineItemList'+OpportunityLineItemList);
        set<Id> opportunityIdSet=new set<Id>();
        for(OpportunityLineItem opli:OpportunityLineItemList){
            opportunityIdSet.add(opli.OpportunityId);
        }
         
        
        List<OpportunityLineItem> OpportunityLineItemList2=new List<OpportunityLineItem>();
        OpportunityLineItemList2=[select id,opportunityId from OpportunityLineItem where id in: opportunityIdSet];
         system.debug('OpportunityLineItemList2'+OpportunityLineItemList2);
        List<Opportunity> OpportunityList=new List<Opportunity>();
        for(OpportunityLineItem opli:OpportunityLineItemList){
            if(OpportunityLineItemList2.size()==0){
                Opportunity op=new Opportunity();
                op.Id=opli.OpportunityId;
                OpportunityList.add(op);
            }
        }
        if(OpportunityList.size()!=0){
            delete OpportunityList;
        }
        
        
    }
}