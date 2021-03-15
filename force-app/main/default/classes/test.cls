public class test {

    public static void forTest(){
        testing__c testObj=new testing__c();
        testObj.Name='Imtiaz Khan Ali';
        testObj.EndDate__c=Date.today();
        testObj.SetupOwnerId=UserInfo.getProfileId();
        insert testObj;
    }
}