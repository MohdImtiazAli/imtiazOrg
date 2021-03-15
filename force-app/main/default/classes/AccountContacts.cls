public class AccountContacts {
    
    public static void acontacts(List<Account> Acc){
        try{
            list<Account> newlist= new list<Account>();
            newlist=[select id ,NumberOfEmployees,(select id from contacts) from Account where id in: Acc];
            list<contact> conlist=new list<contact>();
            list<contact> conlist1=new list<contact>();
            for(account ac: newlist)
            {
                if(ac.NumberOfEmployees>ac.contacts.size())
                {
                    for(integer i=0;i<ac.NumberOfEmployees-ac.contacts.size();i++)
                    {
                        contact co=new contact();
                        co.LastName='A'+i;
                        co.AccountId=ac.id;
                        conlist.add(co);
                    }
                }
                else if(ac.contacts.size()>ac.NumberOfEmployees)
                {
                    for(integer i=0;i<ac.contacts.size()-ac.NumberOfEmployees;i++)
                    {
                        conlist1.add(ac.contacts[i]);
                    }
                        
                }
            }
            if(conlist.size()!=null)
            {
                 insert conlist;
            }
            if(conlist1.size()!=null)
            {
                delete conlist1;
            }
            
            
            /* List<Contact>ConList=new List<Contact>();
// List<Account> Alist=[select id,NumberOfEmployees from account where id in: Acc];
for(Account ac:Acc){
for(Integer i=0;i<ac.NumberOfEmployees;i++){
Contact con=new Contact();
con.LastName='Ali'+i;
con.AccountId=ac.id;
ConList.add(con);

}
}
insert ConList;*/
            
            
        }
        catch(exception e){
            system.debug('getMessage'+e.getMessage());
        }
    }
    
    
    public static void check(List<Account> newAccountList,List<Account> OldAccountList){
        set<Id> setIdA=new set<Id>();
        for(Account ac:newAccountList){
            setIdA.add(ac.id);
        }
        system.debug('');
        
        List<Contact> conList=[select id,lastname,accountid from Contact where accountid in: setIdA];
        system.debug('contact==?>   '+conList);
        
        system.debug('new'+newAccountList);
          system.debug('old'+OldAccountList);
    }
}