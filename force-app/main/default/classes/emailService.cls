global class emailService implements Messaging.InboundEmailHandler {

    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail Email,Messaging.InboundEnvelope Envelope){
        Messaging.InboundEmailResult result=new Messaging.InboundEmailResult();
        
        String plainTextBody=email.plainTextBody;
        System.debug('plainTextBody: '+plainTextBody);
        
        Account ac=new Account();
        ac.Name=plainTextBody.substringBetween('<Name>', '</Name>');
        ac.AccountNumber=plainTextBody.substringBetween('<AccNum>', '</AccNum>');
        Database.SaveResult insertAccountRecord=Database.insert(ac);
        return result;
    }
     
}