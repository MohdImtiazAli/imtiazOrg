public class example4ContactHandler {
    public static void example(List<Contact>contactList){
        
        for(Contact con:contactList ){
            if(con.Email==null){
                con.addError('You must enter your email');
            }
        }
       
    }
}