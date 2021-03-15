public class forMaps {

    public static void startmap(){
        
       List<contact> contactList=new List<contact>();
        contactList=[select id,accountid from Contact where accountid!=null limit 10];
        system.debug('contactList '+contactList);
        
        map<Id,List<Contact>> contactMap=new map<Id,List<Contact>>();
       
        for(contact con:contactList){
            if(!contactMap.containsKey(con.accountid)){
                List<Contact> conList=new List<Contact>();
                conList.add(con);
                contactMap.put(con.accountid,conList);
            }else{
                List<Contact> conList=contactMap.get(con.accountid);
                conList.add(con);
                contactMap.put(con.accountid,conList);
            }
           
            
        }
        
        for(Id key:contactMap.keySet()){
            system.debug('AccountId=> '+key+'::::List'+contactMap.get(key)+'for count-->'+contactMap.get(key).size());
        }
        
        
    }
}