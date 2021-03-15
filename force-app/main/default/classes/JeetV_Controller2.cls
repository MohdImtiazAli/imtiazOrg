public class JeetV_Controller2 {

    Account[] accountList;
    public Account[] getaccountList(){
        return accountList;
    }
    
    public pageReference showAccount(){
        accountList=[select name,Phone from Account];
        system.debug(accountList);
        return null;
    } 
    public pageReference showPhone(){
         accountList=[select name, Phone from Account where Phone!=null];
        return null;
    }
}