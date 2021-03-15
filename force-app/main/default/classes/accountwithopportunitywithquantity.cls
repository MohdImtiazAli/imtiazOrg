public class accountwithopportunitywithquantity {
//doubt with ram Sir
//find total NUMBER OF QUANTITY products in opportunity when associated with accounts
    public static void oppor(){
        
        list<account> acclist=[select id,name from account where name like 'dengu'];
        list<opportunity> opplist=[select id ,name,accountid from opportunity where accountid!=null];
        List<OpportunityLineItem> opplinelist=[select id,opportunityId,quantity from OpportunityLineItem where opportunityId in:opplist];
       
        for(account a:acclist){
        for(opportunity op:opplist){
            decimal sum=0;
            for(OpportunityLineItem opline:opplinelist){
                if(opline.opportunityId==op.Id && op.Id==a.Id ){
                    system.debug(op.id+' have ----------> '+opline.Quantity);
                    sum=sum+opline.Quantity;
                }
            }
            system.debug(op.id+' have total sum---------> '+sum);
        }
        }
    } 

    public static void oppor2(){
        
        list<account> acclist=[select id,name from account where name like 'dengu'];
        list<opportunity> opplist=[select id ,name,accountid from opportunity where accountid!=null];
        List<OpportunityLineItem> opplinelist=[select id,opportunityId,quantity from OpportunityLineItem where opportunityId in:opplist];
       
        for(account a:acclist){
        for(opportunity op:opplist){
            decimal sum=0;
            for(OpportunityLineItem opline:opplinelist){
                if(opline.opportunityId==op.Id && op.Id==a.Id ){
                    system.debug(op.id+' have ----------> '+opline.Quantity);
                    sum=sum+opline.Quantity;
                }
            }
            system.debug(op.id+' have total sum---------> '+sum);
        }
        }
    } 
 
    
    
    
}