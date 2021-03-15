public class salesforceAndTwilioIntegration {
    //for Calls
    public static void integrateSalesforceAndTwilio(){
        
        String username='ACca2e269844f509db87946150a7e69bd3';
        String password='77c1e2ecaafa0fcb3359a35b1d55d1d6';
        
        Blob headerValue = Blob.valueOf(username + ':' + password);
        String authorizationHeader = 'BASIC ' + EncodingUtil.base64Encode(headerValue);
        
        String Body = 'To='+'+918810427416'+'&From='+'+16076782197'+'&Url='+'https://www.twilio.com/console/api-explorer/voice/';
        String EndPoint = 'https://api.twilio.com/2010-04-01/Accounts/ACca2e269844f509db87946150a7e69bd3/Calls.json';
        
        Http h = new Http();
        HttpRequest request = new HttpRequest();
        request.setHeader('Authorization', authorizationHeader);
        request.setEndpoint(EndPoint);
        request.setMethod('POST');
        request.setBody(Body);
        HttpResponse response = h.send(request);
        
        system.debug(response.getStatus());
        if(response.getStatusCode()==200){
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            system.debug('results: '+results);
        }
    }
}