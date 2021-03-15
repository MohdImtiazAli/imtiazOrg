public class ques20 {

    public static void question(){
         Account ac=new Account();
        ac.Name='Rohan khannna';
        insert ac;
        
     
          Contact con=new Contact();
        con.LastName='Khannna';
        con.AccountId=ac.Id;
        insert con;
        
        List<Case> CL=new List<Case>();
        for(integer i=0;i<5;i++){
        Case cas=new Case();
        cas.AccountId=ac.id;
        cas.ContactId=con.Id;
        cas.SuppliedEmail='bhagwanChaudhary@gmail.com'+i;
        cas.Status='N';
            CL.add(cas);
    }
        insert CL;
    }
}