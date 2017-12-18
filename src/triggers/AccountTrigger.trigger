trigger AccountTrigger on Account (Before insert, Before update, After insert, After update, Before delete) {
	if((Trigger.isInsert || Trigger.isUpdate) && Trigger.isBefore ){
		AccountTriggerHelper.handlePrintAccount(Trigger.New, 'Before Trigger :: New Value');
	}else if(Trigger.isUpdate && Trigger.isBefore){
		AccountTriggerHelper.handlePrintAccount(Trigger.Old, 'Before Trigger Update Old');
	}else if(Trigger.isDelete){
		AccountTriggerHelper.handlePrintAccount(Trigger.old, 'Delete Trigger');
	}
}