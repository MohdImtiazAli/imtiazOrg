public class OpportunityContactRoleHandler {

    //this method is for inserting and updating
    //OCR is OpportunityContactRole
    public static void forOCR(List<OpportunityContactRole> ocrList){
        try{
            //putting Opportunity id in opportunityset from OpportunityContactRole
        set<id> opportunityset=new set<id>();
        for(OpportunityContactRole ocr:ocrList){
            if(ocr.IsPrimary==true){
                system.debug('hi');
                opportunityset.add(ocr.OpportunityId);
            }
            
        }
        
            //list of opportunity which has OpportunityContactRole
       List<Opportunity> OpportunityList=new List<Opportunity>();
        OpportunityList=[select id,name,contactid,forContact__c from Opportunity where id in: opportunityset];
        
            //putting contact id in contactSet
        set<id> contactSet=new set<id>();
        for(Opportunity op:OpportunityList){
            contactSet.add(op.ContactId);
        }
        
            //list of contact comming from Opportunity
        List<Contact> contactList=new List<Contact>();
        contactList=[select id from Contact where id in: contactSet];
        
           //if OpportunityContactRole is inserted or updated then custem field forContact__c is populated with OpportunityContactRole 
        for(OpportunityContactRole ocr:ocrList){
            for(Opportunity op:OpportunityList){
                if(op.ContactId==ocr.ContactId){
                    op.forContact__c=ocr.ContactId;
                        
                }
            }
        }
            //now updating the Opportunity
        update OpportunityList;
        }catch(exception e){
            system.debug(e.getMessage());
        }
    }
    
    //This method is for deleting the OpportunityContactRole
     public static void forOCR1(List<OpportunityContactRole> ocrList){
         try{
             //putting Opportunity id in opportunityset from OpportunityContactRole
        set<id> opportunityset=new set<id>();
        for(OpportunityContactRole ocr:ocrList){
            if(ocr.IsPrimary==true){
                opportunityset.add(ocr.OpportunityId);
            }
            
        }
         //list of opportunity which has OpportunityContactRole
       List<Opportunity> OpportunityList=new List<Opportunity>();
        OpportunityList=[select id,name,contactid,forContact__c from Opportunity where id in: opportunityset];
         system.debug(OpportunityList);
         
        set<id> contactSet=new set<id>();
        for(Opportunity op:OpportunityList){
            contactSet.add(op.forContact__c);
        }
          //for deleting the OpportunityContactRole and erasing exiting data of forContact__c
        for(OpportunityContactRole ocr:ocrList){
            for(Opportunity op:OpportunityList){
                if(op.forContact__c==ocr.ContactId){
                    
                    op.forContact__c=null;
                   
                        
                }
            }
        }
             //for updating
        update OpportunityList;
         }catch(exception e){
             system.debug(e.getMessage());
         }
    }
}