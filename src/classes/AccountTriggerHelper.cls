/**
 * Email services are automated processes that use Apex classes
 * to process the contents, headers, and attachments of inbound
 * email.
 */
public class AccountTriggerHelper  {
	public static void handlePrintAccount(List<Account> accountsList, String triggerType){
		System.debug(' \n\n ------------------------------- ');
		System.debug('Trigger Type : ' + triggerType);
		for(Account account : accountList){
			System.debug(account.name);
		}		
		System.debug(' -----------------------------  \n\n');
	}
}