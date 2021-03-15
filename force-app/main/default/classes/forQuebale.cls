public class forQuebale implements Queueable{
	//system.enqueueJob(new forQuebale()); execute it
	//String jobid=system.enqueueJob(new forQuebale());
	//system.debug(jobid);

    public void execute(QueueableContext qctx){
        delete [select id,name from account  where name='ABC'];
        system.enqueueJob(new forQuebale1());
    }
}