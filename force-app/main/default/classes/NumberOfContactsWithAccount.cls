public class NumberOfContactsWithAccount {

    public static void mapsp(){
        //Accoint ->>>> kitne contact hai
        map<Id,List<Contact>> ContactMap=new map<Id,List<Contact>>();
         map<Id,integer> ContactIntMap=new map<Id,integer>();
        List<Contact> conlist=new List<Contact>();
                      conlist=[select id,lastname, accountid from Contact where accountid !=null limit 49999];
        
        //step1
      /*  for(Contact c:conlist){
            if(ContactMap.containskey(c.AccountId)){
                List<Contact> LI=ContactMap.get(c.AccountId);
                LI.add(c);
                ContactMap.put(c.AccountId,LI);
            }else{
                ContactMap.put(c.AccountId,new List<Contact>());
                 List<Contact> LI=ContactMap.get(c.AccountId);
                 LI.add(c);
                ContactMap.put(c.AccountId,LI);
            }
        }
        */
        
        //step 2
       /* for(Contact c:conlist){
            if(!ContactMap.containskey(c.AccountId)){
                ContactMap.put(c.AccountId,new List<Contact>());
            }
                 List<Contact> LI=ContactMap.get(c.AccountId);
                 LI.add(c);
                ContactMap.put(c.AccountId,LI);
            }
*/
        
        for(Contact c:conlist){
            if(!ContactMap.containskey(c.AccountId)){
               
                ContactMap.put(c.AccountId,new List<Contact>());
            }
                
            list<contact>li=ContactMap.get(c.AccountId);
                li.add(c);
            
                ContactMap.put(c.AccountId,li);
             
            }
        
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