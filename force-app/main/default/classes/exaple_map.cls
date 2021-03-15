public class exaple_map {

    public static void mapid(){
        map<String,String> maps=new map<String,String>();
        maps.put('a','noida');
        maps.put('b','gurgaon');
        maps.put('c','delhi');
        maps.put('c','Rajsthan');
        maps.put('d','Mumbai');
        System.debug('key'+maps.keyset());
        System.debug('values'+maps.values());
        System.debug(maps.size());
        
        if(maps.isempty()){
            system.debug('map empty');
        }else{
            System.debug('maps is not empty');
        }
        System.debug(maps);
        system.debug('value of d'+maps.get('d'));
        
        map<String,String>mapscopy=new Map<String,String>(maps);
        System.debug('clone'+mapscopy);
        
    }
}