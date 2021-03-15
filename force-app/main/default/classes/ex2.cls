public class ex2 {
//look up:add contact to account
    public static void ex2(){
        Account ac=new Account();
        ac.Name='Gaurav';
        ac.AnnualRevenue=10000;
        insert ac;
        ID accid=ac.Id;
        
        Contact con=new Contact();
                con.Email='raju@gmail.com';
                con.LastName='Dass';
                con.AccountId=accid;
        
        insert con;
    }
}