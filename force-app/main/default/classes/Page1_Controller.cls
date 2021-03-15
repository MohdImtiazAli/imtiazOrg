public class Page1_Controller {
    //Add Society
    public Society__c soc{get; set;}
    
    //Add Members
     public List<wrapMember> wrapMemberList {get; set;}
    public List<Member__c> selectedMembers{get;set;}
    public Id socId;
    
    //Add Secretary
    public String selectedSecretary{get;set;}
    public List<selectOption> societyMembers{get;set;}
    
    public Page1_Controller(){
        //Add Society
        soc=new Society__c();
        
        //Add Members
        if(wrapMemberList == null) {
            wrapMemberList = new List<wrapMember>();
            for(Member__c a: [select Id,Name from Member__c]) {
                wrapMemberList.add(new wrapMember(a));
            }
        }
        system.debug('wrapMemberList '+wrapMemberList);
        
        //Add Secretary
        //selectedSecretary='';
        societyMembers=new List<selectOption>();
        societyMembers.add(new selectoption('--Select Secretary--','--Select Secretary--'));
        for(Member__c m:[select id,name from member__c]){
            societyMembers.add(new SelectOption(m.id,m.Name));
        }
         system.debug('societyMembers '+societyMembers);
    }
    
    //Add Society
	public PageReference save()  
    {
        try{
            upsert soc; 
            socId=soc.Id;
        }catch(DmlException ex)
        {
   			ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.FATAL, ex.getMessage()));
			return ApexPages.currentPage();
        }
        
     	return ApexPages.currentPage();
    }   
    
    //Add Members
    public   void processSelected() {
    selectedMembers = new List<Member__c>();
 
        for(wrapMember wrapMemberObj : wrapMemberList) {
            if(wrapMemberObj.selected == true) {
                selectedMembers.add(wrapMemberObj.mem);
            }
        }
        
    }
 
    
    public class wrapMember {
        public Member__c mem {get; set;}
        public Boolean selected {get; set;}
 
        public wrapMember(Member__c a) {
            mem = a;
            selected = true;
        }
    }
    
    public void addMembers(){
        for(Member__c c:selectedMembers){
            c.Society_Name__c=socId;
        }
        update selectedMembers;
    }
    
    public PageReference addSecretary(){
        soc.Secretary__c=selectedSecretary;
        update soc;
        return ApexPages.currentPage();
    }
    
}