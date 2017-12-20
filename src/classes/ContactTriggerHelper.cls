public with sharing class ContactTriggerHelper {
 	// Handler Instantiation
 	ContactTriggerHelperHandler ctHelper = new ContactTriggerHelperHandler();
 	/**
 	* On Before insert Trigger
 	*/
 	public void onBeforeInsert(){ 
 		if(ctHelper.hasDuplicate(Trigger.new)){
 			for(sObject ct : Trigger.new){
 				Contact objCt = (Contact)ct;
 				objCt.addError('A Contact with the same email address or phone number already exists in system');
 			}
 			//throw new DuplicateContactException('A Contact with the same email address or phone number already exists in system'); 
    	}
 	}
}