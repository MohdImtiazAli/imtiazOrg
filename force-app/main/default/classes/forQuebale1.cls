public class forQuebale1 implements Queueable{
	

    public void execute(QueueableContext qctx){
        delete [select id,name from account  where name='hero' limit 1];
    }
}