@isTest
private class AccountManagerTest {
    
    @testSetup 
    static void setup() {
        // Create test records
        
        Account testAcc = new Account( Name='Test Account');
        insert testAcc;

        Contact testCon= new Contact(LastName='Test Contact', AccountId = testAcc.Id);
        insert testCon;
    }
    
    private static testMethod void getAccountTest() {
        Account acct = [SELECT Id FROM Account];
        Id acctId = acct.Id;
        
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri = 'https://na1.salesforce.com/services/apexrest/Accounts/'+ acctId +'/contacts' ;
        request.httpMethod = 'GET';
        RestContext.request = request;

        // Call the method to test
        Account acctManager = AccountManager.getAccount();

        // Verify results
        System.assert(acctManager != null);
        System.assertEquals('Test Account', acctManager.Name);
	}
	
	

}