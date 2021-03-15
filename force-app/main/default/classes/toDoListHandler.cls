public class toDoListHandler {
  @AuraEnabled
    public static List<ToDo__c> forTodList(String description,Date dueDate,Date reminderDate){
       
        ToDo__c todo=new ToDo__c();
        todo.Description__c=description;
        todo.Due_Date__c=dueDate;
        todo.Reminder_Date__c=reminderDate;
        
        insert todo;
         List<ToDo__c> toDoList=new List<ToDo__c>();
        toDoList=[select Description__c,Due_Date__c,Reminder_Date__c from ToDo__c];
        return toDoList;
    }
    @AuraEnabled
    public static void todoList(){
        
    }
}