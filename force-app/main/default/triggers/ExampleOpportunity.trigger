trigger ExampleOpportunity on Opportunity (before insert,before update,after update,after insert) {
//create a trigger on oppportunity that throws error 
//if amount is less than 5000 and if an existing record is being updated amount should not be less than 3000
      /*  for(Opportunity op:trigger.new){
            if(trigger.isInsert && op.Amount<5000){
                 op.adderror('amount should not be less than 5000');
            }else if(trigger.isUpdate && op.Amount<3000){
                 op.adderror('amount should not be less than 3000');
            }
        }
    */
  
    
    /*
     *  if(trigger.isBefore){
        if(trigger.isInsert){
            for(Opportunity o:trigger.new){
                if(o.Amount<5000){
                    o.adderror('amount should not be less than 5000');
                }
            }
        }
        
        if(trigger.isUpdate){
            for(Opportunity o:trigger.new){
                if(o.Amount<3000){
                    o.addError('amount should not be less than 3000');
                }
            }
        }
     * 
     * }
     */
    
   /*
    *Write a trigger to stop inserting more than two contacts in opportunity if it has 2 line items and the stage
name is Prospecting or Qualification. 
    */

    if(Trigger.isAfter && trigger.IsUpdate){
      //  RishavTHandler.Rishav(trigger.new);
    }
    
    if(Trigger.isAfter && trigger.isInsert){
        RishavTHandler.rishavT2(trigger.new);
    }

    
}