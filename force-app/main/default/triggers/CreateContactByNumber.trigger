trigger CreateContactByNumber on Account (after Insert,after Update,before Delete) {
    if(Trigger.IsInsert){
        CreateContactByNumberController.createContact(Trigger.new);
    }
    if(Trigger.IsUpdate){
        CreateContactByNumberController.contactUpdate(Trigger.new,Trigger.oldMap);
        
    }
    if(Trigger.IsDelete){
        CreateContactByNumberController.contactDelete(Trigger.Old);
    }
    
}