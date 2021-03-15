public class ContactUpdateHandler {

    public static void contacts(List<Contact> contactList){
        list<Account>AcountList=new List<Account>();
        AcountList=[select id,name from account];
        
        List<Contact>conList=new List<Contact>();
        for(Contact con:contactList){
            for(Account ac:AcountList){
                if(con.AccountId==ac.Id){
                ac.Name=ac.Name+con.lastName;
            }
            }
        }
        update AcountList;
    }
    public static void forupdateabove(List<Contact>newcontactList,List<Contact>OldcontactList){
        
        Set<Id> setid=new Set<Id>();
        for(Contact con:OldcontactList){
            setid.add(con.AccountId);
        }
        List<Account>AccountList=new List<Account>();
        AccountList=[select id,name from account where id in: setid];
        integer i=0;
        for(Account ac:AccountList){
            if(OldcontactList[i].lastName != newcontactList[i].lastName){
                ac.name=ac.Name.remove(OldcontactList[i].lastName);
                ac.name=ac.name+' '+ newcontactList[i].lastName;
            }
           
        }
        update AccountList;
    }
    
    public static void forDelete(List<Contact>oldContactList){
        try{
        Set<Id> setId=new Set<Id>();
        for(Contact con:oldContactList){
            setId.add(con.AccountId);
        }
        List<Account>AccountList=new List<Account>();
        AccountList=[select id,name from Account where id in: setId];
        integer i=0;
        for(Contact conn:oldContactList){
            for(Account ac:AccountList){
                if(ac.Id==conn.AccountId){
              		 ac.Name=ac.Name.remove(conn.lastName);
                }
            }
    }
            System.debug('------>'+ AccountList[0].Name);
             update AccountList;
        } catch(exception e){
            system.debug(e.getMessage());
        } 
    }
}