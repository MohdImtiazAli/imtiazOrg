public class mapclass {

    public static void mapsIntro(){
        map<Id,Account> Amap=new Map<Id,Account>([select name from Account limit 20]);
        
        Set<Id> ss=Amap.keySet();
        
        for(ID Accountid:Amap.keySet()){
            system.debug(Amap.get(Accountid));
        }
        
        
        /*
        System.debug('keyset'+ Amap.keySet());
        System.debug('keyvalue'+ Amap.Values());
        System.debug(Amap);
        System.debug(Amap.get('0012y000006rJknAAE'));
        System.debug(Amap.get('0012y000006rJknAAE').Id);
        System.debug(Amap.get('0012y000006rJknAAE').name);
        Account ac=Amap.get('0012y000006rJknAAE');
        System.debug( 'name and id=' +ac.name+' '+ac.id);
        //set me unique value hoti hai just like that id has also unique value
        */
        
        Map<String,String> mapName=new Map<String,String>();
        mapName.put('key','value');
        mapName.put('key','Locker');//pahle wale ko replace kar dega
        mapName.put('house','Mannat');
        mapName.put('home','Ambani');
        mapName.put('Forest','Amazon');
        mapName.put('1','Imtiaz');
        System.debug('mapprint--->  '+ mapName);
        System.debug('values--->  '+mapName.values());
        System.debug('keyset--->  '+mapname.keyset());
        
        for(String str:mapName.keySet()){
            system.debug(mapName.get(str));
        }
        
    }
}