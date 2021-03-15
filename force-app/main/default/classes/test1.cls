public class test1 {

    public static void forCheck(){
Id batch=database.executeBatch(new BatchClassExample2());
    }
    public static void check(List<Contact> accountListTest){
       
        system.debug('accountListTest:: '+accountListTest);
        //Id batchInstanceId = Database.executeBatch(new BatchClassExample1('ab')); 
    }
}