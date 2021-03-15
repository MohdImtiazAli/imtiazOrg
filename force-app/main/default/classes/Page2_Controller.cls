public class Page2_Controller {
    private final integer MAX_RECORDS_PER_PAGE = 5;
    public integer startingFrom {get; set;}
    private integer socRecordCount; 
    //View Society
    public Page2_Controller(){
        if(startingFrom == NUll)
            startingFrom=0;
        socRecordCount = [select count() from Society__c];
    }
    public List<Society__c> getSocieties(){
        List<Society__c> results=[select name,Secretary__c,No_Of_Members__c,location__c 
                                  from Society__c limit :MAX_RECORDS_PER_PAGE
                                  offset : startingFrom];
        return results;  
    }
    
    public PageReference previous()
    {
        if(startingFrom <= 0)
        {   
            startingFrom = 0;
        } else if(startingFrom >= socRecordCount)
            startingFrom = startingFrom - MAX_RECORDS_PER_PAGE;
        else if(startingFrom < socRecordCount)
        {
            startingFrom = startingFrom - MAX_RECORDS_PER_PAGE;
        }
        
        return ApexPages.currentPage();
    }
    
    public PageReference next()
    {
        if((socRecordCount - startingFrom) > MAX_RECORDS_PER_PAGE)
            startingFrom = startingFrom + MAX_RECORDS_PER_PAGE;
        return ApexPages.currentPage();
    }  
}