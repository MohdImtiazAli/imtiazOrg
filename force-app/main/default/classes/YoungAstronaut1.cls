public class YoungAstronaut1 implements
Database.Batchable<sObject>, Database.Stateful {
    // instance member to retain state across transactions
    public Integer recordsProcessed = 0;
    public double TotalAmount = 0;
    
    public Database.QueryLocator start(Database.BatchableContext bc) {
        
        return Database.getQueryLocator(
            'SELECT ID, Amount FROM Opportunity ' +
            'limit 100000'+
            'Where createdDate = today'                    
        );
    }
    public void execute(Database.BatchableContext bc, List<Opportunity> OpportunityList){
        
        for (Opportunity opp : OpportunityList) {
              TotalAmount=TotalAmount+opp.Amount;
                recordsProcessed = recordsProcessed + 1;
        
        }
      
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
        String Body='i think your contact is updated '+'Your record processed is= '+recordsProcessed+'Total Amount of Opportunity is='+TotalAmount;
        
        if(job.status == 'finished')
            EmailManagers.sendMessage(Address,Subject,Body);
    } 
}