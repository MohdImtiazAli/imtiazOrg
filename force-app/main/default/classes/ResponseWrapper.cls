public class ResponseWrapper {
    
    public boolean isConnectionOk;
    public String connectionMessage;
    public Exception responseException;
    public HttpResponse response;
    
    public ResponseWrapper(boolean isError,String errorMsg,HttpResponse response){
        this.isConnectionOk=isError;
        this.connectionMessage=errorMsg;
        this.response=response;
    }
    public ResponseWrapper(Exception e,HttpResponse response){
        this.isConnectionOk=true;
        this.responseException=e;
        if(e !=null){
            this.connectionMessage=e.getMessage();
        }
        this.response=response;
    }
}