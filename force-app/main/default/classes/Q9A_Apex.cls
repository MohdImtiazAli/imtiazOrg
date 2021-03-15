public class Q9A_Apex {

    @AuraEnabled
    public static List<Account> forContact(){
        List<Account> accountList=new List<Account>();
        accountList=[select id,Name from Account Limit 1000];
        return accountList;
    }
    
    @AuraEnabled
    public static Contact ContactName(String ids,String LN){
        system.debug(ids+' '+LN);
        Contact con=new Contact();
        con.LastName=LN;
        con.AccountId=ids;
        insert con;
        return con;
    }
}