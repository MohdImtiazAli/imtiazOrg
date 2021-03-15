public class ques10 {

    public static void question10(){
        User ur=[select Username,email,phone from user where id=:userinfo.getUserId()];
        system.debug(ur);
        
        /*or
        String name=userinfo.getName();
        String username=userinfo.getUserName();
        String email=userinfo.getUserEmail();
        User u=[Select phone from user where id=: userinfo.getUserId()];
        
        System.debug(Username+' '+email+' '+u);
         */
        
    }
}