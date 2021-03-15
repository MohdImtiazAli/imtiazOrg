public class Young10 {
  /*  //https://developer.salesforce.com/forums#!/feedtype=SINGLE_QUESTION_DETAIL&dc=Developer_Forums&criteria=ALLQUESTIONS&id=9062I000000IWyqQAG
//for query Select Id,DeveloperName  From RecordType  Where SobjectType = 'Opportunity'
    public static void forOpportunity(){
       
       Id OptyId=Schema.getGlobalDescribe().get('Opportunity').getDescribe().getRecordTypeInfosByName().get('Shivam').getRecordTypeId(); 
        system.debug('OptyId');
        Opportunity OptyRec = [select Id,RecordTypeid,RecordType.DeveloperName from Opportunity where RecordTypeid =:OptyId limit 1];
        system.debug('OptyRec==> '+OptyRec.RecordType.DeveloperName);
              
 
    }
*/
}