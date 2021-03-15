global class BatchClass2 implements Database.Batchable<sObject>,Database.Stateful{
    global integer total =0;
    global integer success =0;
    global integer failure = 0;
    //correct
    global Database.QueryLocator start(Database.BatchableContext bc){
        String Query='SElect id,Name,Fax,Email,MobilePhone,Description,Account.Name,Account.Rating,Account.Phone,Account.Industry from Contact limit 1';
        return Database.getQueryLocator(query);  
        
        
        
    }
    
    global void execute(Database.BatchableContext bc,List<Contact> contactList){
        system.debug('contactList==> '+contactList);
        Integer size = contactList.size();
        List<Contact> conList = new List <Contact>();
        
        for(integer i=0;i<2;i++){
            Contact c = new Contact();
            c.Lastname='devkajol'+' '+i;
            conList.add(c);
            success=success+1;
            
        }
        system.debug('conList==> '+conList);
        
        Database.SaveResult[] result = Database.insert(conList,false);
        Integer result_size =result.size();
        for(integer i=0;i<result_size;i++){
            Database.SaveResult s=result.get(i);
            if(s.isSuccess()){
                success+=1;
            }
            else{
                failure+=1;
            }
            total+=1;
            
        }
        system.debug('result==> '+result);
    }
    global void finish(Database.BatchableContext bc){
        
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        email.setSubject('Status: ContactBatch');
        email.setSenderDisplayName('Rishavv');
        email.setHtmlBody('Batch Completed'+'</br> Total'+total+'</br> success:'+success+'</br> failure'+failure);
        List<String> emailTo = new List<String>();
        emailto.add('swati.mishra@cloudanalogy.com');
        emailto.add('imtiaz.ali@cloudanalogy.com');
        email.setToAddresses(emailTo);
        
        Messaging.SingleEmailMessage[] emailList = new List<Messaging.SingleEmailMessage>();
        emailList.add(email);
        Messaging.sendEmail(emailList, false);
    }
    
    
}