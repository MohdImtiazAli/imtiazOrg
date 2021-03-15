public class checkforTest {

    public static void checking(){
        List<Contact> contactList=new List<Contact>();
        contactList=[select id ,accountid from Contact where accountid!=null];
        
        map<id,integer> mapName=new map<id,integer>();
        for(Contact con:contactList){
            if(!mapName.containsKey(con.accountid)){
                mapName.put(con.accountid,1);
            }else{
                integer count=mapName.get(con.AccountId);
                count++;
                 mapName.put(con.accountid,count);
            }
        }
        for(Id id1:mapName.keySet()){
            system.debug('accountid '+id1+'---->'+mapName.get(id1));
        }
    }
}