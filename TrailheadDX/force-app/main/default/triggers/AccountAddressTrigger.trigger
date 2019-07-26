trigger AccountAddressTrigger on Account (before insert, before update) {
    
    if(Trigger.isBefore) {
        if(Trigger.isInsert) {
            updateShippingPostalCode(Trigger.new);
        }
        
        if(Trigger.isUpdate){
            
            List<Account> acctList = new List<Account>();
            
            for(Account acct : Trigger.new){
                Account oldAcct = Trigger.oldMap.get(acct.Id);
                
                if(oldAcct.BillingPostalCode != acct.BillingPostalCode) {
                    acctList.add(acct);
                }
            }
            
            updateShippingPostalCode(acctList);
        }   
    }
    
    private static void updateShippingPostalCode(List<Account> acctList){
        
        for(Account acct : acctList){
            if(!String.isEmpty(acct.BillingPostalCode) && acct.Match_Billing_Address__c){
                acct.ShippingPostalCode = acct.BillingPostalCode;
            }
        }        
    }
}