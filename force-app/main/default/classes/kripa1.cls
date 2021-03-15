public class kripa1 {
    
    public static void CopyAttachment(){
        List<Opportunity> OpportunityList=new List<Opportunity>();
        OpportunityList=[select id,accountid from Opportunity where accountid !=null];
        
        Set<Id> AccountSetId=new Set<Id>();
        for(Opportunity op:OpportunityList){
            AccountSetId.add(op.accountid);
        }
        
        List<Account> accountList=new List<Account>();
        accountList=[select id from Account where id in: AccountSetId];
        
        List<Attachment> attachmentList=new List<Attachment>();
        attachmentList=[select id,name,body,parentid,contentType from Attachment where parentid in: accountList];
        
        
        List<Attachment> AttachmentInsert=new List<Attachment>();
        List<Opportunity> AttachmentUpdate2=new List<Opportunity>();
        for(Opportunity op:OpportunityList){
            integer flag=0;
            for(Attachment atch:attachmentList){
                if(op.AccountId==atch.parentid){
                    flag=1;
                    Attachment actchobject=new Attachment();
                    actchobject.ParentId=op.id;
                    actchobject.Body=atch.Body;
                    actchobject.ContentType=atch.ContentType;
                    actchobject.Name=atch.Name;
                    
                    AttachmentInsert.add(actchobject);
                }
            }
            if(flag==0){
                op.StageName='closed lost';
                AttachmentUpdate2.add(op);
            }else{
                op.StageName='closed won';
                AttachmentUpdate2.add(op);
            }
            
        }
        if(AttachmentInsert.size()>0){
            insert AttachmentInsert; 
        }
        
        if(OpportunityList.size()>0){
            update AttachmentUpdate2;
        }         
    }
}