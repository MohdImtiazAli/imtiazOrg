public class ques7 {

    public static void question7(){
       List<Opportunity> con=[select name,closedate from Opportunity];
        if(!con.isEmpty()){
            Date d=date.today();
            List<Opportunity> cl=new List<Opportunity>();
            for(Opportunity o:con){
                if(o.CloseDate>d){
                    cl.add(o);
                }
            }
            
            for(Opportunity np:cl){
                np.Name=np.Name+'f';
            }
            update cl; 
            
            }
        }
    }