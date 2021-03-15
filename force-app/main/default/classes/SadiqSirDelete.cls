public  class SadiqSirDelete {
    
    
    
     @AuraEnabled
    public static void saveOpportunity(List<Opportunity> ListOpportunity){
        system.debug('ListOpportunity'+ListOpportunity);
        Insert ListOpportunity;
        
       
        
    }
   /* @AuraEnabled
    public static void saveOpportunity(List<Opportunity> ListOpportunity,String accid){
        system.debug('ListOpportunity: '+accid);
        
        for(Opportunity op:ListOpportunity)
        {
         op.accountid=accid;
        }
        
        system.debug(ListOpportunity[0].accountid);
        Insert ListOpportunity;
        
       
        
    }
*/
}