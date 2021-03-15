trigger OnAcccountForDefalutContacts on Account (after insert) {

    if(trigger.isAfter && trigger.isInsert){
        OnAcccountForDefalutContact.OnAcccountFor(trigger.new);
    }
}

 /*
  * Create a field on Account called “Only_Default_Contact”, checkbox, default off

Assignment:
When a new Account is created, create a new Contact that has the following data points:

First Name = “Info”
Last Name = “Default”
Email = “info@websitedomain.tld”
Only_Default_Contact = TRUE
When the Account has more than 1 Contact, update Only_Default_Contact to FALSE.
  */