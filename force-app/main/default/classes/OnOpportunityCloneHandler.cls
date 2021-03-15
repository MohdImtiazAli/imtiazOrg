public class OnOpportunityCloneHandler {

    public static void forclone(List<Opportunity> newopportunityList){
        
        Opportunity OpportunityList=new Opportunity();
        OpportunityList=[select id,Name,Amount,Pricebook2Id,StageName,closeDate from Opportunity where id in: newopportunityList];
        
        system.debug('OpportunityList===  '+ OpportunityList);
        
        opportunityLineItem oliList=new opportunityLineItem();
        oliList=[select id,opportunityid,PricebookEntryId,Product2Id,Quantity,TotalPrice,UnitPrice from opportunityLineItem where opportunityid=: OpportunityList.id];
        system.debug('oliList===  '+ oliList);
        
        Opportunity oppoList=OpportunityList.clone(false,true,true,true);
        oppoList.Name=OpportunityList.Name+' clone';
        oppoList.Amount=OpportunityList.Amount;
        oppoList.CloseDate=OpportunityList.CloseDate.adddays(30);
        oppoList.Pricebook2Id=OpportunityList.Pricebook2Id;
        oppoList.StageName=OpportunityList.StageName;
        system.debug('cloningggggg===oppoList  '+ oppoList);
      
  
         opportunityLineItem oliListnew=new opportunityLineItem();
        oliListnew.PricebookEntryId=oliList.PricebookEntryId;
        oliListnew.Product2Id=oliList.Product2Id;
        oliListnew.Quantity=oliList.Quantity;
        oliListnew.TotalPrice=oliList.TotalPrice;
        oliListnew.UnitPrice=oliList.UnitPrice;
        oliListnew.OpportunityId=oppoList.Id;
         system.debug('oliListnew===oppoList  '+ oliListnew);
    }
}