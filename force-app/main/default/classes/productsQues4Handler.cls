public class productsQues4Handler {

    public static void productHandler(List<Product2> productList){
        list<Pricebook2> standardPricebookList=new List<Pricebook2>();
        standardPricebookList=[select id from Pricebook2 where isStandard=true limit 1];
        
         list<PricebookEntry> newPricebookEntryList=new List<PricebookEntry>();
        for(Product2 pd:productList){
            PricebookEntry pbe=new PricebookEntry();
            pbe.Pricebook2Id=standardPricebookList[0].id;
            pbe.Product2Id=pd.Id;
            pbe.UnitPrice=1;
            pbe.IsActive=true;
            newPricebookEntryList.add(pbe);
        }
      insert newPricebookEntryList;

    }
}