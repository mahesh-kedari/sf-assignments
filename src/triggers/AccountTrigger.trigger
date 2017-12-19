trigger AccountTrigger on Account (Before insert, Before update, After insert, After Update, Before Delete) {
    AccountTriggerHelper acTriggerHelper = new AccountTriggerHelper();
    if(Trigger.isInsert && Trigger.isAfter){
        acTriggerHelper.cloneAccount(Trigger.New);
    }
    
    if((Trigger.isInsert || Trigger.isUpdate) && Trigger.isBefore ){
        acTriggerHelper.handlePrintAccount(Trigger.New, 'Before Trigger :: New Value');
        
    }else if(Trigger.isUpdate && Trigger.isBefore){
        acTriggerHelper.handlePrintAccount(Trigger.Old, 'Before Trigger Update Old');
        acTriggerHelper.handlePrintAccountMap(Trigger.OldMap, 'Before Trigger Update Old Map');
    }else if(Trigger.isDelete){
        acTriggerHelper.handlePrintAccount(Trigger.old, 'Delete Trigger');
    }
}