@isTest
private class TestVerifyDate {

	private static testMethod void checkDate() {
        Test.startTest();
            VerifyDate.CheckDates(Date.today(),Date.today() +3);   
            VerifyDate.CheckDates(Date.today(),Date.today() +32);   
        Test.stopTest();
	}
}