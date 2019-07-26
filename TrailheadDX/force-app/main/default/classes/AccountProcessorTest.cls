@isTest
private class AccountProcessorTest {

	private static testMethod void countContactsTest() {
	    
	    List<Account> acctList = new List<Account>();
	    acctList.add(new Account(Name = 'Test 1'));
	    acctList.add(new Account(Name = 'Test 2'));
	    acctList.add(new Account(Name = 'Test 3'));
	    insert acctList;
        
        List<Contact> conList = new List<Contact>();
	    conList.add(new Contact(LastName = 'CTest 1',AccountId=acctList[0].Id));
	    conList.add(new Contact(LastName = 'CTest 2',AccountId=acctList[1].Id));
	    conList.add(new Contact(LastName = 'CTest 3',AccountId=acctList[2].Id));
	    conList.add(new Contact(LastName = 'CTest 4',AccountId=acctList[0].Id));
	    insert conList;
        
        List<String> acctIds = new List<String>();
        acctIds.add(acctList[0].Id);
        acctIds.add(acctList[1].Id);
        acctIds.add(acctList[2].Id);
        
        Test.startTest();
            AccountProcessor.countContacts(acctIds);
        Test.stopTest();
	}
}