public class SavePdf {
    
    public SavePdf(){
        system.debug('hi');
        
         Id someID = '000000000000000';
        
        PageReference ref = new PageReference('/somepage?id=' + someID);
        
        ContentVersion cont = new ContentVersion();
        
        cont.Title = 'Title for this contentVersion';
        cont.PathOnClient = 'file.pdf';
        cont.VersionData = ref.getContentAsPdf();
        cont.Origin = 'H';
        
        insert cont;  
    }
    public PageReference redirect()
    {
       Id someID = '000000000000000';
        
        PageReference ref = new PageReference('/apex?id=' + someID);
        
        ContentVersion cont = new ContentVersion();
        
        cont.Title = 'Title for this contentVersion';
        cont.PathOnClient = 'file.pdf';
        cont.VersionData = ref.getContentAsPdf();
        cont.Origin = 'H';
        
        insert cont;  
        return ref;
    }
}