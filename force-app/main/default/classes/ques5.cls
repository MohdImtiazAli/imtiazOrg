public class ques5 {

    public static void question5(){
       List<Contact> CL=[select lastname from Contact where account.name like '%a%' limit 10];
      // list<contact> cl= [select lastname from contact where account.name like '%eepa%'];
        for(Contact c:CL){
            System.debug(c);
        }
        delete CL;
    }
}