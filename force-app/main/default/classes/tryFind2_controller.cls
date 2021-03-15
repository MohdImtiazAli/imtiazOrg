public class tryFind2_controller {
     @AuraEnabled
    public static List<contact> forContact(){
         List<contact> conList = new List<contact>();
        conList = [Select Name, Id from Contact where AccountId !=null LIMIT 10000];
        
        return conList;
    }
    @AuraEnabled
    public static Account forAccount(String conId){
        List<contact> conList = new List<contact>();
        conList = [Select id,accountid,Name from Contact where Id =:conId LIMIT 1];
         system.debug('ConName'+conList);
        List<Account> acclist=new List<Account>();
        acclist=[select id,name from Account where id =:conList[0].AccountId];
        system.debug('Name'+acclist);
        return acclist[0];
    }
}