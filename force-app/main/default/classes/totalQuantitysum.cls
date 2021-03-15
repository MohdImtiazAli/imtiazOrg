public class totalQuantitysum {
//total number of only quantity put on every account but cutom feild of account(TotalQuantity__c)
    public static void check(){
       list<Account>acc=[select id,TotalQuantity__c,(select id,TotalOpportunityQuantity from Opportunities) from Account limit 1000];
        for(Account ac:acc){
            decimal sum=0;
            for(integer i=0;i<ac.opportunities.size();i++){
                if(ac.opportunities[i].TotalOpportunityQuantity!=null){
                sum=sum+ac.opportunities[i].TotalOpportunityQuantity;
                   
                }
            }
            ac.TotalQuantity__c=sum;
            system.debug(sum);
        }
      update acc;        
        
         
    }
}