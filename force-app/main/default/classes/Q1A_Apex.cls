public class Q1A_Apex {
      @AuraEnabled
    public static Account ForAccount(String Name,String Phone,String ANumber,String City,String Country){
         system.debug(Name+' '+Phone+' '+ANumber+' '+City+' '+Country);
        Account ac=new Account();
        ac.Name=Name;
        ac.Phone=Phone;
        ac.AccountNumber=ANumber;
        ac.BillingCity=City;
        ac.BillingCountry=Country;
        insert ac;
        return ac;
    }
}