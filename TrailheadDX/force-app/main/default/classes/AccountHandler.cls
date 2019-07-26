/**
 * @File Name          : AccountHandler.cls
 * @Description        : 
 * @Author             : Heidi Tang (heitang@deloitte.com)
 * @Group              : 
 * @Last Modified By   : Heidi Tang (heitang@deloitte.com)
 * @Last Modified On   : 7/26/2019, 10:28:52 AM
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      		      Modification
 *==============================================================================
 * 1.0    7/26/2019, 10:24:45 AM   Heidi Tang (heitang@deloitte.com)     Initial Version
**/
public class AccountHandler{
    
    public static Account insertNewAccount(String str){
        try{
            
            Account acct = new Account(Name = str);
            insert acct;


            return acct;
        } catch(DmlException dmle){
            return null;
        }
    }
}