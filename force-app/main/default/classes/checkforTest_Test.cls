@isTest
public class checkforTest_Test {
    
    @testSetup static void checkMethod(){
        
        Account ac=new account();
        ac.name='deepak dass';
        insert ac;
        
        Contact con=new contact();
        con.LastName='aman';
        con.AccountId=ac.Id;
        insert con;
         Contact con1=new contact();
         con1.LastName='amann';
         con1.AccountId=ac.Id;
        insert con1;
       
        
    }
    static testmethod void chingTest() {
        List<Contact> accountList=new List<Contact>();
        accountList=[select id,accountid from Contact where accountid!=null];
        system.debug('accountList==> '+accountList);
        checkforTest.checking();
    }
}