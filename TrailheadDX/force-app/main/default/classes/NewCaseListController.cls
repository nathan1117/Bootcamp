public class NewCaseListController {
    
    List<Case> newCases {get;set;}
    
    public NewCaseListController(){
        newCases = getNewCases();
    }
    
    public List<Case> getNewCases(){
        
        List<Case> caseList = new List<Case>([ SELECT Id, CaseNumber FROM Case WHERE Status = 'New']);
        
        return caseList;
    }

}