public class ex1_1 {

    public static void exx1(){
        Contact[] con=[select id,name from contact order by name];
        System.debug(con.size());
        System.debug(con);
        for(contact c:con){
            System.debug(c);
        }
    }
}