public class Callout {
    
    public static ResponseWrapper doGet(String URL,String AuthorisationHeader,String contentType,map<String,String> headersMap){
        system.debug('Inside ResponseWrapper doGet');
        system.debug('URL: '+URL+'===>'+'AuthorisationHeader: '+AuthorisationHeader+'===>'+'contentType: '+contentType+'===>'+'headersMap: '+headersMap);
        DateTime requestInTime=System.now();
        HttpRequest r=getHttpRequest('GET',authorisationHeader,contentType,URL,NULL,headersMap);
        ResponseWrapper responseReceived=getResponse(r);
        system.debug('responseReceived: '+responseReceived);
        return responseReceived;
    }
    
    private static HTTPRequest getHttpRequest(String methodType,String authorisationHeader,String contentType,String URL,String requestBody,Map<String,String> HeadersMap)
    {
         system.debug('methodType: '+methodType+'===>'+'AuthorisationHeader: '+AuthorisationHeader+'===>'+'contentType: '+contentType+'===>'+'URL: '+URL+'requestBody: '+requestBody+'HeadersMap: '+HeadersMap);
        HttpRequest req=new HttpRequest();
        req.setEndpoint(URL);
       // req.setMethod('GET');
        req.setMethod(methodType);
        
        if(contentType !=null && contentType!=''){
            req.setHeader('Content-Type', contentType);
            system.debug('inside If Content-Type '+contentType);
        }
        
        if(authorisationHeader !=null){
            req.setHeader('Authorization', authorisationHeader);
              system.debug('inside If Authorization '+authorisationHeader);
        }
        
        if(HeadersMap !=null && HeadersMap.size()>=0){
            for(String s:HeadersMap.keySet()){
                req.setHeader(s, HeadersMap.get(s));
            }
           system.debug('inside If HeadersMap '+HeadersMap); 
        }
        
        if(requestBody !=null){
            req.setBody(requestBody);
             system.debug('inside If requestBody '+requestBody); 
        }
        return req;
    }
    
    private static ResponseWrapper getResponse(HttpRequest r){
        dateTime inTimeEntry=system.now();
        try{
            Http h=new http();
            HttpResponse responseBack=h.send(r);
            decimal e=system.now().getTime() - inTimeEntry.getTime();
            return new ResponseWrapper(false,null,responseBack);
            
            
        }catch(exception e){
            decimal ee=system.now().gettime() - inTimeEntry.getTime();
            return new ResponseWrapper(e,null);
        }
    }
    
}