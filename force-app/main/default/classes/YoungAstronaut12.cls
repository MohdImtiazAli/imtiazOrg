public class YoungAstronaut12 {
//https://developer.salesforce.com/forums#!/feedtype=SINGLE_QUESTION_DETAIL&dc=Developer_Forums&criteria=ALLQUESTIONS&id=9062I000000IX61QAG
    public static void forAvgDate(){
        List<Account> accountList=new List<Account>();
        accountList=[select id,Activity__c from Account where Activity__c!=null];
        
        List<Integer> DatesList=new List<Integer>();
        for(Account ac:accountList){
            String str=string.valueOf(ac.Activity__c);
            String str2=str.replace('-','');
            integer dates=integer.valueOf(str2);
            DatesList.add(dates);
        }
        system.debug(DatesList);
        
        integer total=0;
        for(Integer i=0;i<DatesList.size();i++){
            total=total+DatesList[i];
        }
        system.debug(total);
        Double average=double.valueOf(total/DatesList.size());
        system.debug(average);
    }
}