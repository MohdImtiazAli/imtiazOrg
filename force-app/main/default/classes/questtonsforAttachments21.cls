public class questtonsforAttachments21 {

    public static void forattachments21(){
        Account ac=[select name from Account where name='RohitMahra'];
        
      List<Attachment> at=[select name,body,contentType from Attachment where parentid=: ac.Id];
        System.debug(at);
        
       List<Contact> con=[select lastname from Contact where accountid=: ac.Id];//look up
        system.debug(con);
        
       List<Attachment> ATCHLIST=new List<Attachment>();
        
        
        for(Contact c:con){
        for(Attachment a:at){
            Attachment atch=new Attachment();
            atch.Body=a.Body;
            atch.Name=a.name;
            atch.ContentType=a.ContentType;
            atch.ParentId=c.id;
            ATCHLIST.add(atch);
              }
        }
        insert ATCHLIST;
        
    }
}