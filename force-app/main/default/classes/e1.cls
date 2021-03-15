public class e1 {
//Execute SOQL and SOSL Queries for practice
    public static void ex1(){
        Contact c1=new Contact();
        c1.LastName='khan';
        c1.Department='cloud computing';
        c1.Phone='8585123456';
        c1.Email='abc@gmail.com';
        insert c1;
        System.debug(c1);
        
        
        Contact c2=new Contact(
        LastName='kumar',
        AssistantName='ali',
            email='abc@gmail.com');
        insert c2;
        System.debug(c2);
    }
}