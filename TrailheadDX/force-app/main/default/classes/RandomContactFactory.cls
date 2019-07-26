public class RandomContactFactory {
    
    public static List<Contact> generateRandomContacts (Integer contactCount, String lastName) {
        
        List<Contact> conList = new List<Contact>();
        
        for(Integer i=1;i<=contactCount;i++){
            Contact newCon = new Contact(FirstName = 'Test '+i, LastName = lastName);
            conList.add(newCon);
        }
                
        return conList;
    }
}