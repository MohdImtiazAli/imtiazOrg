trigger KripaT on Case (After insert,after delete,after update) {

    if(Trigger.IsAfter ){
        if(trigger.isInsert){
            KripaTHandler.kripa(trigger.new);
        }
        if( trigger.isUpdate){
             system.debug('-----');
       KripaTHandler.kripa(trigger.new);
        }
       
    }
    
    if(Trigger.IsAfter && trigger.IsDelete){
        KripaTHandler.kripaDelete(trigger.old);
    }
}