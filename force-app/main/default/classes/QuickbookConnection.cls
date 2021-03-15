public class QuickbookConnection{
    // Replase with your Client Id
    public static String client_Id = 'ABSywjXXVj6t4YKkQtlPguBhJrMYJcxM4ROxbYCfPH5KzlcfiR';
    // Replase with your Client Secret
    public static String consumer_Secret = 'cagVhSkk4cpgkvJIfGgrJ003wfELRMGcUu0sD6PT';
    // Replace with Your Redirect URI
    public static String redirect_URI = 'https://cloudanalogy-4a-dev-ed--c.visualforce.com/apex/QuickbookConnection';
    
    /*
* @Name - doAuthorizationQuickBooks
* @Param - None
* @Description - to get the authentication code from the QuickBooks Account
* @ReturnType - PageReference
*/
    
    public static PageReference doAuthorizationQuickBooks(){
        
        String authorization_endpoint = 'https://appcenter.intuit.com/connect/oauth2';
        
        String scope = 'com.intuit.quickbooks.accounting';
        
        String final_EndPoint = authorization_endpoint+'?client_id='+client_Id+'&response_type=code&scope='+
            scope+'&state=123445633443&redirect_uri='+redirect_URI;
        
        PageReference pageRef = new PageReference(final_EndPoint);
        return pageRef;
    }
    /*
* @Name - doFetchAccessToken
* @Param - None
* @Description - to get the Access Token , Refresh Token and other Information after getting the authentication code
* @ReturnType - void
*/
    public static void doFetchAccessToken(){
        
        String encodedString = EncodingUtil.base64Encode(Blob.valueOf(client_Id+':'+consumer_Secret));
        system.debug('encodedString:: '+encodedString);
        
        // String endPoint = 'https://sandbox-quickbooks.api.intuit.com/oauth2/v1/tokens/bearer';//MAM
        String endPoint = 'https://oauth.platform.intuit.com/oauth2/v1/tokens/bearer';
        //AB11610023695lwVWoSfvk327Ds9HzkaD6KOLbWpRqwrOmsEXe
        system.debug('endPoint:: '+endPoint);
        // String oAuthCode ='AB11609942084qHH93kgOCsW2cu8UJP2VnzXL4v9kwCSomEre9';
        String oAuthCode = ApexPages.currentPage().getParameters().get('code');
        
        
        system.debug('oAuthCode:: '+oAuthCode);
        String requestBody = 'grant_type=authorization_code&code='+oAuthCode+'&redirect_uri='+redirect_URI;
        system.debug('requestBody:: '+requestBody);
        String errorMessage ='';
        
        HttpRequest httpReq = new HttpRequest();
        HttpResponse httpRes = new HttpResponse();
        Http http = new Http();
        httpReq.setMethod('POST');
        httpReq.setEndPoint(endPoint);
        //req1.setHeader('Authorization','Bearer'+accToken);
        
        httpReq.setHeader('Authorization' , 'Basic '+encodedString);
        httpReq.setHeader('Content-Type' , 'application/x-www-form-urlencoded');
        httpReq.setBody(requestBody);
        system.debug('httpReq---->   '+httpReq);
        try{
            httpRes = http.send(httpReq);
            system.debug('httpRes: '+httpRes);
            if(httpRes.getStatusCode() == 200){
                Map<String, Object> response_Map = (Map<String, Object>)JSON.deserializeUntyped(httpRes.getBody());
                List<Quickbooks_Token_Info__c> connectSettingInfos = new List<Quickbooks_Token_Info__c>();
                connectSettingInfos = [Select Id, Name,Expires_In_Time__c From Quickbooks_Token_Info__c 
                                       Where Name ='QuickBooks Setting Info'];
                Quickbooks_Token_Info__c quickBooksSettingInfo = new Quickbooks_Token_Info__c();
                
                String Name = 'QuickBooks Setting Info';
                String accessToken = (String)response_Map.get('access_token');
                system.debug('accessToken---------> '+accessToken);
                String refreshToken = (String)response_Map.get('refresh_token');
                system.debug('refreshToken---------> '+refreshToken);
                Decimal expiresIn = (Decimal)response_Map.get('expires_in');
                system.debug('expiresIn---------> '+expiresIn);                
                Decimal expiresInRefToken = (Decimal)response_Map.get('x_refresh_token_expires_in');
                system.debug('expiresInRefToken---------> '+expiresInRefToken); 
                
                quickBooksSettingInfo.Name = Name;
                quickBooksSettingInfo.Access_Token__c = accessToken;
                quickBooksSettingInfo.Refresh_Token__c = refreshToken;
                quickBooksSettingInfo.Expire_In_Seconds__c = expiresIn;
                quickBooksSettingInfo.Refresh_Token_Expires_In__c = expiresInRefToken;
                quickBooksSettingInfo.Expires_In_Time__c = System.Now().addSeconds(Integer.valueOf(expiresIn));
                
                if(connectSettingInfos.size() > 0 ) quickBooksSettingInfo.Id = connectSettingInfos[0].Id;
                
                upsert quickBooksSettingInfo;
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Confirm,'Successfully Authenticated with Quickbooks System!!!'));
            }else{
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Unexpected Error while communicating with Quickbooks API'+
                                                           'Status '+httpRes.getStatus()+' and Status Code '+httpRes.getStatuscode()));
            }
            
        }catch(System.Exception e){
            System.debug('#### Exception Executed '+e.getStackTraceString());
            if(String.valueOf(e.getMessage()).startsWith('Unauthorized endpoint')){
                errorMessage = 'Unauthorize endpoint: An Administer must go to Setup -> Administer -> Security Control ->'
                    +' Remote Site Setting and add '+' '+ endPoint +' Endpoint';
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,errorMessage));
                //return null;
            }else{
                errorMessage = 'Unexpected Error while communicating with Quickbooks API. '
                    +'Status '+httpRes.getStatus()+' and Status Code '+httpRes.getStatuscode();
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,errorMessage));
                //return null;
            }
        }  
    }
    /*
* @Name - doRefreshAccessToken
* @Param - None
* @Description - to get the Refresh Token and other Information after access token expires
* @ReturnType - void
*/
    public static void doRefreshAccessToken(){
        system.debug('insidev <------------------------------------> doRefreshAccessToken');
        String encodedString = EncodingUtil.base64Encode(Blob.valueOf(client_Id+':'+consumer_Secret));
        String endPoint = 'https://oauth.platform.intuit.com/oauth2/v1/tokens/bearer';
        
        List<Quickbooks_Token_Info__c> QBInfo = new List<Quickbooks_Token_Info__c>();
        QBInfo = [Select Id, Name,Expires_In_Time__c, Refresh_Token__c,
                  Refresh_Token_Expires_In__c  From Quickbooks_Token_Info__c 
                  Where Name ='QuickBooks Setting Info'];
        system.debug('QBInfo=> '+QBInfo);
        String oAuthCode = ApexPages.currentPage().getParameters().get('code');
        system.debug('oAuthCode=> '+oAuthCode);
        String requestBody = 'grant_type=refresh_token&refresh_token=';
        if(QBInfo!=null && QBInfo[0].Refresh_Token__c != null){
            requestBody+= QBInfo[0].Refresh_Token__c;
        }else{
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Refresh Token is NULL'));
        }
        String errorMessage ='';
        
        HttpRequest httpReq = new HttpRequest();
        HttpResponse httpRes = new HttpResponse();
        Http http = new Http();
        httpReq.setMethod('POST');
        httpReq.setEndPoint(endPoint);
        httpReq.setHeader('Authorization' , 'Basic '+encodedString);
        httpReq.setHeader('Content-Type' , 'application/x-www-form-urlencoded');
        httpReq.setBody(requestBody);
        system.debug('httpReq   ===>  '+httpReq);
        try{
            // Check if Access Token is expired or not.
            // if Expired then get the new Token
            if(QBInfo != null && QBInfo[0].Expires_In_Time__c <= System.Now()){
                httpRes = http.send(httpReq);
                if(httpRes.getStatusCode() == 200){
                    system.debug('doRefreshAccessToken method--> httpRes====>   '+httpRes.getBody());
                    Map<String, Object> response_Map = (Map<String, Object>)JSON.deserializeUntyped(httpRes.getBody());
                    system.debug('doRefreshAccessToken method--> response_Map====>   '+response_Map);
                    // Assign the Value to the Existing Quickbooks info Object and at the last update the information
                    // with new values
                    
                    
 
                }else{
                    ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Unexpected Error while communicating with Quickbooks API'+
                                                               'Status '+httpRes.getStatus()+' and Status Code '+httpRes.getStatuscode()));
                }
            }
            
        }catch(System.Exception e){
            System.debug('#### Exception Executed '+e.getStackTraceString());
            if(String.valueOf(e.getMessage()).startsWith('Unauthorized endpoint')){
                errorMessage = 'Unauthorize endpoint: An Administer must go to Setup -> Administer -> Security Control ->'
                    +' Remote Site Setting and add '+' '+ endPoint +' Endpoint';
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,errorMessage));
                //return null;
            }else{
                errorMessage = 'Unexpected Error while communicating with Quickbooks API. '
                    +'Status '+httpRes.getStatus()+' and Status Code '+httpRes.getStatuscode();
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,errorMessage));
                //return null;
            }
        }  
    }
}