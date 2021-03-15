public class youngAstronayt13 {
    //https://developer.salesforce.com/forums#!/feedtype=SINGLE_QUESTION_DETAIL&dc=Developer_Forums&criteria=ALLQUESTIONS&id=9062I000000IX6VQAW
    public static void forOpportunuty(){
        List<Account> accounts = [Select ID,name from Account where name='Young2'];
        
        List<Opportunity> op1=[select id,stagename,accountid,account.name,CloseDate,Opportunity.Name from Opportunity where account.name='Young2' limit 1];
       
        
        List<OpportunityLineItem> opli=[select id,PricebookEntryId,TotalPrice,quantity,Opportunity.Name,Product2Id,Opportunity.account.name,opportunity.accountid from OpportunityLineItem where Product2Id='01t2y0000010iWUAAY' and Opportunity.account.name='Young2'];
        
        
      
        List<Opportunity> oppToInsert = new List<Opportunity>();
        for(Account ac:accounts){
            for(Opportunity op:op1){
                if(op.AccountId==ac.id){
                    Opportunity newOpp=new Opportunity();
                    newOpp.AccountId=ac.Id;
                    newOpp.CloseDate=system.today();
                    newOpp.Type='new customer';
                    newOpp.name='Mouse'+' ' +op.name;
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
        
        /*

 map<Id,List<Opportunity>> OpoortunityMap=new map<Id,List<Opportunity>>();
        for(Opportunity op:op1){
            if(!OpoortunityMap.containsKey(op.AccountId)){
                List<Opportunity> opList=new List<Opportunity>();
                opList.add(op);
                OpoortunityMap.put(op.AccountId,opList);
            }else{
                List<Opportunity> opList=OpoortunityMap.get(op.AccountId);
                opList.add(op);
                OpoortunityMap.put(op.AccountId,opList);
            }
        }
        
        


  map<Id,List<OpportunityLineItem>> OpportunityLineItemMap=new map<Id,List<OpportunityLineItem>>();
        for(OpportunityLineItem opl:opli){
            if(!OpportunityLineItemMap.containsKey(opl.opportunity.accountid)){
                List<OpportunityLineItem> opLiist=new List<OpportunityLineItem>();
                opLiist.add(opl);
                OpportunityLineItemMap.put(opl.opportunity.accountid,opLiist);
            }else{
                
                List<OpportunityLineItem> opLiist=OpportunityLineItemMap.get(opl.opportunity.accountid);
                opLiist.add(opl);
                OpportunityLineItemMap.put(opl.opportunity.accountid,opLiist);
                
            }
        }

List<PriceBookEntry> priceBookList  = [SELECT Id, Product2Id, Product2.Id, Product2.Name FROM PriceBookEntry WHERE Product2Id=: listOpIds AND PriceBook2.isStandard=true LIMIT 1];
System.debug('priceBookList  '+priceBookList  );

List<Opportunity> oppToInsert = new List<Opportunity>();
List<OpportunityLineItem> productsToInsert = new List<OpportunityLineItem>();
Date closeDateForOldOpp;

for(Opportunity o :op1){

closeDateForOldOpp = o.CloseDate;
System.debug('closeDateForOldOpp' +closeDateForOldOpp );
Date closeIn30Days = closeDateForOldOpp.addDays(182);
for(Account ac : accounts){
if(o.AccountId==ac.id){


}

}




List<OpportunityLineItem> opliList=new List<OpportunityLineItem>();
opliList=[select id,TotalPrice,Opportunity.Name,Product2Id,Opportunity.account.name,Opportunity.accountid from OpportunityLineItem where Product2Id='01t2y0000010iWUAAY' and Opportunity.account.name='Young2'];
for(Account ac:accounts){
for(OpportunityLineItem opl:opliList){
if(ac.id==opl.Opportunity.accountid){
Opportunity op = new Opportunity();
op.Name ='Follow-Up Opportunity related to: '+ o.Name;
op.AccountId = ac.Id;
op.StageName = 'Prospecting';
op.Type='New Customer';
op.CloseDate = closeIn30Days;
oppToInsert.add(op);

OpportunityLineItem opll=new OpportunityLineItem();
opll.id=opl.id;
productsToInsert.add(opll);
}
}
}

}


if(oppToInsert .size() > 0){
insert oppToInsert ;
}
if(productsToInsert .size() > 0){
insert productsToInsert ;
}

*/
    }
    
}