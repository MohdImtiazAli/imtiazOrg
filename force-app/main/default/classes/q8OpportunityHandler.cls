public class q8OpportunityHandler {

    public static void onOpportunity(List<Opportunity> newOpportunityList){
        system.debug('newOpportunityList=== '+newOpportunityList);
   
        List<Opportunity>OpportunityList=new List<Opportunity>();
        OpportunityList=[select id,stageName from Opportunity where stageName='closed won' and id in: newOpportunityList];
        
        system.debug('OpportunityList'+OpportunityList);
        List<OpportunityLineItem> OPLI=new List<OpportunityLineItem>();
        OPLI=[select id,name,opportunityid,product2id from OpportunityLineItem where opportunityid in: OpportunityList];
        system.debug('opli'+OPLI);
        
         
        set<id> s1 = new set<id>();
        for(OpportunityLineItem o1:opli )
        {  s1.add(o1.product2id); }
            
        List<Product2> ProductList=new List<Product2>();
       ProductList=[select id,name,No_Of_Products_Sold__c from Product2 where id in: s1];
      
        system.debug(ProductList);
         FOR(OpportunityLineItem o:OPLI){
            SYSTEM.debug('opli'+o);
        }
        
        FOR(Product2 PDS:ProductList){
            SYSTEM.debug('PDS'+pds);
        }
         List<Product2> ProductList2=new List<Product2>();
        for(Product2 pd:ProductList){
            integer i=0;
        for(OpportunityLineItem opl:OPLI){
            if(pd.Id==opl.Product2Id){
                i++;    }
        }     
             
            pd.No_Of_Products_Sold__c=i;
            ProductList2.add(pd);
           
        }
        update ProductList2;

    }
    
    public static void onOpportunity1(List<Opportunity> newOpportunityList){
        system.debug('newOpportunityList=== '+newOpportunityList);
   
        List<Opportunity>OpportunityList=new List<Opportunity>();
        OpportunityList=[select id,stageName from Opportunity where stageName='closed won' and id in: newOpportunityList];
        
        system.debug('OpportunityList'+OpportunityList);
        List<OpportunityLineItem> OPLI=new List<OpportunityLineItem>();
        OPLI=[select id,name,opportunityid,product2id from OpportunityLineItem where product2id!=null and opportunityid in: OpportunityList];
        system.debug('OPLI'+OPLI);
        
        
        
        map<id,integer> mapName=new map<id,integer>();
        integer i=0;
        for(OpportunityLineItem opl:OPLI){
            if(!mapName.containsKey(opl.Product2Id)){
                mapName.put(opl.product2id,1);
            }else{
                integer count=mapName.get(opl.product2id);
                count++;
                mapName.put(opl.product2id,count);
            }
                
        }
        set<id> s1 = new set<id>();
        for(OpportunityLineItem o1:opli )
        {  s1.add(o1.product2id); }
            
        List<Product2> ProductList=new List<Product2>();
       ProductList=[select id,name,No_Of_Products_Sold__c from Product2 where id in: s1];
        for(Product2 pd:ProductList){
            if(mapName.containskey(pd.id)){
                pd.No_Of_Products_Sold__c=mapName.get(pd.id);
            }
        }
        update ProductList;
         
    }
}