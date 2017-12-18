public class ProgrammaticModel1Query {

    public void printAccounts(){
        List<Account> accountList = [SELECT ID, name FROM Account];
        // Traditional For Loop
        for(Integer i = 0; i<accountList.size(); i++){
            System.debug('Account '+i +' : '+accountList[i].name);
        }
        // ForEach Loop
        for(Account ac : AccountList){
            System.debug(ac.name);
        }
        
        // While Loop
        Integer i= 0;
        while(i < accountList.size()){
        	System.debug('Account '+i +' : '+accountList[i].name);
            i++;
        }
    }
}