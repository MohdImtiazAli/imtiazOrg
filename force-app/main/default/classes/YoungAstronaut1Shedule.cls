public class YoungAstronaut1Shedule implements Schedulable{
    
    public void execute(SchedulableContext SC) {
        
        YoungAstronaut1 youngBatch=new YoungAstronaut1();
        Database.executeBatch(youngBatch,1000);
        
        /*
* YoungAstronaut1Shedule YA = new YoungAstronaut1Shedule(); 2 // Seconds Minutes Hours Day_of_month Month Day_of_week optional_year 3 String sch = ’20 30 8 10 2 ?’; 4 String jobID = System.schedule(‘Account Updates’, sch, acctUpdates);
String sch = '0 0 24 * * ?';
String jobID = System.schedule('YoungAstronaut1Shedule', sch, YA);
* 
*  RecurringScheduleJob.startJob();  

String day = string.valueOf(system.now().day());

String month = string.valueOf(system.now().month());

String hour = string.valueOf(system.now().hour());

String minute = string.valueOf(system.now().minute() + 10);

String second = string.valueOf(system.now().second());

String year = string.valueOf(system.now().year());



String strJobName = 'Job-' + second + '_' + minute + '_' + hour + '_' + day + '_' + month + '_' + year;

String strSchedule = '0 ' + minute + ' ' + hour + ' ' + day + ' ' + month + ' ?' + ' ' + year;

System.schedule(strJobName, strSchedule, new scheduledTest());
*/
    }
    
}