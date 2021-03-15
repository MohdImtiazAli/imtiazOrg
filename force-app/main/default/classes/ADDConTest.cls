@isTest
public class ADDConTest {

     @isTest
    public static void testCon(){
        List <Account> acList1 = new List<Account>();
        for(integer i=0;i<2;i++){
            Account a = new Account();
            a.Name='ABCDEF'+i;
            acList1.add(a);
        }
        insert acList1;
       
        test.startTest();
        ADDCon.display();
        test.stopTest();
    }
}