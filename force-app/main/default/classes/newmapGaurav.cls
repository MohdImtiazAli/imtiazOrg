public class newmapGaurav {
//find 2 highest contact associate with account
    public static void Gaurav(){
        Map<Id,List<Contact>> MapName=new Map<Id,List<Contact>>();
        Map<Id,Integer> MapName2=new Map<Id,Integer>();
        
        List<Contact>ContactList=[select id,accountid,lastname from Contact where accountid!=null limit 49999];
     
        
        for(Contact con:ContactList){
            if(!MapName2.ContainsKey(con.accountid)){
                 MapName2.put(con.AccountId,1);
                 List<Contact> c=new List<Contact>();
                 c.add(con);
                
                 MapName.put(con.AccountId,c);
                
            }else{
                 Integer a=MapName2.get(con.AccountId);
                a++;
                MapName2.put(con.AccountId,a);
                
                List<Contact> c=MapName.get(con.AccountId);
                c.add(con);
                MapName.put(con.AccountId,c);  
            }
        }
        
        for(Id id1:MapName.keySet()){
            System.debug('accountid= '+id1+'NumberOfContacts----------->'+MapName2.get(id1)+'Group of contacts---->'+MapName.get(id1));
        }
        
        Map<Integer,list<Contact>> MapName3=new Map<Integer,list<Contact>>();
        
        for(id ids:MapName2.keySet()){
            if(!MapName3.containsKey(MapName2.get(ids))){
                MapName3.put(MapName2.get(ids),MapName.get(ids));
            }
        }
        system.debug('*****************************************************************');
       List<Integer> Ilist=new List<Integer>();
        for(Integer i1:MapName3.keySet()){
            System.debug(i1);
            Ilist.add(i1);
        }
        Ilist.sort();
        system.debug('sortValues'+Ilist);
        
        List<Integer> Ilist2=new List<Integer>();
        for(Integer i=Ilist.size()-1;i>=0;i--){
            Ilist2.add(Ilist[i]);
        }
        system.debug('sorting decreasing order order'+Ilist2);
        
        for(integer i=0;i<3;i++){
            system.debug(Ilist2[i]+'===='+MapName3.get(Ilist2[i]));
        }
        
        
    }
}