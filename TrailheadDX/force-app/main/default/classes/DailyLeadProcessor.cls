global class DailyLeadProcessor implements Schedulable {

    global void execute(SchedulableContext ctx) {
        
        List<Lead> leadList = [Select Id, LeadSource from Lead where LeadSource = null LIMIT 200];
        
        if(!leadList.isEmpty()) {
            for(Lead objLead: leadList) {
                objLead.LeadSource = 'Dreamforce';
            }
            update leadList;
        }
    }
}