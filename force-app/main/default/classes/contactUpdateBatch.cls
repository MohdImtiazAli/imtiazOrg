public class contactUpdateBatch implements
Database.Batchable<sObject>, Database.Stateful {
    // instance member to retain state across transactions
    public Integer recordsProcessed = 0;
     
    public Database.QueryLocator start(Database.BatchableContext bc) {
        
        return Database.getQueryLocator(
            'SELECT ID, Account.Name FROM Contact ' +
            'limit 1500'
            //'Where BillingCountry = \'USA\'                    '
        );
    }
    public void execute(Database.BatchableContext bc, List<Contact> contactList){
        // process each batch of records
       
        Account ac=[select id from Account limit 1];
        
        for (Contact con : contactList) {
            if(con.Account.Name==null){
                system.debug('inside');
                con.AccountId=ac.id;
                recordsProcessed = recordsProcessed + 1;
            }
            
        }
        
        update contactList;
    }
    public void finish(Database.BatchableContext bc){
        System.debug(recordsProcessed + ' records processed. Imtiaz!');
        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors,
                            JobItemsProcessed,
                            TotalJobItems, CreatedBy.Email
                            FROM AsyncApexJob
                            WHERE Id = :bc.getJobId()];
        String Address=job.CreatedBy.Email;
        String Subject='for updating contact';
        String Body='i think your contact is updated '+'Your record processed is= '+recordsProcessed;
        
        if(job.status == 'finished')
        EmailManagers.sendMessage(Address,Subject,Body);
    } 
}