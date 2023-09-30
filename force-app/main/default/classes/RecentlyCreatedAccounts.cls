public class RecentlyCreatedAccounts {
    
    @AuraEnabled(Cacheable=true)
    
    Public Static List<Account> getData(){
           List<Account> accList = [Select Id,Name,Phone,rating,Industry,type From Account ORDER BY CreatedDate DESC LIMIT 10];
        Return accList;
    }
}