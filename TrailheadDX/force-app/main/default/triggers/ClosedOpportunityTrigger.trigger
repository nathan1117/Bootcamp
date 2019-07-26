trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
        
    if(Trigger.isAfter) {
        if(Trigger.isInsert || Trigger.isUpdate) {
    
            List<Task> newTaskList = new List<Task>();        
    
            for(Opportunity opp : Trigger.new){
                if(opp.StageName == 'Closed Won'){
                    Task newTask = new Task (
                        Subject = 'Follow Up Test Task',
                        WhatId = opp.Id );
                    newTaskList.add(newTask);
                }
            }
            
            if(newTaskList.size()>0){
                insert newTaskList;                
            }
        }        
    }    
}