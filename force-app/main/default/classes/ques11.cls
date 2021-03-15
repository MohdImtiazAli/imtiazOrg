public class ques11 {

    public static void question11(){
        List<Account> ac=[select name from Account order by name asc];
        for(Account a:ac){
            System.debug(a.name);
        }
    
        
    }
}