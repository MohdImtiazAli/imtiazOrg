public class PageBlockTable {
    
    
    
    public list<Account> accountList{get;set;}
    
    
    
    public PageBlockTable(){
        
        
        
        accountList = new list<Account>();
        
        
        
        accountList = [SELECT id,name FROM Account LIMIT 100];
        
        
        
    }
    
    
    
}