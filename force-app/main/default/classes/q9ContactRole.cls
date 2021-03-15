public class q9ContactRole {

     public static void q9best(List<Opportunity> newOpportunityList){
        
         Set<Id> setId=new Set<Id>();
         for(Opportunity op:newOpportunityList){
             setId.add(op.AccountId);
         }
         
         List<Opportunity> opportunityList=new List<Opportunity>();
         opportunityList=[select id,accountid from Opportunity where accountid in: setId];
         
         List<Contact> contactList=new List<Contact>();
         contactList=[select id,accountid from Contact where accountid in: setId];
         
         List<OpportunityContactRole> ocr=new List<OpportunityContactRole>();
         for(Opportunity op:opportunityList){
             for(Contact con:contactList){
                 if(op.AccountId==con.AccountId){
                 OpportunityContactRole oc=new OpportunityContactRole();
                     oc.OpportunityId=op.Id;
                     oc.ContactId=con.Id;
                     ocr.add(oc);
                 }
             }
         }
         insert ocr;
    }
    
    //or
    public static void q9contact(List<Opportunity> newOpportunityList){
        
        
        List<Account> accountList=new List<Account>();
        accountList=[select id,name from Account];
        
        List<Contact> contactList=new List<Contact>();
        contactList=[select id,accountid,lastName from Contact where accountid in: accountList];
        
        List<Opportunity> opportunityList=new List<Opportunity>();
   opportunityList=[select id,accountid,contactid from Opportunity where accountid in: accountList and id in: newOpportunityList];
    
   system.debug(opportunityList.size());
        
         List<OpportunityContactRole> OCRList=new List<OpportunityContactRole>();
        for(Opportunity op:opportunityList){
            for(Contact con:contactList){
                if(op.AccountId==con.AccountId){
                    OpportunityContactRole ocr=new OpportunityContactRole();
                    ocr.OpportunityId=op.Id;
                    ocr.ContactId=con.Id; 
                    OCRList.add(ocr);
                }
            }
        }
     insert OCRList;
    }
    
    //orororororororoorororoororororoorororo
  
    
    
    
}