trigger EFTTransactionStatusTrigger on EFT_Transaction_Status__c (after insert, after update, before insert, before update) {
	
	// Instantiate helper
	EFTTxnStatusTriggerHelper helper = new EFTTxnStatusTriggerHelper(); 
	    
	    //Trigger segregator
	if(Trigger.isInsert && Trigger.isBefore){
		// Handle Before Insert Trigger
		helper.onBeforeInsert();
	}else if(Trigger.isInsert && Trigger.isAfter){
		//Handle After Insert Trigger
		helper.onAfterInsert();	
	}    
}