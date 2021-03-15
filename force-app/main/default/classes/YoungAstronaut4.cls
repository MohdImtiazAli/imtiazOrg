public class YoungAstronaut4 {
//https://trailblazers.salesforce.com/answers?feedtype=RECENT&criteria=BESTANSWERS#!/feedtype=RECENT&dc=All&criteria=OPENQUESTIONS    
   //How to get clone source Id for the records coming from database?
    public static void getClone(){
        Account acc = new account();
        acc.Name='check12';
        insert acc;
        system.debug('acc '+acc);
        Account acc1 = acc.clone();
        acc1.Name='checks';
        insert acc1;
        system.debug('acc1 '+acc1);
        System.debug(acc1.getCloneSourceId()); //Producing expected result as the record(Acc1) is in runtime memory
        Account acc2 = [select id from account where id =: acc1.id];
        system.debug(acc2);
        Account acc3 = acc2.clone();
        acc3.Name='checking..';
        insert acc3;
        system.debug(acc3);
        
        system.debug(acc3.getCloneSourceId());//Is producing null value, as the record is retrieved from database
    }
}