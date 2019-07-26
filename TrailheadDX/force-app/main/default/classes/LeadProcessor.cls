global class LeadProcessor implements Database.batchable<sObject> {
    
    global Database.QueryLocator start(Database.BatchableContext bc) {
        // collect the batches of records or objects to be passed to execute
        return Database.getQueryLocator(
            'SELECT Id,LeadSource FROM Lead'
        );
    }
    
    global void execute(Database.BatchableContext bc, List<Lead> scope){
        // process each batch of records
        for(Lead objlead: scope) {
            objlead.LeadSource = 'Dreamforce';
        }
        
        update scope;
    }    
    
    global void finish(Database.BatchableContext bc){
        // execute any post-processing operations
    }    
}