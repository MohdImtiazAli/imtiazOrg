global class BatchAccountInsert implements Database.Batchable<SObject> {
    global integer total =0;
    global integer success =0;
    global integer failure = 0;
    global List<Account> start(DataBase.BatchableContext BC){
        
        List<Account> accountList=new List<Account>();
        for(integer i=0;i<50;i++){
            Account ac=new Account();
            ac.name='imtiaz '+i;
            accountList.add(ac);
            
        }
        
        return accountList;
    }
    
    global void execute(DataBase.BatchableContext BC,List<Account> accountList){
        system.debug('accountList==> '+accountList);
        system.debug('accountList size > '+accountList.size());
       
        
        
         Database.SaveResult[] result = Database.insert(accountList,false);
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
    
    global void finish(DataBase.BatchableContext BC){
        system.debug('total==> '+total);
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        email.setSubject('Status: ContactBatch');
        email.setSenderDisplayName('Imtiaz Khan');
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