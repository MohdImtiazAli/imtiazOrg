public class FORCONTACThandler {
    
    public static void forContacs(List<Contact> newcontactList){
        List<Account> accountList=new List<Account>();
        accountList=[select id from Account limit 1000];
        
        List<Contact> contactList=new List<contact>();
        contactList=[select id,accountid from Contact where accountid!=null and id in: newcontactList];
        
        Map<id,integer> countContactMap=new Map<id,integer>();
        for(Contact con:contactList){
            if(!countContactMap.containsKey(con.accountid)){
                countContactMap.put(con.accountid,1);
            }else{
                integer i=countContactMap.get(con.accountid);
                i++;
                countContactMap.put(con.accountid,i);
            }
        }
        
        List<Account> accountList2=new List<Account>();
        for(Id id1:countContactMap.keySet()){
            if(countContactMap.get(id1)>1){
                Account ac=new Account();
                ac.Only_Default_Contact__c=false;
                accountList2.add(ac);
            }
        }
        //insert accountList2;
        update accountList2;
    }
    
    
    public static void handle(List<Contact> newcontactList){
        
        Id StudentContactRecordTypeid = Schema.SObjectType.Contact.getRecordTypeInfosByName().get('Student').getRecordTypeId();
        
        List<Contact> contactList=new List<Contact>(); 
        contactList=[select id,accountid,account.name,recordtypeid,Initial_Text__c,Final_Text__c,Difference_in_Text__c from Contact where  accountid!=null and id in: newcontactList and recordtypeid=:StudentContactRecordTypeid];
        
        
        system.debug('newcontactList'+newcontactList);
        Set<Id> AccountSetId=new Set<Id>();
        for(Contact con:contactList){
            AccountSetId.add(con.accountid);
        }
        system.debug('AccountSetId'+AccountSetId);
        
        
        system.debug('contactList---->'+contactList);
        
        // Contact con=contactList[contactList.size()-1];
        // system.debug('last=>'+con);
        Id StudentAccountRecordTypeid = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Student').getRecordTypeId();
        List<Account> AccountList=new List<Account>();
        AccountList=[select id,Initial_Text__c,recordTypeid,Final_Text__c,Difference_in_Text__c from Account where id in: AccountSetId and recordTypeid=:StudentAccountRecordTypeid];
        List<Account> AccountListForUpdate=new List<Account>();
        for(Account ac:AccountList){
            for(Contact con:newcontactList){
                if(con.AccountId==ac.id){
                    //  Id devRecordTypeId = Schema.SObjectType.Contact.getRecordTypeInfosByName().get('Student').getRecordTypeId();
                   // system.debug('devRecordTypeId'+devRecordTypeId);
                    ac.Initial_Text__c=con.Initial_Text__c;
                    ac.Final_Text__c=con.Final_Text__c;
                    ac.Difference_in_Text__c=con.Difference_in_Text__c;
                }
            }
            
        }
        update AccountList;
    }
}
/*
*  //integer i=devRecordTypeId.Initial_Text__c;
// Id devRecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Student').getRecordTypeId();
* Id devRecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Development').getRecordTypeId();


*   List<Account> accountList=new List<Account>();
accountList=[select id,Only_Default_Contact__c,(select id,accountid from Contacts where id in: newcontactList) from Account limit 1000];

for(Account ac:accountList){
if(ac.contacts.size()>1){
ac.Only_Default_Contact__c=false;
}
}
update accountList;

*List<Contact> leadList2=new List<Contact>();
Account ac=new Account();
ac.name='Hero';
insert ac;
for(integer i=1;i<4;i++){
Contact ld=new Contact();
ld.lastname='khan '+i;
ld.accountid=ac.id;
leadList2.add(ld);
}
insert leadList2;
*/