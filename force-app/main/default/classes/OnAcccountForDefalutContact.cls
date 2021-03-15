public class OnAcccountForDefalutContact {

    public static void OnAcccountFor(List<Account> newaccountList){
        
        List<Account> accountList=new List<Account>();
        accountList=[select id,Only_Default_Contact__c from Account where id in: newaccountList];
        List<Contact> contactList=new List<Contact>();
        for(Account ac:accountList){
            Contact con=new Contact();
            con.FirstName='Info';
            con.LastName='Default';
            con.Email='info@websitedomain.tld';
            con.AccountId=ac.Id;
            contactList.add(con);
        }
        insert contactList;
        List<Account> accountList2=new List<Account>();
        if(!contactList.isEmpty()){
            for(Contact co:contactList)
            {
                Account ac=new Account();
                ac.Id=co.AccountId;
                ac.Only_Default_Contact__c=true;
                accountList2.add(ac);
            }
        }
        update accountList2;
    }
}