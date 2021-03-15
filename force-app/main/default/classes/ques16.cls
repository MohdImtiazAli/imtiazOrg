public class ques16 {

    public static void question16(){        
        // ctreate cudtom pricebook
        Pricebook2 pb=new pricebook2();
         pb.Name='Algo Price book';
         pb.Description='You have to solve all scripts question';
         pb.IsActive=true;
        insert pb;
        
        //create standard pricebook
        Pricebook2 pbstandard=[select id from Pricebook2 where isstandard=true];
      
        
        List<Product2> PL=new List<Product2>();
        for(integer i=0;i<10;i++){
             Product2 pd=new Product2();
             Id pdtid=pd.Id;
             pd.name='Samsung'+i;
             PL.add(pd);
        }
        insert PL;
        
        //insert into satnadard
      List<PricebookEntry> spbe=new List<PricebookEntry>();
        for(Product2 pp:PL){
              PricebookEntry pbe=new PricebookEntry();
              pbe.Product2Id=pp.id;
              pbe.Pricebook2Id=pbstandard.id;
              pbe.UnitPrice=10000;  
            spbe.add(pbe);
        }
        insert spbe;
        
        //insert into custom
         List<PricebookEntry> cpbe=new List<PricebookEntry>();
        for(Product2 pp:PL){
              PricebookEntry pbe=new PricebookEntry();
              pbe.Product2Id=pp.id;
              pbe.Pricebook2Id=pb.Id;
              pbe.UnitPrice=9000;//1000discount so 10000-9000  
              cpbe.add(pbe);
        }
        insert cpbe;
             
        
    }
}