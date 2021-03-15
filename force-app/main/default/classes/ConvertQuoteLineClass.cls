public class ConvertQuoteLineClass {
    @InvocableMethod(label='Insert service' description='Inserts service when lead is converted.' )
    public static void ConvertQuoteLineToPricing(List<Id> leadId) {
        Lead Leads = [Select Id,ConvertedContactId,ConvertedAccountId from lead  where Id in : leadId];
        List <RL_QT_Quote__c> Quotes = [Select Id from RL_QT_Quote__c where Lead__c in : leadId];
        List<RL_QT_Quote_Line__c> QuoteLines = [Select Id,Prestation__c,Colisage__c,RL_Service__c,RL_Date__c,Temperature__c,Produit__c,PriceAfterDiscount__c from RL_QT_Quote_Line__c where RL_QT_Quote__c in: Quotes];
        List <RL_Service_Detail__c> ServiceList = new List <RL_Service_Detail__c>();
        for (RL_QT_Quote_Line__c QuoteLine : QuoteLines) {  
            RL_Service_Detail__c service = new RL_Service_Detail__c();  
            if (QuoteLine.Prestation__c == 'LIVRAISON'){
                service.RL_Category__c = 'LIVRAISON';
                service.RL_Service__c = 'TRANSPORT';
                service.RL_Unit__c = QuoteLine.Colisage__c;
                service.Name = service.Name;
                service.RL_Client__c = Leads.ConvertedContactId;
                service.RL_Sub_category__c = QuoteLine.Temperature__c;
                ServiceList.add(service);                   
            }           
            else if (QuoteLine.Prestation__c == 'Mise à disposition'){
                service.RL_Category__c = 'MAD';
                service.RL_Service__c = 'TRANSPORT';
                service.RL_Unit__c = 'KILOMETRE' ;
                service.Name = service.Name;
                service.RL_Client__c = Leads.ConvertedContactId;
                service.RL_Sub_category__c = QuoteLine.Temperature__c;
                ServiceList.add(service);           
            }   
            else if (QuoteLine.Prestation__c == 'Picking'){
                service.RL_Category__c = 'ENLEVEMENT';
                service.RL_Service__c = 'LOGISTIQUE';
                service.RL_Unit__c = QuoteLine.Produit__c;
                service.Name = service.Name;
                service.RL_Client__c = Leads.ConvertedContactId;
                service.RL_Sub_category__c = QuoteLine.Temperature__c;
                ServiceList.add(service);         
            }
            else {
                service.RL_Category__c = QuoteLine.Prestation__c;
                service.RL_Service__c = 'LOGISTIQUE';   
                service.Name = service.Name;
                service.RL_Client__c = Leads.ConvertedContactId;
                service.RL_Sub_category__c = QuoteLine.Temperature__c;
                service.RL_Unit__c = QuoteLine.Produit__c;
                ServiceList.add(service); 
            }  
        }
        if(ServiceList.size() > 0 ) {insert ServiceList;}  }
}