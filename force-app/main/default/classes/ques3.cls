public class ques3 {
    
    public static void question3(){
        List<Opportunity> OL=new List<Opportunity>();
        for(integer i=0;i<20;i++){
        Opportunity op=new Opportunity();
        Date mydate=Date.newInstance(2020, 11, 2);
        op.CloseDate=mydate;
        op.Name='pizza'+i;
        op.StageName='qualification';
            OL.add(op);
        }
        insert OL;
        
        for(Opportunity o:OL){
            System.debug(o);
        }
    }
    
    
}