public class Q08A_Apex {

   
    public class AccountWrapper{
         @AuraEnabled
        public string message;
        
         @AuraEnabled
        public List<Account> AccountList;
        
         @AuraEnabled
        public boolean success;
    }
    
    @AuraEnabled
    public static AccountWrapper forAccountList(){
        AccountWrapper Acwrap=new AccountWrapper();
        Acwrap.AccountList=[select id,Name,Rating,NumberOfEmployees from Account limit 1000];
        Acwrap.message='Your Account List is fetched';
        Acwrap.success=true;
        return Acwrap;
    }
}