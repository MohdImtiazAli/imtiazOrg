public class sumquabtity {
//find total NUMBER OF QUANTITY products in opportunity
    public static void oppor(){
        
        list<account> acclist=[select id,name from account limit 10000];
        list<opportunity> opplist=[select id ,name,accountid from opportunity where accountid in :acclist];
        List<OpportunityLineItem> opplinelist=[select id,opportunityId,quantity from OpportunityLineItem where opportunityId in:opplist];
        for(opportunity op:opplist){
            decimal sum=0;
            for(OpportunityLineItem opline:opplinelist){
                if((opline.opportunityId).equals(op.id)){
                    system.debug(op.id+' have ----------> '+opline.Quantity);
                    sum=sum+opline.Quantity;
                }
            }
            system.debug(op.id+' have total sum---------> '+sum);
        }
        
    } 
    }