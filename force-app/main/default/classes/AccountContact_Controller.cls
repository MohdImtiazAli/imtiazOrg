public class AccountContact_Controller {
  @AuraEnabled
    public static List<CONTACT> forAccountContact(){
        List<Contact> contactList=new List<Contact>();
        contactList=[select id,LastName,accountid from Contact limit 20];
        return contactList;
    }
}