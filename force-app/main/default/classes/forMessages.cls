public with sharing class forMessages {

    
    public Account accounts{
        get;
        set;
    }
    public forMessages(ApexPages.StandardController controller){
        accounts=new Account();
    }
    
    public void save1(){
      if(accounts.name == '' || accounts.name == null)
       ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,'Please enter Account name'));
        system.debug('accounts.NumberOfEmployees'+accounts.NumberOfEmployees);
      if( accounts.NumberOfEmployees==0 || accounts.NumberOfEmployees == null)
       ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Please enter Account NumberOfEmployees'));
 
      if(accounts.phone == '' || accounts.phone == null)
       ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'Please enter Account phone'));
 
      if(accounts.BillingCity == '' || accounts.BillingCity == null)
       ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO,'Please enter Account City'));
 
    }
}