trigger MemberSumTrigger on Member__c (after insert, after undelete, after update,before delete,after delete) {
	Set<Id> parentIdsSet = new Set<Id>();
    List<Society__c> societyListToUpdate = new List<Society__c>();
    IF(Trigger.IsAfter){
        IF(Trigger.IsInsert || Trigger.IsUndelete || Trigger.IsUpdate){
            FOR(Member__c c : Trigger.new){
                if(c.Society_Name__c!=null){   
                   parentIdsSet.add(c.Society_Name__c); 
                }
            }
        }
        IF(Trigger.IsDelete){
            FOR(Member__c c : Trigger.Old){
                if(c.Society_Name__c!=null){   
                   parentIdsSet.add(c.Society_Name__c); 
                }
            }
        }
    }
  
    List<Society__c> societyList = new List<Society__c>([Select id ,Name, No_of_Members__c, (Select id, Name From Member__r) from Society__c Where id in:parentIdsSet]);
    FOR(Society__c s : societyList){
        List<Member__c> memberList = s.Member__r;
        s.No_of_Members__c = memberList.size();
        societyListToUpdate.add(s);
    }
    try{
        update societyListToUpdate;
    }catch(System.Exception e){
        
    }	
}