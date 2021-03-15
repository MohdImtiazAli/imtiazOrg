public class YoungAstronaut7 {
    //https://developer.salesforce.com/forums#!/feedtype=SINGLE_QUESTION_DETAIL&dc=Developer_Forums&criteria=ALLQUESTIONS&id=9062I000000IWnTQAW

    public static void countForLoop(){
        List<Account> accountList=new List<Account>();
        accountList=[select id,Name from Account];
        
        integer countOfAccount=0;
        for(Account ac:accountList){
            countOfAccount=countOfAccount+1;
        }
        system.debug('countOfAccount==> '+countOfAccount);
        //or
       
        integer countAccount=0;
        for(Integer i=0;i<accountList.size();i++){
            countAccount=countAccount+1;
        }
         system.debug('countOfAccount==> '+countOfAccount);        
        
        
        integer count=0;
        for(Integer i=0;i<10;i++){
            count=count+1;
        }
        system.debug('count>> '+count);
    }
}