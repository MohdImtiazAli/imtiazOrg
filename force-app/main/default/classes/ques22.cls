public class ques22 {

    public static void question22(){
        try{
        
       
          Product2 PD2=new Product2();
          PD2.Name='DreamMannat';
          
        insert PD2;
        
           //System.debug('product='+PD2.Name);
       
        Pricebook2 PB2=new Pricebook2();
       // System.debug(PB2.Id);
        PB2.Name='MyDreamHouse';
        PB2.IsActive=true;
        insert PB2;
        //System.debug('Pricebook2='+ PB2.Name);
        
        Pricebook2 PB2standard=[select id from pricebook2 where isstandard=true];
        //send first in standard pricebook
         PricebookEntry PBEstan=new PricebookEntry();
        PBEstan.Pricebook2Id=PB2standard.id;
        PBEstan.Product2Id=PD2.Id;
        PBEstan.UnitPrice=10000000;
        PBEstan.IsActive=true;
       
        insert PBEstan;
       // System.debug('Pricebook2PB2standard='+ PB2standard.id);
        
        //THEN INSERT INTO CUSTOMPRICEBOOK 
        PricebookEntry PBE=new PricebookEntry();
        PBE.Pricebook2Id=PB2.Id;
        PBE.Product2Id=PD2.Id;
        PBE.UnitPrice=10000000;
        PBE.IsActive=TRUE;
        insert PBE;
      //  System.debug('PricebookEntry='+ PBE);
        
       
        
        
        
         Opportunity op=new opportunity();
        op.CloseDate=Date.newInstance(2020, 11, 20);
        op.Name='DreamHouseSHAHRUKH';
        op.StageName='Q';
        insert op;
       // System.debug('Opportunity'+op );
        
          OpportunityLineItem OPLI=new OpportunityLineItem();
        OPLI.OpportunityId=op.Id;
        OPLI.PricebookEntryId=PBE.Id;
        OPLI.Product2Id=PD2.Id;
        OPLI.UnitPrice=10000000;
        OPLI.Quantity=10;
        insert OPLI;
       //  System.debug('OpportunityLineItem='+ OPLI);
        
        
         //insert op;
       // clone(preserveId, isDeepClone, preserveReadonlyTimestamps, preserveAutonumber);
     
      
        boolean preserveId=false;
        boolean isDeepClone=true;
        boolean preserveReadonlyTimestamps=true;
        boolean preserveAutonumber=true;
        Opportunity opp=op.clone(preserveId,isDeepClone,preserveReadonlyTimestamps,preserveAutonumber);
        opp.Name='DreamHouseSHAHRUKH'+'clone';
        opp.CloseDate=op.CloseDate.addDays(30);
        insert opp;
       // System.debug(opp);
        
          OpportunityLineItem OCLON=new OpportunityLineItem();
        OCLON.OpportunityId=opp.Id;
        OCLON.PricebookEntryId=PBE.Id;
        OCLON.Product2Id=PD2.Id;
        OCLON.UnitPrice=10000000;
        OCLON.Quantity=10;
        insert OCLON;
        }
        catch(exception e){
            System.debug(e);
        }
    }
}