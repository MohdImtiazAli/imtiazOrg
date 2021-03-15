public class QB_HelloWorldController {
    public static String statusMessage {
        get { return statusMessage; }
        set { statusMessage = value; }
    }
    
    public static String baseURL {
        get { return baseURL; }
        set { baseURL = value; }
    }
    
    public static PageReference connectToQuickbooks () {
        try {
            
            Sample_App_Info__c metadataInfo = [SELECT Client_ID__c, Client_Secret__c, Auth_URL__c, Callback_URL__c FROM Sample_App_Info__c];
            String clientId = metadataInfo.Client_ID__c;
            String callbackUrl = metadataInfo.Callback_URL__c;   
            String authEndpoint = metadataInfo.Auth_URL__c;
            String scope = 'com.intuit.quickbooks.accounting';
            
            String endPoint = authEndpoint + '?client_id=' + clientId + '&state=1234&response_type=code&scope=' +scope+ '&redirect_uri=' + callbackUrl;
            PageReference pageRef = new PageReference(endPoint);
            return pageRef;
        }
        catch(System.Exception e){
            System.debug('Exception found in class QB_HelloWorldController method connectToQuickbooks ' + e.getMessage());
            System.debug('Exception found in class QB_HelloWorldController method connectToQuickbooks ' + e.getLineNumber());
            statusMessage = 'Exception: ' + e.getMessage();
            return null;
        } 
    }
    
    public static HttpResponse makeHttpGetRequest (String endPointPath) {
        Sample_App_Info__c urlInfo = [SELECT Base_URL__c FROM Sample_App_Info__c];
        baseURL = urlInfo.Base_URL__c;
        
        API_Token__c apiToken = [Select Access_Token__c, Realm_ID__c from API_Token__c ORDER BY LastModifiedDate DESC limit 1];
        String accessToken = apiToken.Access_Token__c ;
        String realmId = apiToken.Realm_ID__c;
        
        String errorMessage ='';
        String endPoint = 'https://sandbox-quickbooks.api.intuit.com/v3/company/4620816365157599930/account/1?minorversion=55';//this is for get an account for read by id
        // String endPoint = 'https://sandbox-quickbooks.api.intuit.com/v3/company/4620816365157599930/account?minorversion=55';///for post
        
        
        HttpRequest httpReq = new HttpRequest();
        HttpResponse httpRes = new HttpResponse();
        Http http = new Http();
        httpReq.setMethod('GET');
        httpReq.setEndPoint(endPoint);
        httpReq.setHeader('Authorization' , 'Bearer ' + accessToken);
        httpReq.setHeader('Accept' , 'application/json');
        
        try{
            
            httpRes = http.send(httpReq);
            system.debug('httpRes:: '+httpRes);
            system.debug('httpRes:: '+httpRes.getBody());
        }
        catch(System.Exception e){
            System.debug('Exception found in class QB_HelloWorldController method connectToQuickbooks ' + e.getMessage());
            System.debug('Exception found in class QB_HelloWorldController method connectToQuickbooks ' + e.getLineNumber());
        } 
        return httpRes;
    }
    
    public static HttpResponse makeHttpPostRequest (String endPointPath, String jsonPayload) {
        Sample_App_Info__c urlInfo = [SELECT Base_URL__c FROM Sample_App_Info__c];
        baseURL = urlInfo.Base_URL__c;
        
        API_Token__c apiToken = [Select Access_Token__c, Realm_ID__c from API_Token__c ORDER BY LastModifiedDate DESC limit 1];
        String accessToken = apiToken.Access_Token__c ;
        String realmId = apiToken.Realm_ID__c;
      //  https://sandbox-quickbooks.api.intuit.com/v3/company/4620816365157599930/customer/1?minorversion=55
        String errorMessage ='';
        String endPoint ='https://sandbox-quickbooks.api.intuit.com/v3/company/4620816365157599930/account?minorversion=55';
        HttpRequest httpReq = new HttpRequest();
        HttpResponse httpRes = new HttpResponse();
        Http http = new Http();
        httpReq.setMethod('POST');
        httpReq.setEndPoint(endPoint);
        httpReq.setHeader('Authorization' , 'Bearer ' + accessToken);
        httpReq.setHeader('Accept' , 'application/json');
        httpReq.setHeader('Content-Type' , 'application/json');
        httpReq.setBody(jsonPayload);
        try{
            httpRes = http.send(httpReq);
            system.debug('makeHttpPostRequest method->>httpRes:: '+httpRes);
            system.debug('makeHttpPostRequest method->>httpRes for body:: '+httpRes.getBody());
        }
        catch(System.Exception e){
            System.debug('Exception found in class QB_HelloWorldController method connectToQuickbooks ' + e.getMessage());
            System.debug('Exception found in class QB_HelloWorldController method connectToQuickbooks ' + e.getLineNumber());
        } 
        return httpRes;
    }
}