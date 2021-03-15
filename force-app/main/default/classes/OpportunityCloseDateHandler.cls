public class OpportunityCloseDateHandler {

    public static void OpportunityClose(List<Opportunity>OpporList){
        
       // OpporList=[select id,CloseDate from Opportunity];
        
        for(Opportunity op:OpporList){
            if(op.CloseDate<system.today()){
                op.addError('Please enter a future Closed Date');
            }
        }
    }
}