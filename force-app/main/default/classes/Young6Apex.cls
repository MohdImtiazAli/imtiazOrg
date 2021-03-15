public class Young6Apex {
    Public Account Acc{
        get;set;
    }
    public Young6Apex(){
        Account ac=[select id,name,Detail__c from Account where name='url' limit 1];
        system.debug('ac'+ac.Detail__c);
        Acc=ac;
         system.debug('Acc'+Acc.Detail__c);
    }

}