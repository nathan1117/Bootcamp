@isTest
private class LeadProcessorTest {
    
	private static testMethod void updateLeadSource() {
	    
	    List<Lead> leadList = new List<Lead>();
        
        for(Integer i=0; i<200; i++) {
            leadList.add(new Lead(LastName='Lead Test'+i, Company = 'Deloitte'));
        }
	    insert leadList;
        
        Test.startTest();
            LeadProcessor lprocessor = new LeadProcessor();
            Database.executeBatch(lprocessor);
        Test.stopTest();
	}
}