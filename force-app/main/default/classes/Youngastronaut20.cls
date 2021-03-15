public class Youngastronaut20 {
    //https://developer.salesforce.com/forums#!/feedtype=SINGLE_QUESTION_DETAIL&dc=Developer_Forums&criteria=ALLQUESTIONS&id=9062I000000IXJAQA4
    public static void forFullName(List<Contact> contactList){
        
        List<Contact> ContactListUpdate=new List<Contact>();
        for(Contact con:contactList){
            Contact conNew=new Contact();
            conNew.FullName__c=con.FirstName+' '+con.LastName;
            conNew.id=con.id;
            ContactListUpdate.add(conNew);
        }
        if(ContactListUpdate.size()>0){
            system.debug('inside '+ContactListUpdate);
            update ContactListUpdate;
            
        }
    }
    
}