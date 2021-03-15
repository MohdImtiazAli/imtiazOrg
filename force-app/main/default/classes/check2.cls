public class check2 {
    
    public static void check(){
        List<Account> LA=new List<Account>();
        LA=[select name from Account];
        List<Contact> LC=new List<Contact>();
        LC=[select name,lastname,accountid from Contact where accountid in: LA];
        for(account ac:LA){
            integer x=0;
            for(contact con:LC){
                if((ac.id).equals(con.accountid))
                    x++;
                    }
            system.debug(ac.name+'have--->  '+x);
        }
        
    }
}