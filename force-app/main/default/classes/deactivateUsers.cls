global class deactivateUsers implements Database.Batchable<SObject>
{
 
    global Database.querylocator start(Database.BatchableContext bc)
    {
         dateTime dt = date.today()-60;
       String query = 'SELECT Name, LastLoginDate, Id From User WHERE IsActive = false AND LastLoginDate < +dt  and profile<>"System Adminstrator" ';
    
        
       return Database.getQueryLocator(query);
    }

    global void execute(Database.BatchableContext bc,List<User> activeUserList)
    {
        system.debug('activeUserList '+activeUserList);
        
    }

    global void finish(Database.BatchableContext bc)
    {
        AsyncApexJob a = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed, TotalJobItems, CreatedBy.Email
                          FROM AsyncApexJob 
                          WHERE Id = :BC.getJobId()];

        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {a.CreatedBy.Email};
        mail.setToAddresses(toAddresses);
        mail.setSubject('Reminder of Your Login With salesforce ' + a.Status);
        mail.setPlainTextBody(' You have not login for 60 days Please login ' + a.TotalJobItems + ' batches with '+ a.NumberOfErrors + ' failures.');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }
}