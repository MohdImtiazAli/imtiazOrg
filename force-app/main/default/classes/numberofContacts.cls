public class numberofContacts {
    public static void newmaps(){
        Map<Id,Integer> Maps=new Map<Id,Integer>();
        List<Contact> ConList=[select id,lastname,accountid from Contact where accountid!=null limit 49999];
        
        for(Contact con:ConList){
            if(!Maps.containsKey(con.accountid)){
                maps.put(con.accountid,1);
            }else{
                Integer b=maps.get(con.accountid);
                b++;
                maps.put(con.accountid,b);
            }
        }
        for(Id id1:Maps.keyset()){
            System.debug('accountid = '+id1+'contact = '+maps.get(id1));
        }
    }
}