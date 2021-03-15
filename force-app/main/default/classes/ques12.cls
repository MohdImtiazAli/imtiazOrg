public class ques12 {

    public static void question12(){
        List<Account> ac=[select name from Account limit 10];
        for(Account a:ac){
            String nm=a.name;
              System.debug(nm.reverse());
        }
    }
}