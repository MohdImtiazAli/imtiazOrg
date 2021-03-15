public class brainstorming {
    //brainstorm questions send attachments from contact to opportunity via Account
    public static void checks(){
        Account ac=[select name from Account where name='Abhishek Company']; 
    
    list<Contact> con=[select lastname from Contact where accountid=: ac.Id];
    List<Attachment> atch=[select name,body,contentType from Attachment where parentid in: con];
    
    
    
    List<Opportunity> LA=[select name from Opportunity where accountid=: ac.Id];
    
    List<Attachment> ListAtach=new List<Attachment>();
        
    for(Opportunity o:LA){
    for(Attachment a:atch){
        Attachment at=new Attachment();
        at.Body=a.body;
        at.ContentType=a.contentType;
        at.Name=a.Name;
        at.ParentId=o.id;
        ListAtach.add(at);
    }
       
    }
         insert ListAtach;
}
}