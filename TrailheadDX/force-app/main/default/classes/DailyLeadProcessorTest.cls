@isTest
private class DailyLeadProcessorTest {

    @testSetup 
    static void setup() {
	    List<Lead> leadList = new List<Lead>();
        
        for(Integer i=0; i<200; i++) {
            leadList.add(new Lead(LastName='Lead Test'+i, Company = 'Deloitte'));
        }
	    insert leadList;
    }

	private static testMethod void scheduleDailyLeadProcessorTest() {
        String CRON_EXP = '0 0 0 15 3 ? 2022';
        
        Test.startTest();
            System.schedule('Daily Lead Processor',CRON_EXP,new DailyLeadProcessor());  
        Test.stopTest();
	}

}