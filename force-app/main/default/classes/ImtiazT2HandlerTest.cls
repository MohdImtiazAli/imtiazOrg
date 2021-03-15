@isTest
public class ImtiazT2HandlerTest {
   @isTest static void Imtiaz(){
        List<Agreement__c> newAgreeMentList=new List<Agreement__c>();
        for(integer i=0;i<2;i++){
            Agreement__c agr=new Agreement__c();
            agr.Name='agree'+i;
            agr.Duration__c='3';
            newAgreeMentList.add(agr);
        }
         insert newAgreeMentList;
    }
    
    
}