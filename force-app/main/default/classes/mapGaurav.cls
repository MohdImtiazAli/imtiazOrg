public class mapGaurav {
    public static void Gaurav(){
        Map<Id,List<Contact>> MapName=new Map<Id,List<Contact>>();
        Map<Id,Integer> MapName2=new Map<Id,Integer>();
        
        List<Contact>ContactList=[select id,accountid,lastname from Contact where accountid!=null limit 49999];
        List<Contact> ConnList=new List<Contact>();
        integer a=0;
        
        List<Contact> newList=new List<Contact>();
        for(Contact con:ContactList){
            if(MapName.ContainsKey(con.accountid)){
                 List<Contact> c=MapName.get(con.AccountId);
                 c.add(con);
                
                newList=MapName.get(con.AccountId);
                newList.add(con);
                
                 MapName.put(con.AccountId,c);
            }else{
                MapName.put(con.accountid,new list<Contact>());
                List<Contact> c=MapName.get(con.AccountId);
                c.add(con);
                
                 newList=MapName.get(con.AccountId);
                newList.add(con);
                
                MapName.put(con.AccountId,c);
            }
        }
        
        for(Contact con:ContactList){
            if(!MapName2.containsKey(con.AccountId)){
                MapName2.put(con.AccountId,1);
            }else{
                Integer i=MapName2.get(con.AccountId);
                i++;
                MapName2.put(con.AccountId,i);
            }
        }
        
  
        
        for(Id id1:MapName2.keySet()){
            System.debug('Accountid'+'--->'+id1+'***********************Number of contacts---> '+MapName2.get(id1)+'*****************contacts------->'+MapName.get(id1));
        }
        
          system.debug('********************************************************************************************');
          system.debug('********************************************************************************************');
         List<integer> integerList =  MapName2.Values();
        integerList.sort();
        
         
     
    }
}