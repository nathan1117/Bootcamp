public class AddPrimaryContact implements Queueable {
    
    private Contact con;
    private String stateAbbr;

    public AddPrimaryContact(Contact con, String stateAbbr) {
        this.con = con;
        this.stateAbbr = stateAbbr;        
    }
    
    public void execute(QueueableContext context){
        List<Account> acctList = [SELECT Id,(SELECT Id FROM Contacts) FROM Account WHERE BillingState = :stateAbbr LIMIT 200];
        List<Contact> conList = new List<Contact>();
        
        for (Account acct : acctList) {
            Contact cont = con.clone(false,false,false,false);
            cont.AccountId =  acct.id;
            conList.add(cont);            
        }
        
        insert conList;
    }    
}