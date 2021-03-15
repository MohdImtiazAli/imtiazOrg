public class QB_OAuthRedirectController {
    public static void getAccessToken(){
        
        
        Sample_App_Info__c metadataInfo = [SELECT App_URL__c, Callback_URL__c, Token_URL__c, Client_ID__c, Client_Secret__c FROM Sample_App_Info__c];
       
        String appUrl = metadataInfo.App_URL__c;
        String callbackUrl = metadataInfo.Callback_URL__c;
        String endPoint = metadataInfo.Token_URL__c;
        
        String clientId = metadataInfo.Client_ID__c;
        String clientSecret = metadataInfo.Client_Secret__c;
        String encodedString = EncodingUtil.base64Encode(Blob.valueOf(clientId + ':' + clientSecret));
        
     //   String oAuthCode = ApexPages.currentPage().getParameters().get('code');
      //  String realmId = ApexPages.currentPage().getParameters().get('4620816365157599930');
        String requestBody = 'grant_type=authorization_code&code=' + 'AB11609934016ue1ZOXFKFg5mY93VXtgYQFPzasuTaWuVKkXDz' + '&redirect_uri=' + callbackUrl;
        String errorMessage = '';
        
        HttpRequest httpReq = new HttpRequest();
        HttpResponse httpRes = new HttpResponse();
        Http http = new Http();
        httpReq.setMethod('POST');
        httpReq.setEndPoint(endPoint);
        httpReq.setHeader('Authorization' , 'Basic ' + encodedString);
        httpReq.setHeader('Content-Type' , 'application/x-www-form-urlencoded');
        httpReq.setBody(requestBody);
        
        try{
            httpRes = http.send(httpReq);
            if(httpRes.getStatusCode() == 200){
                system.debug('httpRes: '+httpRes.getBody());
                Map<String, Object> response = (Map<String, Object>)JSON.deserializeUntyped(httpRes.getBody());
                
                String accessToken = (String) response.get('access_token');
                system.debug('accessToken:----->  '+accessToken);
                String refreshToken = (String) response.get('refresh_token');
                system.debug('refreshToken:----->  '+refreshToken);
                
                 
            }
            
        }
        catch(System.Exception e){
            System.debug('Exception found in class QB_OAuthRedirectController method getAccessToken '+ e.getMessage());
            System.debug('Exception found in class QB_OAuthRedirectController method getAccessToken '+ e.getLineNumber());
        }  
        
         
    }
}