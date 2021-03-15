public class Q1Map {

    public static void questions(){
        Map<Integer,Account>MapName=new Map<Integer,Account>();   
       List<Account>Alist=new List<Account>();
        for(Integer i=0;i<10;i++){
            if(!MapName.ContainsKey(i)){
                Account ac=new Account();
                ac.Name='imtiaz'+i;
                MapName.put(i,ac);
            }else{
                Account a=MapName.get(i);
                a.Name='imtiaz'+i;
                MapName.put(i,a);
            }
        }
        for(Integer i1:MapName.keySet()){
            system.debug('i1'+i1+'--------------------------------->'+MapName.get(i1));
        }
        
    }
}