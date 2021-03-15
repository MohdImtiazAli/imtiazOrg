public class trigger1Handler1 {
    
    public static void trigacc1(List<Account> Acc){
       list<account> aclist=new list<account>();
        for(Account a:Acc){
            
            account ac=new account();
            ac.name= ac.name+'raju';
            ac.id=a.id;
            aclist.add(ac);
        }
       update aclist;
     //system.debug(aclist);
    }
}