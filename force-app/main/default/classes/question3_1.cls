public class question3_1 {

    public static void question3(){
        List<Opportunity> OL_1=new List<Opportunity>();
        for(integer i=0;i<10;i++){
        Opportunity op_1=new Opportunity();
        Date mydate=Date.newInstance(2020, 11, 2);
        op_1.CloseDate=mydate;
        op_1.Name='pizza'+i;
        op_1.StageName='qualification';
            OL_1.add(op_1);
        }
        insert OL_1;
        
        for(Opportunity o:OL_1){
            System.debug(o);
        }
    }
    
}