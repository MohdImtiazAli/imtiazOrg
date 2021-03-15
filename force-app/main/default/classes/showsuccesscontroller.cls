public class showsuccesscontroller {
    
    public string accName{get;set;}
    public PageReference insertAcc(){
        system.debug('hi');
        account acc=new account();
        acc.Name = accName;
        system.debug('accName '+accName+'========> acc.Name  '+acc.Name );
        if(acc.Name != null && acc.Name != ''){
            insert acc;
            system.debug('acc '+acc);
        }
     /*   if (acc.Name == null || acc.Name == ''){
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Please enter Account Name'));
        }
        if (acc.Name != null && acc.Name != ''){
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM,'Record insert successfully'));
        }
        */
      return null;
    }

}