/**
* Helper for EFTTransactionStatusTrigger
*/
public with sharing class EFTTxnStatusTriggerHelper {
    // EFTT
    EFTTxnStatusTriggerHelperHandler handler = new EFTTxnStatusTriggerHelperHandler();
    /**
    *
    */
    public void onBeforeInsert(){
    	// Handle Before Insert Scenario
    	
    }
    
    /**
    *
    */
    public void onAfterInsert(){
    	// Handle After insert Scenario
    	List<EFT_Transaction_Status__c> txnStatusList = (List<EFT_Transaction_Status__c>) Trigger.new;
    	Set<ID> salesHeaderIds = new Set<ID>();
    	for(EFT_Transaction_Status__c txnStatus : txnStatusList){
    		salesHeaderIds.add(txnStatus.Sales_Header__c);
    	}
    	Map<ID, Sales_Header__c> salesHeadersMap = new Map<ID, Sales_Header__c>([SELECT ID, Status__c FROM Sales_Header__c WHERE ID in :salesHeaderIds]);
    	
    	for(EFT_Transaction_Status__c txnStatus : txnStatusList){
    		if(txnStatus.Method_Name__c.equals('Credit Card Address Verify') && txnStatus.Transaction_Status__c.equals('Declined') && salesHeadersMap.get(txnStatus.Sales_Header__c).Status__c.equals('Open')){
    			System.debug('Criteria Met. Creating Case');
    			handler.createCase();
    		}
    	}
    } 
}