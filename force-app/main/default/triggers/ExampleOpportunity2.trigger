trigger ExampleOpportunity2 on Opportunity (after insert) {
 
    if(trigger.isAfter){
        if(trigger.isInsert){
            Contact con=new Contact();
            for(Opportunity op:trigger.new){
                con.AccountId=op.AccountId;
                con.LastName='Opportunity';
                insert con;
            }
        }
    }
}