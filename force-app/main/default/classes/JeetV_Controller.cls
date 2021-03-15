public class JeetV_Controller {

    String message='I wan to talk to you';
    Account ac=new Account(Name='Imtiaz',Phone='12344321');
    public  String getForMessage(){
        return message;
    }
    public Account getForAccount(){
        return ac;
    }
    List<Account> accountList=[select id,name,NumberOfEmployees from Account limit 10];
    public List<Account> getaccountList(){
        return accountList;
    }
    
}