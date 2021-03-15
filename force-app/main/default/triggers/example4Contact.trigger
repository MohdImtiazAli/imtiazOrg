trigger example4Contact on Contact (before insert) {
    if(trigger.isBefore && trigger.isInsert){
        example4ContactHandler.example(trigger.new);
    }
}