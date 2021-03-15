@isTest
public class Page1_ControllerTest {
    
    @istest public static void testSaveSociety(){
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
        
        test.startTest();
        Page1_Controller page1=new Page1_Controller();
        page1.save();
        page1.processSelected();
        page1.addMembers();
        page1.addSecretary();
        test.stopTest();
        
    }
    
}