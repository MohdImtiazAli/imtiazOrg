public class ImtiazExam {
 public static void emailUpdate(){
        try{
        List<Account> accountList=new List<Account>();
        accountList=[select id,TotalEmails__c  from account limit 49999];
        
        List<Contact> contactList=new List<Contact>();
        contactList=[select id,accountid,email from Contact where accountid!=null and email!=null];
        map<Id,integer> MapName=new map<Id,Integer>();
        
        for(Contact con:contactList){
            if(!MapName.containsKey(con.accountid)){
                MapName.put(con.accountid,1);
            }else{
                integer i=mapName.get(con.accountid);
                i++;
                MapName.put(con.accountid,i);
            }
        }
        List<Account> accountupdate=new List<Account>();
        for(Id id1:mapName.keySet()){
            Account ac=new Account();
            ac.Id=id1;
            ac.TotalEmails__c=mapName.get(id1);
            accountupdate.add(ac);
        }
        update accountupdate;
        }catch(exception e){
            system.debug(e.getMessage());
        }
    }
}