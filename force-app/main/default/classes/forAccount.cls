public class forAccount {

    public List<Account> AccountList{
        get;
        set;
    }
    public  forAccount(){
        AccountList=new List<Account>();
        AccountList=[select id,name,Phone from Account limit 100];
    }
    public PageReference redirectToMyVF( ) {	
	PageReference myVFPage = new PageReference('/apex/Q5V');
	myVFPage.setRedirect(true);
	 
	return myVFPage;
}
}