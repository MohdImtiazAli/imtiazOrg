public class batchPractice implements
Database.Batchable<sObject>, Database.Stateful {
    // instance member to retain state across transactions
    public Integer recordsProcessed = 0;
     
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT ID, Account.Name FROM Contact ' +
            'limit 1'
            //'Where BillingCountry = \'USA\'                    '
        );
    }
    public void execute(Database.BatchableContext bc, List<Contact> contactList){
        // process each batch of records
        system.debug('contactList: '+contactList);
       List<Contact> contactListInsert=new List<Contact>();
        for(integer i=0;i<100;i++){
             recordsProcessed = recordsProcessed + 1;
            Contact con=new Contact();
            con.lastname='swati'+i;
            contactListInsert.add(con);
        }
        system.debug('contactListInsert==> '+contactListInsert);
         insert contactListInsert;
        List<Contact> contactList3=[select id from Contact];
        system.debug('contactList3 '+contactList3);
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