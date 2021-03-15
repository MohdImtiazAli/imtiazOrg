@isTest
public class KripaTHandlerTest {
    @isTest
    public static void kripa(){
        List<Account> accountList=new List<Account>();
        for(integer i=0;i<3;i++){
            Account ac=new Account();
            ac.name='Janu'+i;
            accountList.add(ac);
        }
        insert accountList;
        
        List<Case> CaseList=new List<Case>();
        for(Account ac:accountList){
            Case ca=new Case();
            ca.Status='new';
            ca.Origin='email';
            ca.AccountId=ac.id;
            CaseList.add(ca);
            Case ca1=new Case();
            ca1.Status='new';
            ca1.AccountId=ac.id;
            ca1.Origin='email';
            CaseList.add(ca1);
        }
        insert CaseList;
        update CaseList;
        delete caselist[0];
    }
}