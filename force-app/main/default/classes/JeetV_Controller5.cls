public class JeetV_Controller5 {

    public String keyWord;
    List<Account> accountList=[select id,Name,Phone from Account limit 20];
    
    public String getkeyWord(){
        return keyWord;
    }
    
    public List<Account> getaccountList(){
        return accountList;
    } 
    
     
    public void setkeyWord(String s){
        keyWord=s;
    }
    
    public PageReference search(){
        
        List<List<SObject>> searchList = [FIND :keyWord IN ALL FIELDS RETURNING Account (Name,Phone)];
        accountList= ((List<Account>)searchList[0]);
        return null;
    }
    
}