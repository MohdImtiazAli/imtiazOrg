public class ExampleOpportunity3 {
//all opportunities created in aday by a user should not exceed 100k
    public static void example(List<Opportunity> listOpportunity){
        
        //fetch existing record first which was created today
      List<Opportunity> existOpportunity=[select id,Amount from Opportunity where createdDate=today];
       double totalAmount=0;
        for(Opportunity op:existOpportunity){
            if(op.Amount!= null) {
                totalAmount=totalAmount+op.Amount;  }
        }
        
        //now inserting for new record 
        for(Opportunity newopp:listOpportunity){
            totalAmount=totalAmount+newopp.Amount;
            if(totalAmount>100000){
                newopp.addError('you exceede your daily limit');
            }
        }
    }
}