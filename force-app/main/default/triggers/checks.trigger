trigger checks on Account (After delete) {

    if(Trigger.isAfter && trigger.isDelete){
        checksHandler.handle(trigger.new,trigger.old);
    }
}