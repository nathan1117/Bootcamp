public class AccountProcessor {
    
    @future
    public static void countContacts(List<String> accountIds) {
        
        List<Account> acctList = [SELECT Id,Number_of_Contacts__c,(SELECT Id FROM Contacts) FROM Account WHERE Id IN :accountIds];
        
        for(Account acct : acctList) {
            acct.Number_of_Contacts__c = acct.Contacts.size();            
        }

        update acctList;
    }
    
}