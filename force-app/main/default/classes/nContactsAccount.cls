public class nContactsAccount {

    public static void maps(){
        
         map<Id,integer> ContactIntMap=new map<Id,integer>();
        List<Contact> conlist=new List<Contact>();
                      conlist=[select id,lastname, accountid from Contact where accountid !=null limit 49999];
        
        System.debug(conlist);
        for(Contact c:conlist)
        {
            if(!ContactIntMap.containskey(c.AccountId)) {
                 ContactIntMap.put(c.AccountId,1);
            }
            else
            {
            Integer b= ContactIntMap.get(c.AccountId);
            b++;
            ContactIntMap.put(c.AccountId,b);
            }
        }
        
       for(Id id1:ContactIntMap.keyset()){
            system.debug('account id='+id1+'            '+'number of contact='+ContactIntMap.get(id1));
        }    
    }
}