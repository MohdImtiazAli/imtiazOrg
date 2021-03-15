public class findlookup {
//ek account pe kitne contact hai
    public static void find(){
         Map<Id,Contact> Amap=new Map<Id,Contact>();
        
        List<Contact> ContactList=[select id,Accountid from Contact where accountid !=null];
        System.debug('lookup  list= >'+ContactList);
        
       // Map<Id,List<Contact>> ContactAccount=new Map<Id,List<Contact>>();
        for(Contact con:ContactList){
            Amap.put(con.id,con);
        }
        System.debug(Amap);
    }
}