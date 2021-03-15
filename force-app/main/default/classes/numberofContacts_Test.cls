@isTest
public class numberofContacts_Test {
    
    @TestSetup static void method(){
        List<Account> accountList=new List<Account>();
        for(integer i=0;i<3;i++){
            Account ac=new Account();
            ac.Name='janwar'+i;
            accountList.add(ac);
        }
        insert accountList;
        List<Contact> ContactList=new List<Contact>();
        for(Account ac:accountList){
            for(integer i=0;i<3;i++){
                Contact con=new Contact();
                con.LastName='imtiaz'+i;
                con.AccountId=ac.id;
                ContactList.add(con);
            }
            
        }
        insert ContactList;
        
       
    }
    @isTest
    public static void method1(){
         test.startTest();
        numberofContacts.newmaps();
        test.stopTest();
    }
    
    
    
  /*Or
   *   @isTest
    public static void method(){
        List<Account> accountList=new List<Account>();
        for(integer i=0;i<3;i++){
            Account ac=new Account();
            ac.Name='janwar'+i;
            accountList.add(ac);
        }
        insert accountList;
        List<Contact> ContactList=new List<Contact>();
        for(Account ac:accountList){
            for(integer i=0;i<3;i++){
                Contact con=new Contact();
                con.LastName='imtiaz'+i;
                con.AccountId=ac.id;
                ContactList.add(con);
            }
            
        }
        insert ContactList;
        
        test.startTest();
        numberofContacts.newmaps();
        test.stopTest();
    }*/
}