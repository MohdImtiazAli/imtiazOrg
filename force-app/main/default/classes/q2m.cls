public class q2m {

    public static void q2(){
        Map<Id,Contact>MapName=new Map<Id,Contact>();
        List<Contact> ConList=[select id ,accountid from Contact where accountid!=null limit 10];
        
        for(Contact c:ConList){
            if(!MapName.containsKey(C.accountid)){
                Contact cc=new Contact();
                cc.LastName='khan'+c.AccountId;
                MapName.put(c.AccountId,cc);
            }else{
                Contact co=MapName.get(c.AccountId);
                co.LastName='khan'+c.AccountId;
                MapName.put(c.AccountId,co);
            }
        }
        for(Id id1:MapName.keySet()){
            system.debug('id1---->'+id1+'------------>'+MapName.get(id1));
        }
        
    }
}