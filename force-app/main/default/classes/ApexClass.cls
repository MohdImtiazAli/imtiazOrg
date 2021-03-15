public class ApexClass {
    public string Name{set;get;}
     public string inputValue{get;set;}
     
    public  void Call(){
        system.debug('Name '+Name);
        
    }

}