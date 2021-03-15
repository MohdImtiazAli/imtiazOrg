public class CreateContactcls {
      @AuraEnabled
    public static String createContact(Contact contObj){
        system.debug(contObj.FirstName);
        
        insert contObj;
        return contObj.id;
    }
}