public class objectClass {

    public static void object(){
        Account ac=new Account();
        ac.Name='imtiyaz';
        insert ac;
        System.debug(ac);
          System.debug(ac.name);
        
        
        
        Contact cc=new Contact(lastname='arya',firstname='Manuj');
        System.debug(cc);
        System.debug(cc.lastname);
    }
}