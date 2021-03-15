public class MapFirstClass {

    public static void mappract(){
        Map<Integer,String> MapName=new Map<Integer,String>();
        MapName.put(1, 'imtiaz');
        MapName.put(2,'Khan');
        MapName.put(3,'ali');
        MapName.put(4,'Gaurav');
       system.debug(MapName);
        if(!MapName.containskey(3)){
        MapName.put(3,'dengue');
        }
          system.debug(MapName);
        for(Integer i:MapName.keyset()){
            System.debug('key='+i+'******************'+'values'+MapName.get(i));
        }
        /*
         String str=MapName.get(3);
        system.debug(str);
        system.debug(MapName.get(4));
        
        //List<Integer> Li=MapName.keySet();//error becouse keyset is set type
        Set<Integer> Si=MapName.keyset();
        system.debug(Si);
        System.debug('keyset ='+MapName.keyset());
        
        List<String> Liststring=MapName.values();
        System.debug(Liststring);
        */
        for(String s:MapName.values()){
            System.debug(s);
        }

    }
}