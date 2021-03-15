public class acc_op_opli {
    
    public static void AO(){
    //find total NUMBER OF QUANTITY products in opportunity
        list<account> acclist=[select id,name from account limit 10000];
        list<opportunity> opplist=[select id ,name,accountid,TotalOpportunityQuantity from opportunity where accountid in :acclist];
        List<OpportunityLineItem> opplinelist=[select id,opportunityId,quantity from OpportunityLineItem where opportunityId in:opplist];
        
        for(account ac: acclist)
        {
            for(opportunity op:opplist){
                
                decimal sum=0;
                if(ac.Id==op.AccountId)
                {
                    for(OpportunityLineItem opline:opplinelist){
                        if((opline.opportunityId).equals(op.id)){
                            system.debug(op.id+' have ----------> '+opline.Quantity);
                            sum=sum+opline.Quantity;
                        }
                        
                    }
                    system.debug(ac.Name+'   -->'+op.id+' have total sum---------> '+sum);
                }
                
            }
}
      
}
}