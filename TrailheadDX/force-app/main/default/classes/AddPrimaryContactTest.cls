@isTest
public class AddPrimaryContactTest {

    @testSetup 
    static void setup() {

        List<Account> acctList = new List<Account>();
        List<Contact> conList = new List<Contact>();

        for (Integer i = 0; i < 50; i++) {
            acctList.add(new Account(
                Name='Test NY Account'+i,
                BillingState = 'NY'
            ));
        }

        for (Integer i = 0; i < 50; i++) {
            acctList.add(new Account(
                Name='Test CA Account'+i,
                BillingState = 'CA'
            ));
        }
        
        insert acctList;
        
        
        for(Integer i=0; i<acctList.size(); i++) {
            conList.add(new Contact(LastName='Test Con '+i, AccountId = acctList[i].Id));
        }
        insert conList;
    }
    
    static testmethod void testQueueable() {
        // query for test data to pass to queueable class
        Contact con = new Contact(LastName='cloned test');
        insert con;

        Test.startTest();        
            AddPrimaryContact adderContacts = new AddPrimaryContact(con, 'NY');
            System.enqueueJob(adderContacts);
            adderContacts = new AddPrimaryContact(con, 'CA');
            System.enqueueJob(adderContacts);
        Test.stopTest();        
    }
}