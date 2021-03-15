public class q7Opportunity {

    public static void Opportunityclosed(List<Opportunity> NewOpportunityList2,List<opportunity> newList){
        
       List<Opportunity> NewOpportunityList=[select id,name,StageName from Opportunity where StageName='closed won' AND ID IN:NewOpportunityList2];
        
        map<Id,Integer>MapName=new Map<Id,Integer>();
       
        List<OpportunityLineItem>opli=new List<OpportunityLineItem>();
        opli=[select id,opportunityid from OpportunityLineItem];
        
        for(OpportunityLineItem opl:opli){
            if(!MapName.containsKey(opl.OpportunityId)){
                mapName.put(opl.OpportunityId,1);
            }else{
                integer i=mapName.get(opl.OpportunityId);
                i++;
                mapName.put(opl.OpportunityId,i);
            }
        }
        for(opportunity op:newList){
            if(!MapName.containsKey(op.id)){
                op.addError('there is no opportunity line item');
            }
        }
    }
}

/*
 * or                               or                                         or                             or
 * trigger q7Opportunity on Opportunity (after update,before update) {
    if(trigger.isbefore && trigger.isUpdate){
        q7Opportunity.Opportunityclosed(trigger.old,trigger.new);
    }
    
}

public class q7Opportunity {

    public static void Opportunityclosed(List<Opportunity> NewOpportunityList2,List<opportunity> newList){
        
       List<Opportunity> NewOpportunityList=[select id,name,StageName from Opportunity where StageName='closed won' AND ID IN:NewOpportunityList2];
        
        map<Id,Integer>MapName=new Map<Id,Integer>();
       
        List<OpportunityLineItem>opli=new List<OpportunityLineItem>();
        opli=[select id,opportunityid from OpportunityLineItem];
        
        for(Opportunity op:NewOpportunityList){
            for(OpportunityLineItem opl:opli){
                if(op.Id==opl.OpportunityId){
                    if(!MapName.containsKey(op.Id)){
                        MapName.put(op.Id,1);
                    }else{
                        integer i=MapName.get(op.Id);
                        i++;
                        MapName.put(op.id,i);
                    }
                } 
            }
        }
        
        for(Opportunity op:newList){
            if(!MapName.containsKey(op.id)){
                System.debug('on matching condtion');
                op.adderror('there is no opportunity line item');
            }
            else
            {
             system.debug('Else condition');
            }
        }
    }
}
 * 
 * */