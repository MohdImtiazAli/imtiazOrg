public class ADDCon {
    public static void display(){
        list<account> accountList = new List<account>();
        accountList =[select id,name from account limit 5];
        list<contact> contactList= new list<contact>();
        list<account> upAccountList= new list<account>();
        for(account acc: accountList){
            contact con= new contact();
            con.firstname='info';
            con.LastName='default';
            con.email='info@websitedomain.tl';
            con.AccountId= acc.id;
            contactList.add(con);
            
             contact con1= new contact();
            con1.firstname='info';
            con1.LastName='default';
            con1.email='info@websitedomain.tl';
            con1.AccountId= acc.id;
            contactList.add(con1);
        }
        
       insert contactList;
    }

}