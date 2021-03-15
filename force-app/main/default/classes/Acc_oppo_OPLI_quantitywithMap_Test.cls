@isTest
public class Acc_oppo_OPLI_quantitywithMap_Test {
    @TestSetup static void count(){
        Account ac=new Account();
        ac.name='imtiaz ali';
        insert ac;
        List<Product2> productList=new List<Product2>();
        for(integer i=0;i<5;i++){
            Product2 pd=new Product2();
            pd.name='chasma'+i;
            pd.IsActive=true;
            productList.add(pd);
        }
        insert productList;
        
        Pricebook2 Pbstandard=new Pricebook2();
        Pbstandard.id=Test.getStandardPricebookId();
        Pbstandard.IsActive=true;
        update Pbstandard;//to make isStandard true you have to update it
        
        List<PriceBookEntry> sPBE=new List<PriceBookEntry>();
        for(Product2 pd:productList){
            PriceBookEntry StandardPBE=new PriceBookEntry();
            StandardPBE.Product2Id=pd.id;
            StandardPBE.Pricebook2Id=Pbstandard.id;
            StandardPBE.IsActive=true;
            StandardPBE.UnitPrice=100;
            sPBE.add(StandardPBE);
        }
        insert sPBE;
        
        Pricebook2 PbCustem=new Pricebook2();
        PbCustem.Name='Book';
        PbCustem.IsActive=true;
        insert PbCustem;
        List<PriceBookEntry> cPBE=new List<PriceBookEntry>();
        for(Product2 pd:productList){
            PriceBookEntry ctandardPBE=new PriceBookEntry();
            ctandardPBE.Product2Id=pd.id;
            ctandardPBE.Pricebook2Id=PbCustem.id;
            ctandardPBE.IsActive=true;
            ctandardPBE.UnitPrice=100;
            cPBE.add(ctandardPBE);
        }
        insert cPBE;
        
        List<Opportunity> opList=new List<Opportunity>();
        for(integer i=0;i<2;i++){
             Opportunity op=new Opportunity();
        
        op.Name='Wings of Fire'+i;
        op.CloseDate=system.today();
        op.StageName='Qualification';
        op.AccountId=ac.id;
            opList.add(op);
            Opportunity op1=new Opportunity();
        
        op1.Name='Wings of Fire'+i;
        op1.CloseDate=system.today();
        op1.StageName='Qualification';
            op1.AccountId=ac.id;
            opList.add(op1);
        }
       
        insert opList;
         List<OpportunityLineItem> opliList=new List<OpportunityLineItem>();
        for(Opportunity op:opList){
            OpportunityLineItem opli=new OpportunityLineItem();
            opli.PricebookEntryId=cPBE[0].id;
            opli.OpportunityId=op.id;
            opli.Product2Id=productList[0].id;
            opli.Quantity=5;
            opli.UnitPrice=500;
            opliList.add(opli);
            OpportunityLineItem opli1=new OpportunityLineItem();
            opli1.PricebookEntryId=cPBE[0].id;
            opli1.OpportunityId=op.id;
            opli1.Product2Id=productList[0].id;
            opli1.Quantity=5;
            opli1.UnitPrice=500;
            opliList.add(opli1);
        }
        insert opliList;
    } 
    
    @isTest
    public static void methods(){
        test.startTest();
        Acc_oppo_OPLI_quantitywithMap.Oppor();
        test.startTest();
    }
}