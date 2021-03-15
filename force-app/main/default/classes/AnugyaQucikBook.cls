public class AnugyaQucikBook {
     
    public static String statusMessage {
        get { return statusMessage; }
        set { statusMessage = value; }
    }
    
    public static void QuickBook(){
        try{
            AccountEntity obj = new AccountEntity();
            obj.Name ='Janeman';
            obj.AccountType = 'Accounts Receivable';
            
            
            String reqBody = JSON.serialize(obj);
            system.debug('reqBody:: '+reqBody);
            String jsonPayload=reqBody;
            
            
            String accessToken ='eyJlbmMiOiJBMTI4Q0JDLUhTMjU2IiwiYWxnIjoiZGlyIn0..8OdB57BSxh7VlK5a-ECyrg.1VLuB4byfzybtn2Z2TUScLoV9cUbwBJsq_2SvZ5umRsLwGRhppaJjJ_SaRha1NSFpygkaYtw4yZ4e6p1BmwE5yGEAPIx3J0mvPZKR_niTRs4RkAXsUpko6uW7lvmwKiwYVZLxkCIp5tnAvnKQ6ukxHcI_KO9ZcCYLbbpeuQaSxKntlCFivFRFM6dsKFiushd1Cijyx2TdibWbaoBDXXFhZpnt3X2CuTKcsCzg5G8dPmq7SSbzlbbnjJCfsPOz_fNSL8rb8A-7O-OJ0Ia07T-DoLPvAZNmjYv9WKlIZW8_7eZvE6nEmLjpOXTnlBgJe7kua4lmMq90nM0JSrLMCKJwEGl0V9m5G8BYpxe4PUD7vl6HNVNonPGQ77uuhv3TCLJfqmyrkX1qoevy8rGISAMlW_jLd9fjBo0DJAkvuPuEcrUdwBT5WfoB-qVOidi0-tM-H9WR756rhLXjwmX-jBFktJDglyfJLw85htqMACZq9xC6bh88OpzAQ2BupP9IT7UdnwuiVE_BFmiDK_BWJnSJcGqQ_YAeeZLDPBvy4QdSGQxlbUanveN5L4DNG-iiO42Yz7IuaJ_DRb1K24-TUR_dBbleCQg9ZPemO9EPFjymLZ7Y2K7PutJaTIGyxdLXxVO6J_iQantimPZuUciA9u8e9jKhoD84RCWlAGUo1dqx0n2s0AZqrcrPCeWxGf7ylscDtlRR6dgSJG07uu9ABfZVPDYxPUBfwGnmrPwDK7ckiBRrrV-XR1Pwg4oit1TgLTACSXajdf8tybuhZzukR-bJakIFukp1oVwFmihsQzg_NcvtRSlNuRbCqB1c6vTKDK0eSw7UVra19DUfJIIkkbCDZA0ppeaGHkrE_aRCbcUvms9pRDyjndsv3qNe0qv-j5U.NhkdgEcmOdf5iSL8Ce5FVw' ;
            String realmId = '4620816365157599930';
            
            String baseURL='https://sandbox-quickbooks.api.intuit.com';
            String endPoint ='https://sandbox-quickbooks.api.intuit.com/v3/company/4620816365157599930/account?minorversion=55';
            HttpRequest httpReq = new HttpRequest();
            httpReq.setMethod('POST');
            httpReq.setEndPoint(endPoint);
            httpReq.setHeader('Authorization' , 'Bearer ' + accessToken);
            httpReq.setHeader('Accept' , 'application/json');
            httpReq.setHeader('Content-Type' , 'application/json');
            httpReq.setBody(jsonPayload);
            
            HttpResponse Response = new HttpResponse();
            Http http = new Http();
            Response = http.send(httpReq);
          system.debug('Response-- '+Response);
            Integer statuscode;
            if(Response.getStatusCode() == 200){
                
                system.debug('Response.getBody(): '+Response.getBody());
                statusMessage=Response.getStatus();
                statuscode=Response.getStatusCode();
                system.debug('statuscode: '+statuscode);
            }
            
        }catch(exception e){
            System.debug('Exception found in class AnugyaQucikBook method QuickBook ' + e.getMessage());
            System.debug('Exception found in class AnugyaQucikBook method QuickBook ' + e.getLineNumber());
            statusMessage = 'Exception: ' + e.getMessage();
        }
    }
}
/*
 * 
 * List<Account> accountList=new List<Account>();
Account ac=new Account();
ac.name='India';
accountList.add(ac);
AnugyaQucikBook.QuickBook(accountList);
 * 
 * 
 * 
 *
 */