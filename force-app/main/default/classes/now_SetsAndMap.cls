public class now_SetsAndMap {

    public static void forsets(){
        Set<String> ss=new Set<String>();
        ss.add('imtiaz');
        ss.add('raju');
        ss.add('deepak');
        ss.add('imtiaz');
        System.debug(ss);
        
        Set<String> s=new Set<String>{'ali','sharma','manuj'};
            s.add('Mohan');
            s.add('sohan');
        System.debug(s);
        String sss=formaps();
        System.debug(sss);
        
        Map<String,String> smap=forMapstype();
        System.debug(smap);
    }
    public static String forMaps(){
        Map<String,String> sm=new Map<String,String>();
        sm.put('a','imtiaz');
        sm.put('b','raju');
        sm.put('c','mohan');
        sm.put('c','deepak');
        System.debug(sm);
        String s=sm.get('a');
        System.debug(s);
        return s;
    }
    
    public static  Map<String,String>  forMapstype(){
        Map<String,String> sm=new Map<String,String>();
        sm.put('a','gaurav');
        sm.put('b','amar');
        sm.put('c','rahul');
        sm.put('d','deepak');
        
        return sm;
    }
}