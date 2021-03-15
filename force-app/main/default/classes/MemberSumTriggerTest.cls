@isTest
public class MemberSumTriggerTest {
@isTest
    public static void testTrigger(){
         Society__c testSoc=new Society__c();
        testSoc.Name='Some Name';
        testSoc.Reg_Code__c='12345';
        testSoc.Location__c='Some Location';
        testSoc.Formation_Year__c='2012';
        insert testSoc;
        
        Member__c memObj=new Member__c();
        memObj.Name='check';
        memObj.Society_Name__c=testSoc.id;
        insert memObj;
        Member__c memObj2=new Member__c();
        memObj2.Name='check2';
        memObj2.Society_Name__c=testSoc.id;
        insert memObj2;
        delete memObj2;
    }
  
    
}