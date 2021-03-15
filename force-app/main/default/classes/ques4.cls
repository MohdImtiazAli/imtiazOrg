public class ques4 {
    public static void question4(){
        List<Product2> PL=new List<Product2>();
        for(integer i=1;i<=10;i++){
        Product2 pr=new Product2();
        pr.Name='Burger And Pizza'+i;
        pr.Description='Delicious'+i;
        pr.Family='None';
            PL.add(pr);  
        }
        insert PL;
        
        for(Product2 p:PL){
            System.debug(p);
        }
    }
}