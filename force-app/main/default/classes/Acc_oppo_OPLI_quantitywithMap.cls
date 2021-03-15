public class Acc_oppo_OPLI_quantitywithMap {
    public static void Oppor(){
        Map<Id,double> MapName=new Map<Id,double>();
        List<OpportunityLineItem> OLINE=new List<OpportunityLineItem>();
        OLINE=[select id,name,Opportunityid,Quantity from OpportunityLineItem];
        
        for(OpportunityLineItem oli:OLINE){
            if(!MapName.containsKey(oli.OpportunityId)){
                double quant=oli.Quantity;//5
                MapName.put(oli.OpportunityId,quant);
            }else{
                double quan=oli.Quantity;//6
                quan=quan+MapName.get(oli.OpportunityId);//5+6
                MapName.put(oli.OpportunityId,quan);
            }
        }
        
        for(Id id1:MapName.keySet()){
            system.debug('OpportunityID= '+id1+'------------------------>'+'sum of quantity= '+MapName.get(id1));
        }
        
        
       
        
        //for convert opportubity id into set id
        Set<Id> setId=new Set<Id>();
        for(OpportunityLineItem se:OLINE){
            setId.add(se.OpportunityId);
        }
        
         Map<Id,double> MapName2=new Map<Id,double>();
        
        List<Opportunity>OppList=[select id,name,Accountid from Opportunity where id IN: setId and Accountid!=null];
        
        for(Opportunity op:OppList){
            if(!MapName2.containsKey(op.AccountId)){
                MapName2.put(op.AccountId,MapName.get(op.Id));
            }else{
                double sumQuan=MapName.get(op.Id);
                sumQuan=sumQuan+MapName2.get(op.AccountId);
                MapName2.put(op.AccountId,sumQuan);
            }
        }
        
        for(id id2:MapName2.keySet()){
            System.debug('Accountid= '+id2+'     -------->TotalNumberOfQuantity= '+MapName2.get(id2));
        }
    }
}




        /* Map<Id,double> MapName=new Map<Id,double>();
        List<OpportunityLineItem> OLI=new List<OpportunityLineItem>();
                                  OLI=[select id,name,Opportunityid,Quantity from OpportunityLineItem ];
        
        for(OpportunityLineItem oo:OLI){
            system.debug(oo);
        }
        
        for(OpportunityLineItem O:OLI){
            if(!MapName.containsKey(o.OpportunityId)){
                double quan=o.Quantity;
                MapName.put(o.OpportunityId,quan);
            }else{
               double quan=o.Quantity;
                quan=quan+MapName.get(o.OpportunityId);
                MapName.put(o.OpportunityId,quan); 
            }
        }
        system.debug('**************************************************************************************');
        for(Id id1:MapName.keySet()){
            system.debug('Opportunity id=---> '+id1+'---------------->'+'sum Of Quantity'+MapName.get(id1));
        }
        
        
        
        
        
        
        Map<Id,List<Opportunity>> MapName=new Map<Id,List<Opportunity>>();
        
        List<Opportunity>Olist=[select id,name,accountid from Opportunity where accountid!=null];
        system.debug(Olist.size());
        for(Opportunity o:Olist){
            system.debug(o);
        }
        
        for(Opportunity op:Olist){
            if(!MapName.containsKey(op.accountid)){
                List<Opportunity>opp=new list<Opportunity>();
                opp.add(op);
                MapName.put(op.accountid,opp);
            }else{
                 List<Opportunity>opp=MapName.get(op.accountid);
                opp.add(op);
                MapName.put(op.accountid,opp);
            }
        }
        
        for(id id1:MapName.keySet()){
            System.debug('accountid='+id1+'-------->'+'Number of opportuntiy='+MapName.get(id1));
        }*/