public class ContactAndLeadSearch{
    
    public static List<List<SObject>> searchContactsAndLeads(String conLeadStr){
        
        List<List<sobject>> result = 
            [FIND :conLeadStr IN ALL FIELDS RETURNING 
            Contact(FirstName,LastName),Lead(FirstName,LastName)];

        return result;
    }
}