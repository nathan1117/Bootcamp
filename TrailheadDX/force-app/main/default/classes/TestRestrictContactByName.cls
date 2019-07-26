@isTest
private class TestRestrictContactByName {

	private static testMethod void testContactByName() {
        
        List<Contact> conList = new List<Contact>();
        
        Boolean isInvalidName = false;
        
        conList.add(new Contact(LastName = 'Test LastName'));
        conList.add(new Contact(LastName = 'INVALIDNAME'));
                
        Test.startTest();
            try{
                insert conList;
            } catch (DmlException dmle) {
                isInvalidName = true;
            }
        Test.stopTest();
        
        System.assert(isInvalidName);
	}
}