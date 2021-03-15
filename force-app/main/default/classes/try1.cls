public class try1 {
    
    public static void tryhi(){
        List<OpportunityLineItem> opliList=new List<OpportunityLineItem>();
        opliList=[select id,Opportunity.accountid from OpportunityLineItem];
        
        set<Id> setAccountId=new set<Id>();
        for(OpportunityLineItem opli:opliList){
            setAccountId.add(opli.Opportunity.accountid);
        }
        List<Account> accountList=new List<Account>();
        accountList=[select id,name from Account where id in:setAccountId];
       
        List<Contact> contactList=new List<Contact>();
        contactList=[select id,email from Contact where email!=null];
        
        set<String> emailSet=new set<String>();
        for(Contact con:contactList){
            emailSet.add(con.email);
        }
        
          List<Contact> contactList1=new List<Contact>();
        contactList1=[select id,email from Contact where id in:emailSet];
    }
    
}