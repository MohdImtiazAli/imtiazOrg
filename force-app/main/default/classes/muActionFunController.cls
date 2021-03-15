public class muActionFunController {
    public string accName{get;set;}
public PageReference controllerMethod() {
    system.debug('accName'+accName);
    system.debug('hi');
return null ;
}
}