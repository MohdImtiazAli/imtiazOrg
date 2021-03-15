public class Q7A_Apex {

    @AuraEnabled
    public static boolean login(String user,String Pass){
        system.debug('user='+user+'-------'+'Pass====='+Pass);
        List<Contact> contactList=new List<Contact>();
        contactList=[select id,UserName__c,Password__c from Contact where UserName__c=:user limit 1];
        boolean check= false;
        if(Pass==contactList[0].Password__c){
            check= true;
            system.debug('login successfully');
            return check;
             
        }else{
            system.debug('login Failed');
            return check;
        }
    }
    
}