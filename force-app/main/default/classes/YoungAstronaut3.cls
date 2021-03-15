public class YoungAstronaut3 {
//https://trailblazers.salesforce.com/answers?feedtype=RECENT&criteria=BESTANSWERS#!/feedtype=SINGLE_QUESTION_DETAIL&dc=All&criteria=OPENQUESTIONS&id=9064S000000DUmSQAW
 //How to check whether data available or not in a field for a particular object in salesforce?  
    public static void checkFields(){
        List<Account> accountList=new List<Account>();
        accountList=[select id,Phone,name from Account limit 10];
        
        for(Account ac:accountList){
            if(ac.Phone!=null){  //check Phone data is available or not
                system.debug(ac.Phone);
            }
        }
    }
}