public class Page3_Controller {
	public string selectedSociety{get;set;}
    public string selectedYear{get;set;}
    public string selectedMonth{get;set;}
    
    public List<wrapDues> wrapDuesList{get;set;}
    public List<Due__c> checkedDues{get;set;}
    
   	public list<selectOption> records{get;set;}
    public list<selectOption> years{get;set;}
    public list<selectOption> months{get;set;}
    
    public list<String> yearsToAdd=new List<String>{'2015','2016','2017','2018','2019','2020','2021'};
    
    public list<String> monthsToAdd=new List<String>{'Jan','Feb','March','April','May','June','July','Aug','Sept','Oct','Nov','Dec'};
        
   	public list<Due__c> defaulters{get;set;}
    public list<Due__c> defaulters1{get;set;}
    public list<Society__c> societies;
   
   
   	public Page3_Controller(){
   
       defaulters=new List<Due__c>();
       
       records=new List<selectOption>();
       years=new List<selectOption>();
       months=new List<selectOption>();
       
       societies=[select id, name from Society__c];
        for(Society__c a:societies){
            records.add(new selectoption(a.id,a.name));
        }
        
        for(String y:yearsToAdd){
            years.add(new selectoption(y,y));
        }
        
        for(String m:monthsToAdd){
            months.add(new selectoption(m,m));
        }
        

   	}
    
    public class wrapDues{
        public Due__c due{get;set;}
        public Boolean checked{get;set;}
        public wrapDues(Due__c d){
            due=d;
            checked=true;
        }
    }
    
   public pageReference showRecords(){
       defaulters=[select id, member_name__c, dues_remaining__c,Member_Name__r.Name, Member_Name__r.Email__c, Month__c,year__c from Due__c where 
                   Society_Name__c=:selectedSociety and year__c=:selectedYear and month__c=:selectedMonth and dues_remaining__c>0];
       if(wrapDuesList==null){
           wrapDuesList = new List<wrapDues>();
              system.debug('inside');
            for(Due__c a: defaulters) {
             
                system.debug('a '+a);
                wrapDuesList.add(new wrapDues(a));
            }
        }
       checkedDues=new List<Due__c>();
       for(wrapDues wrapDuesObj:wrapDuesList){
           if(wrapDuesObj.checked == true) {
                checkedDues.add(wrapDuesObj.due);
            }
       }
   		return null;
   }
    
    public PageReference sendReminderEmail(){
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        for(Due__c d:checkedDues){
            if(d.Member_Name__r.Email__c!=null){
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                List<String> sendTo = new List<String>();
      			sendTo.add(d.Member_Name__r.Email__c);
      			mail.setToAddresses(sendTo);
                
                mail.setReplyTo('saie_shendage@persistent.com');
      			mail.setSenderDisplayName('Secretary of the Society');
    			mail.setSubject('Remaining Dues Not Paid');
              String body = 'Dear ' + d.Member_Name__r.Name + ', ';
              body += 'Your remaining dues are '+d.Dues_Remaining__c+' for the month of '+d.Month__c;
              body += ' Please pay the dues Asap, otherwise penalty would be added.';
              mail.setHtmlBody(body);
            
              mails.add(mail);
            }
        }
        Messaging.sendEmail(mails);
        return null;
    }
    
    public PageReference addDues(){
        defaulters1=[select id, member_name__c,Total_Dues__c, dues_remaining__c,Dues_Paid__c from Due__c where 
                   society_name__c=:selectedSociety and year__c=:selectedYear and month__c=:selectedMonth and dues_remaining__c>0];
      	return null;
    }
    
    public void add(){
        update defaulters1;
    }
    
}