public class GauravBrainStorm {

    public static void Gaurav(){
        
        List<String>newList=new List<String>();
        List<Account> accountList=[select name from Account];
        List<ForName__c> namesList=[select 	Names__c from ForName__c];
        
        for(ForName__c n:namesList){
        for(Account ac:accountList){
           n.Names__c=ac.Name;
        }
        }
        insert namesList;
        system.debug(namesList);
     }
}