public class PhoolSir {

    public static void ForORGDate(){
        Date d=Date.today();
        system.debug(d);
        List<Account> accountList=new List<Account>();
        accountList=[select id,name from Account where createdDate=: d];
        system.debug('accountList'+accountList);
        for(Account ac:accountList){
            system.debug(ac);
        }
    }
}