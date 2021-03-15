trigger ProductsQues4 on Product2 (after insert) {

    if(trigger.isAfter){
        
        if(trigger.isInsert){
            productsQues4Handler.productHandler(trigger.new);
        }
    }
    
    
}