trigger aman1T on Contact (After insert,after delete) {

    if(trigger.IsAfter && trigger.IsInsert){
       // aman1THandler.aman(trigger.new);
    }
     if(trigger.IsAfter && trigger.Isdelete){
         aman1THandler.amanDelete(trigger.old);
    }
   
}


/*trigger aman1T on Contact (after delete) {

   if(trigger.IsAfter && trigger.Isdelete){
         aman1THandler.amanDelete(trigger.old);
    }
   
}*/