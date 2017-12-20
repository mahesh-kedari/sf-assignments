trigger AccountTrigger on Account (Before insert, Before update, After insert, After Update, Before Delete) {
    
    //Helper Object for handling Trigger Operations
    AccountTriggerHelper helper = new AccountTriggerHelper();
    
    //Trigger segregator
    if(Trigger.isInsert && Trigger.isBefore){
    	/** Before Insert */
    	helper.onBeforeInsert(Trigger.new); 
    }else if(Trigger.isInsert && Trigger.isAfter){
    	/** After Insert */
        helper.onAfterInsert();
    }else if(Trigger.isUpdate && Trigger.isBefore){
    	/** Before Update */
    	helper.onBeforeUpdate();
    }else if(Trigger.isUpdate && Trigger.isAfter){
    	/** After Insert */
 		helper.onAfterUpdate();   
    }else if(Trigger.isDelete && Trigger.isBefore){
    	/** Before Delete */ 
    	helper.onBeforeDelete();
    } 
}