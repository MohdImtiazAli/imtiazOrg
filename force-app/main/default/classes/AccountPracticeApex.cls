public class AccountPracticeApex {
   @AuraEnabled
    public static Account forAccountInsert(String Accname,String Accphone){
        system.debug('Accname==> '+Accname+'Accphone==> '+Accphone);
        Account ac=new Account();
        ac.name=Accname;
        ac.phone=Accphone;
        insert ac;
            return ac;
    }
    @AuraEnabled
    public static List<Account> accountListData(){
        List<Account> accountList=new List<Account>();
        accountList=[select id,name from Account limit 100];
        return accountList;
    }

}