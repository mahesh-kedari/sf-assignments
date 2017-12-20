/**
* Account Trigger helper
*/
public with sharing class AccountTriggerHelper {
 	
 	//Handler Object for business Operations
 	AccountTriggerHelperHandler handler = new AccountTriggerHelperHandler();
 	
 	/**
 	* On Before Insert Trigger
 	*/
 	public void onBeforeInsert(List<Account> accountsList){
 		handler.handlePrintAccount(Trigger.new, 'Before Trigger :: New Value');
 	}
 	
 	/**
 	* On After Insert Trigger
 	*/
 	public void onAfterInsert(){
 		handler.cloneAccount(Trigger.new);
 	}
 	
 	
 	/**
 	* On Before Update Trigger 
 	*/
 	public void onBeforeUpdate(){
 		handler.handlePrintAccount(Trigger.Old, 'Before Trigger Update Old');
        handler.handlePrintAccountMap(Trigger.OldMap, 'Before Trigger Update Old Map');
 	}
 	
 	
 	/**
 	* On After Update Trigger
 	*/
 	public void onAfterUpdate(){
 		handler.handlePrintAccount(Trigger.Old, 'After Trigger Update Old');
        handler.handlePrintAccountMap(Trigger.OldMap, 'After Trigger Update Old Map');
        handler.handlePrintAccount(Trigger.New, 'After Trigger Update Old');
        handler.handlePrintAccountMap(Trigger.NewMap, 'After Trigger Update Old Map');
 	}
 	
 	
 	/**
 	* On Before Delete Trigger
 	*/
 	public void onBeforeDelete(){
 		handler.handlePrintAccount(Trigger.old, 'Before Trigger Delete old');
 		handler.handlePrintAccountMap(Trigger.OldMap, 'After Trigger Delete Old Map');
 	}
}