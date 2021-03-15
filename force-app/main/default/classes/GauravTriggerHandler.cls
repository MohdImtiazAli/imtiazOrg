public class GauravTriggerHandler {
    /*
     * Date d=Date.today();
        integer a=d.month();
       system.debug(a);
     * 
     * 
     */
    public static void handle(List<Time__c> newTimeList){
        system.debug(newTimeList);
        List<Time__c> timeList=new List<Time__c>();
        timeList=[select id,Start_Date__c,End_Date__c,Name from Time__c where name Like 'a%' and id in: newTimeList];
        system.debug(timeList);
        
         List<Contact> ContactList=new List<Contact>();
        for(Time__c tm:TimeList){
            DateTime d =system.today();
            String DT=d.format('MM');
            integer DTI=integer.valueOf(DT);
             system.debug('DTI'+DTI);
            
            DateTime dStart=tm.Start_Date__c;
            String DS=dStart.format('MM');
             integer DSI=integer.valueOf(DS);
                        system.debug('DSI'+DSI);

            
            DateTime dEnd=tm.End_Date__c;
            String DE=dEnd.format('MM');
            integer DEI=integer.valueOf(DE);
              system.debug('DEI'+DEI);
            if( (DTI-1)==DSI && (DTI-1)==DEI){
                Contact con=new Contact();
                con.lastname=tm.name;
                ContactList.add(con);
                 system.debug('inside');
            }
            
         }
        insert ContactList;
        system.debug('ContactList'+ContactList);
    }
}