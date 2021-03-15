public class forAccount2 {
    
    
    public List<Account> accountList{
        get;
        set;
    }
    public String Search{
        get;
        set;
    }
    public List<Account> accountSearchList{
        get;
        set;
    }
    
    public forAccount2(){
        accountList=new List<Account>();
        accountList=[select id,name,BillingCity,Phone,BillingPostalCode from Account limit 1000];
        
        
    }
    
    public  void forSearch(){
        accountList.clear();
        accountList=[select id,name,BillingCity,Phone,BillingPostalCode from Account where name=:Search or BillingCity=:Search or Phone=:Search or BillingPostalCode=:Search];
        
    }
     public void clear(){
        accountList.clear();
        accountList=[select id,name,BillingCity,Phone,BillingPostalCode from Account limit 1000];
       
    }
    
    //or
    
    
  /*  public PageReference forSearch(){
        accountList.clear();
        accountList=[select id,name,BillingCity,Phone,BillingPostalCode from Account where name=:Search or BillingCity=:Search or Phone=:Search or BillingPostalCode=:Search];
        return null;
    }
     public PageReference clear(){
        accountList.clear();
        accountList=[select id,name,BillingCity,Phone,BillingPostalCode from Account limit 1000];
        return null;
    }
*/
}