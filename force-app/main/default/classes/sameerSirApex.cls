public class sameerSirApex {
      @AuraEnabled
    public static Contact forContact(String FN,String LN,String Eml,String Phn){
        
        Contact con=new Contact();
        con.FirstName=FN;
        con.LastName=LN;
        con.Email=Eml;
        con.Phone=Phn;
        insert con;
        return con;
    }
}