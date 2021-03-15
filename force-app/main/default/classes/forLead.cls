public class forLead {

    public static void stopOwner(List<Lead> newLeadList){
            system.debug('leadsize()'+newLeadList.size());
        set<Id> ownerSet=new set<Id>();
        for(Lead ld:newLeadList){
            ownerSet.add(ld.ownerid);
        }
        
         List<Lead> leadList2=new List<Lead>();
        leadList2=[select id,ownerid from lead where ownerid in: ownerSet];
          system.debug('old size'+leadList2.size());
        
        integer count=0;
        for(Lead ld:leadList2){
            count++;
        }
        system.debug('count od lead'+count);
        
        for(Lead ld:newLeadList){
            if(count>30){
                ld.addError('you are not able to insert');
            }
        }
        
    }
}