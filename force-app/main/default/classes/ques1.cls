public class ques1 {
    public static void question1(){
        List<Account> Alist=new List<Account>();
        for(integer i=0;i<20;i++){
            Account ac=new Account();
            
            ac.Name='rohan'+i;
            ac.BillingCity='noida'+i;
            ac.Phone='9876545676'+i;
            ac.BillingCountry='india';
            ac.AccountNumber='345678987654'+i;
            Alist.add(ac);
        }
        insert Alist;
        for(Account a:Alist){
            System.debug(a);
        }
    }

}