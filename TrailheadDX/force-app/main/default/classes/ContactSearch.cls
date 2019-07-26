public class ContactSearch{
    
    public static List<Contact> searchForContacts(String lastName, String mailPostal){
        
        return new List<Contact>(
            [SELECT Id,Name FROM Contact 
            WHERE LastName = :lastName AND MailingPostalCode =:mailPostal]
        );
    }
}