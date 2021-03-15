public class ques15 {

    public static void question15(){
        List<Product2> LP=[select 	Name from Product2 where description like '%a%'];
        for(Product2 p:LP){
            System.debug(p.name);
        }
    }
}