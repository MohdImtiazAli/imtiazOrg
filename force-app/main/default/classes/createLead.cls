public class createLead {
    
    public static void createLeadSendEmail(List<Lead> LeadList){
        List<Lead> newleads = new List<Lead>();
        List<Lead> currentleads = new list<Lead>();
        currentleads = [SELECT Id, Name, Email FROM Lead WHERE Email !=null];
        Map<String, String> compareleads = new Map<String, String>();
        for(Lead u: currentleads){
            compareleads.put(u.Email, u.Name);
            System.debug(compareleads);
        }
        for(Lead lovelylead:LeadList){
            if(lovelylead.Email != null && 
               (compareleads.put(lovelylead.Email, lovelylead.Name) == null)){ // if the key already exists, returns value, otherwise null 
                   //not duplicate
                   newleads.add(lovelylead);
                   
               }else if(lovelylead.Email != null && 
                        (compareleads.put(lovelylead.Email, lovelylead.Name) != null)){
                            //duplicate
                            if(lovelylead.age__c>90){
                                
                            }else if(lovelylead.age__c<=90){
                                EmailManagers.sendMessage(lovelylead.Email,'Lead subject','Your age is less than 90');
                                
                            }
                        }
        }
        if(newleads.size()>0){
            insert newleads;
            
        }
    }
}