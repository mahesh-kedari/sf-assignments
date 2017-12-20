public with sharing class ContactTriggerHelperHandler {
    private boolean isDuplicate(){
 		// Write Duplicate check mechanism
 		return true;
 	}
 	
 	private Map<String, Set<String>> getValuesMap (List<Contact> contactsList){
 		Map<String, Set<String>> dupRecords = new Map<String, Set<String>>();
 		Set<String> emailIds = new Set<String>();
 		Set<String> phoneNums = new Set<String>();
 		for(Contact ct : contactsList){
 			emailIds.add(ct.email);
 			phoneNums.add(ct.phone);
 		}
 		dupRecords.put('emails', emailIds);
 		dupRecords.put('phones', phoneNums); 		
 		return dupRecords;
 	}
 	
 	
 	public boolean hasDuplicate(List<Contact> ctList){
 		List<Contact> contactList = new List<Contact>();
 		Map<String, Set<String>> valueMap = getValuesMap(ctList);
 		List<Contact> allContacts = 
 			[select ID, name, email, phone FROM Contact WHERE email IN :valueMap.get('emails') OR phone IN :valueMap.get('phones')];
 		if(allContacts.size()>0){
 			return true;
 		}else{
 			return false;
 		} 		
 	}
}