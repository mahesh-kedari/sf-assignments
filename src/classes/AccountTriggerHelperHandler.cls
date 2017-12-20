/**
* Account Trigger Helper Handler
*/
public with sharing class AccountTriggerHelperHandler {
	
	/** Handle Print Account from List */
	public void handlePrintAccount(List<Account> accountList, String triggerType){
		System.debug(' \n\n ------------------------------- ');
		System.debug('Trigger Type : ' + triggerType);
		for(Account account : accountList){
			System.debug(account.name);
		}		
		System.debug(' -----------------------------  \n\n');
	}
	
	/** Handle Print Account from Map */
	public void handlePrintAccountMap(Map<ID, sObject> accountMap, String triggerType){
		System.debug(' \n\n ------------------------------- ');
		System.debug('Trigger Type : ' + triggerType);
		for(ID aId : accountMap.keySet()){
			System.debug(accountMap.get(aId));
		}
		System.debug(' -----------------------------  \n\n');
	}
	
	/** Handle Clone Account Operation */
	public void cloneAccount(List<Account> accountsList){
		System.debug('Clone functionality called..!!');
        List<Account> newAccounts = new List<Account>();
        
        for(Account ac : accountsList){
            System.debug('Looping through account new event');
            if(!ac.isClone()){
               System.debug('Creating New Account');
                Account newAc = ac.clone(false, true, false, false);
                newAccounts.add(newAc);
            }else{
              System.debug('Not Creating new account');
            }
        }
        
        //If Cloning is done insert record in database
        if(newAccounts.size()>0){
        	insert newAccounts;
        }
	}
}