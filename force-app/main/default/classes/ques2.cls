public class ques2 {

    public static void question2(){
        List<Account> AL=new List<Account>();
        for(integer i=0;i<40;i++){
        Account ac=new account();
        ac.Name='aeepak'+i;
            AL.add(ac);
        } 
        insert AL;
        
        List<Contact> Clist=new List<Contact>();
        for(integer i=0;i<40;i++){
            Contact con=new Contact();
            con.LastName='aharma'+i;
            con.AccountId=AL[i].id;
            Clist.add(con);
        }
        insert Clist;
        
        for(Account a:AL){
            System.debug(a);
        }
        
    }
}