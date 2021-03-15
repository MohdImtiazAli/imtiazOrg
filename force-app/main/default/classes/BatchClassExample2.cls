public class BatchClassExample2 implements
Database.Batchable<sObject>, Database.Stateful {
    // instance member to retain state across transactions
    public Integer recordsProcessed = 0;
     public List<Contact> contactLists;
    public List<Contact> start(Database.BatchableContext bc) {
        String query='select id from Contact limit 10';
        contactLists=Database.query(Query);
        return  contactLists;
    }
    public void execute(Database.BatchableContext bc, List<Contact> contactList){
        contactLists=contactList;
        system.debug('contactLists: '+contactLists);
    }
    public void finish(Database.BatchableContext bc){
        system.debug('contactLists:: inside finish::'+contactLists);
        test1.check(contactLists);
    } 

}