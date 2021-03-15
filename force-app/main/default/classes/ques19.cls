public class ques19 {

    
    public static void question19(){
       Profile pid= [select Id from Profile where Name = 'System Administrator'];
       
        
        User ur=new user();
        ur.Alias='kDeepak';
        ur.DefaultGroupNotificationFrequency='P';
        ur.DigestFrequency='D';
        ur.Email='deepak@gmail.com';
        ur.EmailEncodingKey='ISO-8859-1';
        ur.LanguageLocaleKey='en_US';
        ur.LastName='Kumar';
        ur.LocaleSidKey='en_GB';
        ur.ProfileId=pid.Id;
        ur.TimeZoneSidKey= 'America/Denver';
        ur.Username='deepak173896502@gmail.com';
        ur.UserPermissionsCallCenterAutoLogin=true;
        ur.UserPermissionsMarketingUser=true;
        ur.UserPermissionsOfflineUser=true;
       
        insert ur;
        
    }
}