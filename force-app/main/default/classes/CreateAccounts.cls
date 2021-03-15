public class CreateAccounts {
   
    @AuraEnabled
    public static Account createAccount(Account ac){
        insert ac;
        system.debug('run');
        return ac;
    }
}