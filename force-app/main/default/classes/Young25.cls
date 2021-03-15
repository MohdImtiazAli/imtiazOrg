public class Young25 {
    public static void updateOwner(List<user> userList){
        String email=userinfo.getUserEmail();
        List<cloud__c> cloudCustemObjectList=new List<cloud__c>();
        cloudCustemObjectList=[select id,Email__c from cloud__c where Email__c=:email];
    }

}