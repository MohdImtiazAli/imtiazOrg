public class YOUNGAstronaut11 {
      //wrapper class so that it would return accountList and contact List
    public class acceptCountryCodeWrapper{
        Public List<Account> accountListWrapper;
        Public List<Contact> contactListWrapper;
    }
    
    //method i.e return type is our wrapper
    public static acceptCountryCodeWrapper acceptCountryCode(String BillingPostalCodes){
        acceptCountryCodeWrapper obj=new acceptCountryCodeWrapper();//wrapper object so that we could fill this object
       
        List<Account> accountList=new List<Account>();
        accountList=[select id,BillingPostalCode from Account where BillingPostalCode=:BillingPostalCodes];
        
        set<Id> accountSetId=new set<id>();
        for(Account ac:accountList){
            accountSetId.add(ac.id);
        }
        
        List<Contact> contactList=new List<Contact>();
        contactList=[select id from Contact where id in: accountSetId];
        //now filling the data in wrapper
        obj.accountListWrapper=accountList;
        obj.contactListWrapper=contactList;
        return obj;
    }
}