@isTest
public class ques5Test {
    @isTest static void check(){
        Account ac=new Account();
        ac.name='hero';
        insert ac;
        List<Contact> conList=new List<Contact>();
        for(integer i=0;i<5;i++){
            Contact con=new Contact();
            con.lastName='alia'+i;
            con.AccountId=ac.id;
            conList.add(con);
        }
        insert conList;
        ques5.question5();
    }
}