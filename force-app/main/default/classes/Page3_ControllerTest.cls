@isTest
public class Page3_ControllerTest {
    @isTest
    public static void page3(){
        Society__c testSoc=new Society__c();
        testSoc.Name='Some Name';
        testSoc.Reg_Code__c='12345';
        testSoc.Location__c='Some Location';
        testSoc.Formation_Year__c='2012';
        insert testSoc;
        
        Member__c memberNameObj=new Member__c();
        memberNameObj.Name='John';
        memberNameObj.Email__c='abc@gmail.com';
        insert memberNameObj;
        
        
        Due__c dueObj=new Due__c();
        dueObj.Name='check';
        dueObj.year__c=string.valueOf(Date.today().Year());    //'2021' 
        dueObj.month__c=string.valueOf(Date.today().Month());     //'1';
        dueObj.Society_Name__c=testSoc.id;
        dueObj.member_name__c=memberNameObj.Id;
        dueObj.dues_remaining__c=1000;
        insert dueObj;
        
        Due__c dueObj1=new Due__c();
        dueObj1.Name='check1';
        dueObj1.year__c=string.valueOf(Date.today().Year());    //'2021' 
        dueObj1.month__c=string.valueOf(Date.today().Month());     //'1';
        dueObj1.dues_remaining__c=1000;
        dueObj1.Society_Name__c=testSoc.id;
        dueObj1.member_name__c=memberNameObj.Id;
        insert dueObj1;
        
        
        
        test.startTest();
        Page3_Controller page3Obj=new Page3_Controller();
        page3Obj.selectedSociety=testSoc.id;
        page3Obj.selectedYear=string.valueOf(Date.today().Year());
        page3Obj.selectedMonth=string.valueOf(Date.today().Month());
        
        page3Obj.showRecords();
        page3Obj.addDues();
        page3Obj.add();
        page3Obj.sendReminderEmail();
        test.stopTest();
        
    }
}