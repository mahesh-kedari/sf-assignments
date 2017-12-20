trigger ContactTrigger on Contact (after insert, after update, before insert, before update) {
    //Instantiate Helper
    ContactTriggerHelper ctHelper = new ContactTriggerHelper();
    
    //Trigger segregator
    if(Trigger.isBefore && Trigger.isInsert){
    	/** Handle Before Insert Trigger */
    	ctHelper.onBeforeInsert();
    }else{
    	/** Handle Other Types of Trigger */
    }
}