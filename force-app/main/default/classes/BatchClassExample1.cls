global class BatchClassExample1 implements Database.Batchable<sObject>{
        global List<Account> accountList;
    global  List<Account> accList1;
    
      
    public BatchClassExample1(String Name){
        accountList=[select id,Name from Account where name like '%ab%'];
    }
    global List<Account> start(Database.BatchableContext BC) {
      
        return accountList;
    }
    
    global void execute(Database.BatchableContext BC, List<Account> accList) {
        accList1=accList;
       
       system.debug('inside execute: '+accList1);
    }
    
    global void finish(Database.BatchableContext BC) {
        system.debug('Finish');
    system.debug('accList1==> '+accList1);
    test1.check(accList1);
    }
}