@isTest
public class ConvertQuoteLineClassTest {
    
    private static testMethod void LeadConvertedTest()
    {
        Lead olead = new Lead(LastName='Test',FirstName='Tester',Status='Known',Company='test');
        insert olead;
        
         
        RL_QT_Quote__c RLQT=new RL_QT_Quote__c();
        RLQT.name='ajam';
        RLQT.Lead__c=olead.Id;
        insert RLQT;
        RL_QT_Quote_Line__c RLQTLine=new RL_QT_Quote_Line__c();
        RLQTLine.Prestation__c='LIVRAISON';
        RLQTLine.RL_QT_Quote__c=RLQT.id;
        RLQTLine.Colisage__c='check1';
        RLQTLine.RL_Service__c='TRANSPORT';
        RLQTLine.Temperature__c=5;
        RLQTLine.Produit__c='imtiaz';
        
        RL_QT_Quote_Line__c RLQTLine1=new RL_QT_Quote_Line__c();
        RLQTLine1.Prestation__c='Mise à disposition';
        RLQTLine1.RL_QT_Quote__c=RLQT.id;
        RLQTLine1.Colisage__c='check1';
        RLQTLine1.RL_Service__c='TRANSPORT';
        RLQTLine1.Temperature__c=5;
        RLQTLine1.Produit__c='imtiaz';
        
        RL_QT_Quote_Line__c RLQTLine2=new RL_QT_Quote_Line__c();
        RLQTLine2.Prestation__c='Picking';
        RLQTLine2.RL_QT_Quote__c=RLQT.id;
        RLQTLine2.Colisage__c='check1';
        RLQTLine2.RL_Service__c='TRANSPORT';
        RLQTLine2.Temperature__c=5;
        RLQTLine2.Produit__c='imtiaz';
        
        RL_QT_Quote_Line__c RLQTLine3=new RL_QT_Quote_Line__c();
        RLQTLine3.Prestation__c='LIVRA';
        RLQTLine3.RL_QT_Quote__c=RLQT.id;
        RLQTLine3.Colisage__c='check1';
        RLQTLine3.RL_Service__c='TRANSPORT';
        RLQTLine3.Temperature__c=5;
        RLQTLine3.Produit__c='imtiaz';
        
        List<RL_QT_Quote_Line__c> QuoteLines=new List<RL_QT_Quote_Line__c>();
        QuoteLines.add(RLQTLine);
        QuoteLines.add(RLQTLine1);
         QuoteLines.add(RLQTLine2);
        QuoteLines.add(RLQTLine3);
        insert QuoteLines;
    List <RL_Service_Detail__c> ServiceList = new List <RL_Service_Detail__c>();

        for (RL_QT_Quote_Line__c QuoteLine : QuoteLines) {  
            RL_Service_Detail__c service = new RL_Service_Detail__c();  
            if (QuoteLine.Prestation__c == 'LIVRAISON'){
                service.RL_Category__c = 'LIVRAISON';
                service.RL_Service__c = 'TRANSPORT';
                service.RL_Unit__c = QuoteLine.Colisage__c;
                service.Name = QuoteLine.Name;
                service.RL_Client__c = olead.ConvertedContactId;
                service.RL_Sub_category__c = QuoteLine.Temperature__c;
                ServiceList.add(service);                   
            }           
            else if (QuoteLine.Prestation__c == 'Mise à disposition'){
                service.RL_Category__c = 'MAD';
                service.RL_Service__c = 'TRANSPORT';
                service.RL_Unit__c = 'KILOMETRE' ;
                service.Name = service.Name;
                service.RL_Client__c = olead.ConvertedContactId;
                service.RL_Sub_category__c = QuoteLine.Temperature__c;
                ServiceList.add(service);           
            }   
            else if (QuoteLine.Prestation__c == 'Picking'){
                service.RL_Category__c = 'ENLEVEMENT';
                service.RL_Service__c = 'LOGISTIQUE';
                service.RL_Unit__c = QuoteLine.Produit__c;
                service.Name = service.Name;
                service.RL_Client__c = olead.ConvertedContactId;
                service.RL_Sub_category__c = QuoteLine.Temperature__c;
                ServiceList.add(service);         
            }
            else {
                service.RL_Category__c = QuoteLine.Prestation__c;
                service.RL_Service__c = 'LOGISTIQUE';   
                service.Name = service.Name;
                service.RL_Client__c = olead.ConvertedContactId;
                service.RL_Sub_category__c = QuoteLine.Temperature__c;
                service.RL_Unit__c = QuoteLine.Produit__c;
                ServiceList.add(service); 
            }  
        }
        
         if(ServiceList.size() > 0 ) {insert ServiceList;}  
    
        Database.LeadConvert lc = new database.LeadConvert();
        lc.setLeadId(olead.id);
        lc.setDoNotCreateOpportunity(false);
        lc.setConvertedStatus('Closed - Converted');
        
        Database.LeadConvertResult lcr = Database.convertLead(lc);
        System.assert(lcr.isSuccess());
        
        List<Id> Lists=new List<Id>();
        Lists.add(olead.id);
        
        Test.startTest();
        
        ConvertQuoteLineClass.ConvertQuoteLineToPricing(Lists);
        Test.stopTest();
        
        
        
    }
}




/*  @isTest 
static void ConvertQuoteLineToPricingTest() {
RL_QT_Quote__c Quote = TestDataFactory.createQuoteWithLead();
RL_QT_Quote_Line__c QuoteLine = TestDataFactory.createQuoteLineByQuote(Quote);
RL_Service_Detail__c service = new RL_Service_Detail__c(); 
Lead L = new Lead (LastName = 'Test data', Email = 'test@gmail.com', mobilephone = '+1234567890', Company = 'Test company');     
try{
insert L;
}
catch(Exception e){
string errormessage = e.getMessage();
}
List<Id> leadId = new List<Id>();
leadId.add(L.Id);
Test.startTest();
ConvertQuoteLineClass.ConvertQuoteLineToPricing(leadId);
Test.stopTest();
}
@TestSetup
static   void mytestclass()   

{     

Account a = new Account();     

a.Name = 'Test Account';         

insert a;   

Lead le=new Lead();
le.LastName='Ali';
le.Company='India';
le.Status='Working-Contacted';    

insert le;    
List<Id> idList = new List<Id>();   

idList.add(le.Id); 
System.debug(idList);   

Database.LeadConvert[] leadsToConvert = new Database.LeadConvert[0];       

Database.LeadConvert converter = new Database.LeadConvert();         

for (Id l : idList )

{             

converter.setLeadId(l);                //converter.setLeadId(l.id);                System.debug(1);               

account account = new account(name='test');               

insert account;               

converter.setAccountId(account.id);               

contact contact = new contact(firstname='test', lastname='test', accountid=account.id);               

insert contact;               

converter.setContactId(contact.id);                //converter.setOwnerId('00570000000oflK');                converter.setConvertedStatus('Closed - Converted');               

converter.setDoNotCreateOpportunity( true );               

leadsToConvert.add( converter );         

}       

Database.ConvertLead( leadsToConvert, true );            

}    



public static void ConvertQuoteLineToPricingTest(){
Account ac=new Account();
ac.Name='Imtiaz Khan';
insert ac;

Contact con=new contact();
con.lastname='khannn';
List<Lead> leadList=new List<Lead>();
for(integer i=0;i<5;i++){
Lead ld=new Lead();
ld.LastName='Ali';
ld.Company='India';
ld.Status='Working-Contacted';

leadList.add(ld);
}
insert leadList;


Database.LeadConvert lc = new Database.LeadConvert();
lc.setLeadId(leadList[0].id);
lc.setConvertedStatus('Converted to Prospect');
lc.setOpportunityName(leadList[0].Name);
Database.LeadConvertResult lcr = Database.ConvertLead(lc);



}

@isTest
public static void testing(){
lead ld= [SELECT Id, ConvertedAccountId, ConvertedContactId, ConvertedOpportunityId from lead limit 1];
system.debug('ld'+ld);
List<Id> Lists=new List<Id>();
Lists.add(ld.id);

Test.startTest();

ConvertQuoteLineClass.ConvertQuoteLineToPricing(Lists);
Test.stopTest();
}

*/