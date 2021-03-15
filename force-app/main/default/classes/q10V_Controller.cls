public class q10V_Controller {
    
    public Boolean visibleSubmit { get; set; }
    public 	Data_Change_Request__c custemObj{
        get;set;
    }
    public Account accounts{
        get;set;
    }
    public List<Opportunity> ListOpportunity{
        get;set;
    }
    public q10V_Controller(){
        custemObj=new 	Data_Change_Request__c();//only main code for look page
        accounts=[select id,name from Account limit 1];
        ListOpportunity=[select id,name from Opportunity limit 5];
    }
    public PageReference redirect()
    {
        PageReference pr = new PageReference('/apex/Q2V');
        return pr;
    }
    
    public PageReference LeaveMC_VF() {
        PageReference p = new PageReference('/apex/Q2V');
        p.setRedirect(true);
        return p;
        
    }
    
    public  PageReference forpage(){
        PageReference pr = new PageReference('/apex/Q2V');
        pr.getParameters().put('key','imtiaz khan');//see on the url
        pr.setRedirect(true); // If you want a redirect. Do not set anything if you want a forward.
        return pr;
        
        
    }
}