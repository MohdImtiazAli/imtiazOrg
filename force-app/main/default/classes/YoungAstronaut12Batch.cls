global class YoungAstronaut12Batch implements Database.Batchable<SObject> {
    
    global integer total =0;
    global integer success =0;
    global integer failure = 0;
    global List<String> csvRowValues = new List<String>();
    global String csvColumnHeader;
    //correct
    global Database.QueryLocator start(Database.BatchableContext bc){
        String Query='SElect id,Name,Fax,Email,MobilePhone,Description,Account.Name,Account.Rating,Account.Phone,Account.Industry from Contact limit 1';
        return Database.getQueryLocator(query);  
        
    }
    
    global void execute(Database.BatchableContext bc,List<Contact> contactList){
        system.debug('contactList==> '+contactList);
        String [] strArr=new String[]{'NAICS CODE','LOC #','SUB LOC #','LOCATION NAME','ADDRESS','ADDRESS LINE 2','ADDRESS LINE 3',
            'CITY','STATE/PROVINCE','COUNTY'};
                for(integer i=0;i<strArr.size();i++){
                    csvRowValues.add(strArr[i]);
                }
        system.debug('csvRowValues'+csvRowValues);
    }
    global void finish(Database.BatchableContext bc){
        List<Folder> folders = [SELECT Id, Name FROM Folder WHERE Name = 'DreamHouse Dashboards'];
       
        if(!folders.isEmpty()){
            String documentName = 'DreamHouse Dashboards-'+ Datetime.now().format('MMM') + Datetime.now().year();
            csvColumnHeader = 'Date, User, Action, Section, Delegate User\n';
            String csvFile = csvColumnHeader + String.join(csvRowValues,'\n');
           
            // Insert the generated CSV file in Document object under "DreamHouse Dashboards".
            Document doc = new Document(Name = documentName, Body = Blob.valueOf(csvFile), FolderId = folders[0].Id, Type = 'csv', ContentType='application/vnd.ms-excel');
            insert doc;
            system.debug('doc'+doc);
        }
      
    }
    
    
    
}