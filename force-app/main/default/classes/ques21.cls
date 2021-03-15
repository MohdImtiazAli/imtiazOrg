public class ques21 {

    public static void question21(){
      
        Account Acc=[select name from Account where name='Manuj arya and sons'];
        System.debug(Acc);
        
        List<Attachment> ATList=[select name,body,contentType from attachment where parentid=:Acc.Id];
        system.debug(atlist);
        
        List<Attachment> ATTList=new List<Attachment>();
        
        List<contact> CList=[select lastname from contact where accountid=: acc.Id];
        system.debug(cList);
        
        for(contact c:CList){
            
            for(Attachment at:ATList){
                Attachment atch=new Attachment();
                atch.Body=at.body;
                atch.ParentId=c.id;
                atch.Name=at.Name;
                atch.ContentType=at.contenttype;
                ATTList.add(atch);
            }
        }
        insert ATTList;
        system.debug(attlist);
            }
}