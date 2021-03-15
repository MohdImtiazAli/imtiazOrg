public class youngAstronaut013 {

     public static void forOpportunuty(){
        List<Account> accounts = [Select ID,name from Account where name='Young2'];
        
        List<Opportunity> op1=[select id,stagename,accountid,account.name,CloseDate,Opportunity.Name from Opportunity where account.name='Young2'];
       
        
        List<OpportunityLineItem> opli=[select id,PricebookEntryId,TotalPrice,quantity,Opportunity.Name,Product2Id,Opportunity.account.name,opportunity.accountid from OpportunityLineItem where Opportunity.account.name='Young2'];
        
        system.debug('opli==> '+opli);
      
        List<Opportunity> oppToInsert = new List<Opportunity>();
        for(Account ac:accounts){
            for(Opportunity op:op1){
                if(op.AccountId==ac.id){
                    Opportunity newOpp=new Opportunity();
                    newOpp.AccountId=ac.Id;
                    newOpp.CloseDate=system.today();
                    newOpp.Type='new customer';
                    newOpp.name='Cloud anaLogy=> '+' ' +op.name;
                    newOpp.StageName='Qualification';
                    oppToInsert.add(newOpp);
                }
            }       
        }
        
        if(oppToInsert .size() > 0){
            insert oppToInsert ;
        }
        
        List<OpportunityLineItem> productsToInsert = new List<OpportunityLineItem>();
        
        for(Opportunity op:oppToInsert){
            for(OpportunityLineItem opl:opli){
                if(op.AccountId==opl.Opportunity.accountid){
                    OpportunityLineItem opll=new OpportunityLineItem();
                    opll.OpportunityId=op.id;
                    opll.PricebookEntryId=opl.PricebookEntryId;
                    opll.Product2Id=opl.Product2Id;
                    opll.TotalPrice=opl.TotalPrice;
                    opll.Quantity=opl.Quantity;
                    productsToInsert.add(opll);
                }
            }
        }
        
        
        if(productsToInsert .size() > 0){
            insert productsToInsert ;
        }

     }
}