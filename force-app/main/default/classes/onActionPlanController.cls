public class onActionPlanController {
    public static void moveTaskToActionPlan(List<ActionPlan__c> actionPlanList){
        set<Id> templateIds=new set<Id>();
        for(ActionPlan__c apt:actionPlanList){
            templateIds.add(apt.Action_Plan_Template__c);
}
        system.debug('templateIds '+templateIds);
        
        
     List<APTTaskTemplate__c>	aptTaskTemplateList=new List<APTTaskTemplate__c>();
        aptTaskTemplateList=[select id,Action_Plan_Template__c  from APTTaskTemplate__c where Action_Plan_Template__c in:templateIds];
        system.debug('aptTaskTemplateList '+aptTaskTemplateList);
        
       map<Id,APTTaskTemplate__c> aptTaskTemplateMap=new map<Id,APTTaskTemplate__c>();
          //  APTaskTemplate__c aptObj=new APTaskTemplate__c();
          //  aptObj.Action_Plan__c=actionPlanList[0].id;
            
          //  APTaskTemplateList.add(aptObj);   
        
           /*
        List<ActionPlanTemplate__c> ActionPlanTemplateList=new List<ActionPlanTemplate__c>();
        ActionPlanTemplateList=[select id from ActionPlanTemplate__c ];
        List<APTaskTemplate__c> APTaskTemplateList=new List<APTaskTemplate__c>();
        for(APTTaskTemplate__c apt:APTTaskTemplateList){
            APTaskTemplate__c aptObj=new APTaskTemplate__c();
            aptObj.Action_Plan__c=actionPlanList[0].id;
            APTaskTemplateList.add(aptObj);   
        }
        if(APTaskTemplateList.size()>0){
            insert APTaskTemplateList;
        }
        
        
        /*
List<APTaskTemplate__c> APTaskTemplateList=new List<APTaskTemplate__c>();
for(APTTaskTemplate__c APTT:APTTaskTemplateList){
for(ActionPlanTemplate__c apt:ActionPlanTemplateList){
if(APTT.Action_Plan_Template__c==apt.id) 
APTaskTemplate__c aptObj=new APTaskTemplate__c();

}
}*/
        /*
List<ActionPlanTemplate__c> ActionPlanTemplateList1=new List<ActionPlanTemplate__c>();
ActionPlanTemplateList1=[select id from ActionPlanTemplate__c];
system.debug('ActionPlanTemplateList= '+ActionPlanTemplateList);
set<Id> setId1=new set<Id>();
for(ActionPlanTemplate__c apt:ActionPlanTemplateList1){
setId1.add(apt);
}
List<APTaskTemplate__c> APTaskTemplateList=new List<APTaskTemplate__c>();
for(ActionPlanTemplate__c ap:ActionPlanTemplateList){
for(ActionPlanTemplate__c ap1:ActionPlanTemplateList1){
if(ap.id==ap1.id){

}
}
}
if(APTaskTemplateList.size()>0){
insert APTaskTemplateList;
}*/
        /*  set<Action_Plan_Template__c> ActionPlanTemplateSet=new set<Action_Plan_Template__c>();
for(ActionPlanTemplate__c APT:ActionPlanTemplateList){
ActionPlanTemplateSet.add(Action_Plan_Template__c);
}

List<APTTaskTemplate__c> APTTaskTemplateList=new List<APTTaskTemplate__c>();
APTTaskTemplateList=[select id  from APTTaskTemplate__c   ];


List<APTaskTemplate__c> APTaskTemplateList=new List<APTaskTemplate__c>();

*/
    }
}