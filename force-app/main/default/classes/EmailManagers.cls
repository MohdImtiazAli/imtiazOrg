public class EmailManagers {

    public static void sendMessage(String Address,String Subject,String Body){
         Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String [] toAddresses = new String[] {Address};
        mail.setToAddresses(toAddresses);
        mail.setSubject(Subject);
        mail.setPlainTextBody(Body);	
        messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
    }
}