public class YoungAstronaut13final {
    /*
    public static void forOpportunity(){
        Set<Id> listAccIds= new Set<Id>();
        Set<Id> listOpIds = new Set<Id>();
        for(Opportunity o : Trigger.New){
        //    if(o.Lost_reason__c == 'Timing'){
                listAccIds.add(o.AccountId);
                listOpIds.add(o.id);
                System.debug('listAccIds' +listAccIds);
            }
        }
        System.debug('listOpIds '+listOpIds );
        List<Account> accounts = [Select ID from Account where ID = : listAccIds];
        
        List<Opportunity> op1=[select id,stagename,accountid,account.name,CloseDate,Opportunity.Name from Opportunity where accountid in:listAccIds ];
        
        
        List<OpportunityLineItem> opli=[select id,PricebookEntryId,TotalPrice,quantity,Opportunity.Name,Product2Id,Opportunity.account.name,opportunity.accountid from OpportunityLineItem where Opportunity.accountid in:listAccIds];
        
        
        
        
        
        List<Opportunity> oppToInsert = new List<Opportunity>();
        List<OpportunityLineItem> productsToInsert = new List<OpportunityLineItem>();
        Date closeDateForOldOpp;
        System.debug('Accounts' + accounts);
       
        for(Opportunity o :op1){
         //   if(o.Lost_reason__c == 'Timing'){
                closeDateForOldOpp = o.CloseDate;
                System.debug('closeDateForOldOpp' +closeDateForOldOpp );
                Date closeIn30Days = closeDateForOldOpp.addDays(182);
                for(Account ac : accounts){
                    
                    if(o.AccountId==ac.id){
                        Opportunity op = new Opportunity();
                        op.Name ='Follow-Up Opportunity related to: '+ o.Name;
                        op.AccountId = ac.Id;
                        op.StageName = 'Prospecting';
                        op.CloseDate = closeIn30Days;
                        oppToInsert.add(op);
                    }
                    
                }
            }
        }
        
        if(oppToInsert .size() > 0){
            insert oppToInsert ;
        }
        
        
        
        
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
    */
    
}