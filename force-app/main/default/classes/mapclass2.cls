public class mapclass2 {

    public static void mapclas(){
        Map<Id,Account> Amap=new Map<Id,Account>();
        List<Account> Alist=[select id, name from Account limit 10];
        system.debug(Alist);
        
        //put account values in map
        for(Account a:Alist){
            Amap.put(a.id,a);
        }
        System.debug(Amap);
        
        system.debug('***************************************************************************');
        List<Contact> ContactList=[select id,Accountid from Contact];
        for(Contact con:ContactList){
            system.debug(con);
        }
         system.debug('***************************************************************************');

        
        Map<Id,List<Contact> > AccountContacMap=new Map<Id,List<Contact>>();
        system.debug(AccountContacMap);//empty
        
        for(Contact contactItem:ContactList ){
            if(AccountContacMap.containsKey(contactItem.Accountid)){
             List<Contact> ContactLists=AccountContacMap.get(contactItem.Accountid);
                ContactLists.add(contactItem);
                AccountContacMap.put(contactItem.Accountid,ContactLists);
            }
        }
    }
}