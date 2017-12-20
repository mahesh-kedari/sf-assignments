/**
* EFT Transaction Status Trigger Handler
*/
public with sharing class EFTTxnStatusTriggerHelperHandler {
   
   /** */
   public void createCase(){
   		Sales_Header__c shc = getSalesHeader();
   		Case cs = new Case();
   		cs.accountId = shc.Account__c;
   		cs.contactId = shc.Contact__c;
   		cs.recordTypeId = getRecordType().Id;
   		cs.Origin = 'Internal';
   		cs.reason = 'Address Did Not Verify';
   		cs.priority = 'High';
   		cs.status = 'New';
   		cs.Type = 'Address Did Not Verify';
   		cs.subject = cs.account.name + ' ' + cs.Type;
   		insert cs;
   }
   
   private RecordType getRecordType(){
   		RecordType rt = [select Id from RecordType where Name = 'Assignment' and SobjectType = 'Case'];
   		return rt;
   }
   
   public Sales_Header__C getSalesHeader(){
   		Sales_Header__c shc = [SELECT ID, Account__c, Contact__c FROM Sales_Header__c];
   		return shc;
   }
}