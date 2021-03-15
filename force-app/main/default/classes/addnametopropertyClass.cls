public class addnametopropertyClass {

    
    public static void add(){
        Property__c pr=new Property__c();
        pr.Address__c='new delhi';
        insert pr;
    }
}