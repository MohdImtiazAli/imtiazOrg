public class YoungAstronaut6 {
    
    public static void CompareString(){
        String str1 = 'Pay TV;AVOD;Basic TV;';
        String str2 = 'Basic TV;Pay TV;AVOD;';
        
        List<String> str1List = str1.split(';');
        List<String> str2List = str2.split(';');
        for(Integer i=0;i<str1List.size();i++){
            if(str2List.contains(str1List[i])){
                system.debug('Yes this word '+str1List[i]+' is contains in str2List');
            }
        }
        
    }
}