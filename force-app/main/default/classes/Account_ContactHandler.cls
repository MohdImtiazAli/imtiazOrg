public class Account_ContactHandler {

    public static void addcon(List<Account>Acc){
        List<Contact>Conlist=new list<Contact>();
        
        for(Account ac:Acc){
            for(integer i=0;i<ac.numberofemployees;i++){
                Contact con=new Contact();
                con.LastName='Default';
                con.AccountId=ac.id;
                Conlist.add(con);
            }
        }
        insert Conlist;
    }
    
    public static void AccountHandlerUpdate(List<Account>acc){
        list<Account>AccList=new List<Account>();
        AccList=[select id,NumberOfEmployees,(select id from contacts) from Account where id in: acc];
        List<Contact>addcon=new List<Contact>();
        List<Contact>deletecon=new List<Contact>();
        
        for(Account ac:AccList){
            if(ac.NumberOfEmployees>ac.Contacts.size()){
                Integer Makesize=ac.NumberOfEmployees-ac.Contacts.size();
                for(integer i=0;i<Makesize;i++){
                    Contact con=new Contact();
                    con.LastName='Default';
                    con.AccountId=ac.Id;
                    addcon.add(con);
                }
                
            }else if(ac.NumberOfEmployees<ac.Contacts.size()){
                Integer Makesize=ac.Contacts.size()-ac.NumberOfEmployees;
                for(integer i=0;i<Makesize;i++){
                    deletecon.add(ac.contacts[i]);
                }
            }
        }
        if(addcon.size()!=0){
            insert addcon;
        }
        if(deletecon.size()!=null){
            delete deletecon;
        }
    }
}