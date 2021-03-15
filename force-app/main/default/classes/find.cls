public class find {
    
    public static void access(){
        
        Map<String, Schema.SObjectType> m = Schema.getGlobalDescribe() ;
        Schema.SObjectType s = m.get('Order') ;
        
        Schema.DescribeSObjectResult r = s.getDescribe() ;
        List<String> MapList=new List<String>();
        Map<String,Schema.SObjectField> fields = r.fields.getMap();
        for(String str:fields.keySet()){
             MapList.add(str);
        }
        system.debug('MapList'+MapList);
        
    }
}