trigger forOpportunityContactRole on OpportunityContactRole (After insert,After update,After delete) {
    if(trigger.isAfter){
        if(trigger.isInsert){
            //for Inserting new OpportunityContactRole
            OpportunityContactRoleHandler.forOCR(trigger.new);
        }else if(trigger.isUpdate){
            //for updating existing OpportunityContactRole
            OpportunityContactRoleHandler.forOCR(trigger.new);
        } 
        
    }
    if(trigger.isAfter){
        if(trigger.isdelete){
             //for deleting existing OpportunityContactRole
                        OpportunityContactRoleHandler.forOCR1(trigger.old);
        }
    }
}