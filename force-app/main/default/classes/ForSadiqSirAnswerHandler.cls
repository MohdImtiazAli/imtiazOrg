public class ForSadiqSirAnswerHandler {
    
    @AuraEnabled
    public static List<String> forPickList(){
        
        Schema.DescribeFieldResult pickListField = Opportunity.StageName.getDescribe();
        system.debug('pickListField:'+pickListField);
        List<Schema.PicklistEntry> forPickListValues = pickListField.getPicklistValues();
        system.debug('forPickListValues: '+forPickListValues);
        List<String> pickList1=new List<String>();
        List<SelectOption> forOption=new List<SelectOption>();
        for(Schema.PicklistEntry fld:forPickListValues){
            forOption.add(new SelectOption(fld.getLabel(),fld.getValue()));
            pickList1.add(fld.getValue());
        }
        
        List<String> pickList=new List<String>();
        for(SelectOption sp:forOption){
            pickList.add(sp.getValue());
        }
        system.debug('pickList: '+pickList);
        system.debug('pickList: '+pickList1);
        return pickList1;
    }
    
    @AuraEnabled
    public static void forSaveOpportunityInAccount(List<Opportunity> OpportunityList,String Acid){
        for(Opportunity op:OpportunityList){
            op.accountid=Acid;
        }
        insert OpportunityList;
            }
}