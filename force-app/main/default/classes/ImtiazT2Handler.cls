/*Create a custom object Agreement with below fields :
- Duration (picklist values 3,6,9)
Create another custom object Payment with below fields :
- Start Date (type - Date )
- End Date (type - Date )
- Agreement (Lookup of agreement)
Write a trigger on the insert of Agreement to create payment record according to the agreement Duration.
For ex : If agrement duration is 3 then create 3 payment record related to that agreement with start date
of first record must be todays date and end date must be of one month from today's date and continue
for other records.
 * 
 * 
 */

public class ImtiazT2Handler {

    public static void imtiazT(List<Agreement__c> newAgreeMentList){
        system.debug('newAgreeMentList'+newAgreeMentList);
        List<Payment__c> pmntList=new List<Payment__c>();
        for(Agreement__c agr:newAgreeMentList){
            for(integer i=0;i<integer.valueOf(agr.Duration__c);i++){
                Payment__c pmnt=new Payment__c();
                pmnt.Name='ali'+i;
                pmnt.StartDate__c=Date.today();
                pmnt.EndDate__c= pmnt.StartDate__c.addDays(30);
               pmnt.Agreement__c=agr.Id;
                pmntList.add(pmnt);
            }
        }
        system.debug('pmntList'+pmntList+pmntList.size());
        if(pmntList.size()>0){
            insert pmntList;
            system.debug('inside');
        }
    }
}