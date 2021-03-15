public class SalesforceHubspotIntegrationWithoutVF {
    public SalesforceHubspotIntegrationWithoutVF(ApexPages.StandardSetController controller){}
    public static void getHubspotContacts(){
        ResponseWrapper responseWrap;
        
        Map<String,String> headersMap=new Map<String,String>();
        headersMap.put('accept','application/json');
        
        HubSpot_Integration__c HubspotSetting = HubSpot_Integration__c.getInstance();
        system.debug('Api Key=> '+HubspotSetting.API_Key__c);
        system.debug('Endpoint Url=> '+HubspotSetting.Endpoint_URL__c);
        String requestUrl=HubspotSetting.Endpoint_URL__c+'?limit=10&archived=false&hapikey='+HubspotSetting.API_Key__c;
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        // request.setEndpoint('https://api.hubapi.com/crm/v3/objects/contacts?limit=10&archived=false&hapikey=a71a16e0-8226-4292-a814-08b03ece5adb');
        request.setEndpoint(requestUrl);
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        
        system.debug('response: '+response);
        // If the request is successful, parse the JSON response.
        List<Contact> contactList=new List<Contact>();
        if (response.getStatusCode() == 200) {
            // Deserialize the JSON string into collections of primitive data types.
            Map<String, Object> resultData = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            
            
            system.debug('resultData '+resultData);
            List<Object> insideData = (List<Object>) resultData.get('results');
            for(integer i=0;i<insideData.size();i++){
                Map<String, Object> inner_Data = (Map<String, Object>)insideData[i];
                System.debug('insideData: '+insideData);
                Map<String, Object> inner_Data_request = (Map<String, Object>)inner_Data.get('properties');
                
                Contact newContact=new Contact();
                newContact.FirstName=string.valueOf(inner_Data_request.get('firstname'));
                newContact.LastName=string.valueOf(inner_Data_request.get('lastname'));
                newContact.Email=string.valueOf(inner_Data_request.get('email'));
                contactList.add(newContact);
                
            }
            
            
        }
        system.debug('contactList '+contactList);
        if(contactList.size()>0){
            insert contactList;
        }
        
        
    }
}