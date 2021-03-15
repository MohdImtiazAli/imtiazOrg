public class Q5_Apex {
    @AuraEnabled
    public static List<String> AllObjects(){ 
        
        map<String, Schema.SObjectType> ALLobjectMap=Schema.getGlobalDescribe();
        
        List<String> MapList=new List<String>();
        
        for(String str:ALLobjectMap.keySet()){
            String convert=string.valueOf(ALLobjectMap.get(str));
            
            MapList.add(convert);
            
        }
        
        MapList.sort();
        return MapList;
    }
    @AuraEnabled
    public static List<String> forallObjects(String fld){
        try{
            system.debug('Field------------>>>>>>'+fld);
            SObjectType accountType = Schema.getGlobalDescribe().get(fld);
            Map<String,Schema.SObjectField> mfields = accountType.getDescribe().fields.getMap();
            system.debug('mfields'+mfields.keySet());
            List<String> fieldList = new List<String>();
            for(schema.SObjectField sfield : mfields.values()){
                system.debug('sfield--'+sfield);
                fieldList.add(''+sfield);
            }
            system.debug('Class working');
            fieldList.sort();
            system.debug('fieldList');
            return fieldList;
            
        }
        catch(Exception e){
            system.debug(e.getMessage()+'----'+e.getLineNumber());
            return null;
        }
        
    }
     @AuraEnabled
    public static String ValueSobjFieldType(String obj, String objField){
        system.debug('obj'+obj+'----------- '+'objField++++++++++++++++++++'+objField);
        SObjectType accountType = Schema.getGlobalDescribe().get(obj);
        Map<String,Schema.SObjectField> mfields = accountType.getDescribe().fields.getMap();
        Schema.DisplayType lfielddataType = mfields.get(objField).getDescribe().getType(); 
        
        
        String s='';
        List<Schema.SObjectType> objects = new List<Schema.SObjectType>{accountType};
            for(Schema.SObjectType objType: objects){
                for(Schema.SObjectField fld: objType.getDescribe().fields.getMap().values()){
                    
                    System.debug(objField+fld.getDescribe().getName());
                    s= String.valueOf(objField+fld.getDescribe().getLabel());
                }
            }
        string t = 'ApI name = ' +s +' & TYPE = ' +String.valueOf(lfielddataType);
        return t;
        
    }
    
}
/*
*if(!fieldName.includes('.')) {
formatText.set("v.value",sobject[fieldName]); //sobject[fieldName] this is the key here to get the data
} 
* 
*/

/*    @AuraEnabled
public static List<String> access(String obj){
SYSTEM.debug('obj'+obj);
system.debug('inseide debug');
Map<String, Schema.SObjectType> m = Schema.getGlobalDescribe() ;
Schema.SObjectType s = m.get('obj') ;

Schema.DescribeSObjectResult r = s.getDescribe() ;
List<String> MapList=new List<String>();
Map<String,Schema.SObjectField> fields = r.fields.getMap();
for(String str:fields.keySet()){
MapList.add(str);
}

MapList.sort();
return MapList;


}
*/