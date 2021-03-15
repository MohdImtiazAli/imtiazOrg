public class Q7VisualHandler {
    public List<Opportunity> OpportunityList{
        get;
        set;
    }
     public Date Data{
        get;
        set;
    }
    public List<String> DateList{
        get;
        set;
    }
    public Q7VisualHandler(){
        date d=date.today();
        date ahead=d.addDays(5);
        system.debug('ahead'+ahead);
        OpportunityList=new List<Opportunity>();
        OpportunityList=[select id,name,closeDate from Opportunity where (closeDate<=:ahead and closeDate>=:d )];
        system.debug('OpportunityList--->  '+OpportunityList);
        
        Data=date.today();
        DateList=new List<String>();
        for(Opportunity op:OpportunityList){
            DateList.add(string.valueOf(op.CloseDate));
        }
        
    }
}