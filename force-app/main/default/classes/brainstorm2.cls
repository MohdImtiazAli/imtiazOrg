public class brainstorm2 {

    public static void brain(){
                list<Account>AccList=new List<Account>();
                 Acclist=[select id,name,copy_Address__c,BillingStreet,BillingAddress,BillingCity,BillingState,BillingPostalCode from Account where copy_Address__c=true ];
        list<Contact>Conlist=new List<Contact>();
        Conlist=[select id,accountid,MailingStreet,MailingAddress,MailingCity,MailingState,MailingPostalCode from Contact where accountid in: Acclist];
       
        for(Account ac:AccList){
            for(Contact con:Conlist){
                
                if(ac.Id==con.AccountId && ac.copy_Address__c==true){
                   
                    if(ac.BillingStreet==null){
                        con.MailingStreet=ac.name+'BillingStreet';
                    }else{
                        con.MailingStreet=ac.BillingStreet;
                    }
                  
                    
                     if(ac.BillingCity==null){
                        con.MailingCity=ac.name+'BillingCity';
                    }else{
                        con.MailingCity=ac.BillingCity;
                    }
                    
                    if(ac.BillingPostalCode==null){
                        con.MailingPostalCode=ac.name+'BillingCode';
                    }else{
                        con.MailingPostalCode=ac.BillingPostalCode;
                    }
                    
                     if(ac.BillingState==null){
                        con.MailingState=ac.name+'BillingState';
                    }else{
                        con.MailingState=ac.BillingState;
                    }
                }
            }
        }
       
              update Conlist;
      
      
    }
}