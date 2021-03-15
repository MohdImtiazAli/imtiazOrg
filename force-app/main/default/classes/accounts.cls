public class accounts {
 
    Public Account Acc{
        get;set;
    }
    public accounts(){
        Account ac=[select id,name,OwnerId from Account where name='url' limit 1];
         
        Acc=ac;
         
    }


}