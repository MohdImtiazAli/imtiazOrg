public class brainstorm1Case {
    //tick custem field same if case of contact id == case of contact of account id
    public static void casebrain(){
        List<Case>CaseList=new List<Case>();
       CaseList=[select id,contactid,accountid from Case where origin='Email' and status='working'];
        
        list<Contact>conList=new List<Contact>();
        conList=[select id,accountid from Contact where  accountid!=null];
        
       
        for(Contact con:conList){
            for(Case cas:CaseList){
                if(cas.AccountId==con.AccountId){
                    cas.same__c=true;
                }
            }
        }
        update CaseList;
       
    }
}