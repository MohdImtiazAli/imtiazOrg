public class learnMap {

    public static void Learning(){
        List<Account> accountList=new List<Account>();
        accountList=[select id,name from Account limit 10];
        Account ac=new Account();
        ac.Name='Ram';
        accountList.add(ac);
       // accountList.add(new Account('name=Ram'));
        for(integer i=0;i<11;i++){
           // system.debug('ac: '+ac.name);
            system.debug(accountList[i]+' '+i);
        }
      //  map<key>----->values
        //map<id>    map<string>   but key should be unique future me name +lastname+address mila ke key bana rahe ho
        //value me tum map<String,Account>   map<String,List<Account>> map<String,String>  map<String,map<String,String>>
        //map<String,List<Map<String,String>>>
        
        Map<String,String> MapName=new Map<String,String>();
      //  Map<Key,Value>
        MapName.put('Ram','Delhi');           
        MapName.put('Mohan','Mumbai');
        MapName.put('Rohan','Noida');
        system.debug('MapName---->  '+MapName);
        //MapName.put('Rohan','Cloud');
        //key hoga wo unique
        if(!MapName.containsKey('Rohan')){
            MapName.put('Rohan','Cloud');
        }
         if(MapName.containsKey('Mohan')){
            MapName.put('Mohan','House');
        }
         if(!MapName.containsKey('imtiaz')){
            MapName.put('imtiaz','New Delhi');
        }
        system.debug('MapName---->  '+MapName);
        
       // containsKey('Ram');
       // MapName.get(Key);
       system.debug(MapName.get('Mohan'));
        //1--->how to define map
        //2--->put
        //3--->containsKey()
        //4---->MapName.get()
    String str=MapName.get('Mohan');
        system.debug(str);
    
         Map<Integer,String> MapName1=new Map<Integer,String>();
        MapName1.put(1,'delhi');
        MapName1.put(2,'Mumbai');
        MapName1.put(3,'Noida');
        system.debug('MapName1->'+MapName1);
        String s=MapName1.get(3);
        system.debug('s-->'+s);
        system.debug('Keys=>'+MapName1.keySet());//set kyo hota hai kyonki ye unique value store karta hai
       // list<integer> listInteger=MapName1.keySet();
        Set<integer> SetInteger=MapName1.keySet();
        system.debug('SetInteger::'+SetInteger);
        
       
        
        
        for(Integer idx:MapName1.keySet()){
            system.debug('idx:: '+idx);
        }
        
        
        for(Integer key:MapName1.keySet()){
            system.debug('key:: '+key+'=====>'+'Values-->'+MapName1.get(key));
        }
        
        List<String> valuesList=MapName1.Values();
        system.debug('valuesList:: '+valuesList);
         system.debug('values=>'+MapName1.Values());
        for(String val:MapName1.values()){
            system.debug('val '+val);
        }
        //soql governer limit 50,000
        //dml insert update delete restore merge 10000
        //
        //
     
        
          Map<Id,Integer> contactMap1=new Map<Id,Integer>();
        
        
         List<Contact> contactList=new List<Contact>();
        contactList=[select id,accountid from Contact where accountid!=null limit 10];
        system.debug('contactList:'+contactList);
        
        for(Contact con:contactList){
            if(!contactMap1.containsKey(con.accountid)){
                contactMap1.put(con.accountid,1);
            }else{
                integer count=contactMap1.get(con.accountid);
                count++;
                contactMap1.put(con.accountid,count);
            }
        }
        for(Id key:contactMap1.keySet()){
            system.debug('Accountid- '+key+'======'+'::::::::Number of Contacts='+contactMap1.get(key));
        }
        
        system.debug('####################################################################');
        
        
        Map<Id,List<Contact>> contactMap=new Map<Id,List<Contact>>();
       
        
        for(Contact con:contactList){
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
        
      /*  for(Contact con:contactList){
            if(!contactMap.containsKey(con.accountid)){
               contactMap.put(con.accountid,new List<Contact>());
            }
                List<Contact> conList=contactMap.get(con.accountid);
                conList.add(con);
                contactMap.put(con.accountid,conList);
        }*/
         for(Id key:contactMap.keySet()){
            system.debug('Accountid- '+key+'======'+'list of Contact= '+contactMap.get(key)+'::::::::Number of Contacts='+contactMap.get(key).size());
        }
        
        system.debug('####################################################################');
         Map<Id,List<Contact>> contactMap2=new Map<Id,List<Contact>>();
         for(Contact con:contactList){
            if(!contactMap2.containsKey(con.accountid)){
               contactMap2.put(con.accountid,new List<Contact>());
            }    
             contactMap2.get(con.accountid).add(con);
        }
        
         for(Id key:contactMap2.keySet()){
            system.debug('Accountid- '+key+'======'+'list of Contact=> '+contactMap2.get(key)+'==>:::Number of Contacts='+contactMap2.get(key).size());
        }
        
        
       
        
      
        
        
    }
}