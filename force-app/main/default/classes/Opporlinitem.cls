public class Opporlinitem {
    
    public static void oppor(){
        list<Account> ac=[select id,numberOfOpportunityLineItem__c from account];
        List<Opportunity>Oppor=new List<Opportunity>();
        Oppor=[select id,accountid,(select id from OpportunityLineitems) from Opportunity where accountid!=null];
        
         
       
        for(Account a:ac){
            integer x=0;
        for(Opportunity o:Oppor){
            if(a.Id==o.accountid){
                x=x+o.OpportunityLineitems.size();
            } 
            System.debug('id '+a.Id+'sizeofopportunitylineitems '+o.OpportunityLineitems.size());

        }
            a.numberOfOpportunityLineItem__c=x;
        }
        update ac;
        
        
    }
}