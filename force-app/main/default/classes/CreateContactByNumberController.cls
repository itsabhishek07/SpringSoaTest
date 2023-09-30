public class CreateContactByNumberController {
    Public Static Void createContact(List<Account> accList){
        Map<Id,Decimal> mapId = new Map<Id,Decimal>();
    for(Account acc:accList){
        mapId.put(acc.Id,acc.Number_Of_Contacts__c);
    }
    List<Contact> conList = new List<Contact>();
    for(Account acc: accList){
        Decimal numCon = mapId.get(acc.Id);
        for(Integer i=0;i<numCon;i++){
            Contact con = new Contact();
            con.LastName = acc.Name+''+i;
            con.AccountId = acc.Id;
            conList.add(con);            
        }
    }
    Insert conList;
    }
    Public Static Void contactUpdate(List<Account> accListNew,Map<Id,Account> accOldMap){
        List<Contact> conListNew = new List<Contact>();
        Map<Id,Decimal> accmapNew = new Map<Id,Decimal>();
        Set<Id> accId = new Set<Id>();
        for(Account acc:accListNew){
            accId.add(acc.Id);
            accmapNew.put(acc.Id,acc.Number_Of_Contacts__c);
            if(acc.Number_Of_Contacts__c > accOldMap.get(acc.Id).Number_Of_Contacts__c){
                for(Decimal newI = accOldMap.get(acc.Id).Number_Of_Contacts__c;newI<acc.Number_Of_Contacts__c;newI++){
                    Contact con = new Contact();
                     con.LastName = acc.Name+''+newI;
                        con.AccountId = acc.Id;
                    conListNew.add(con);                    
                }
            }         
        }
        List<Contact> conList = [Select Id,Name,AccountId From Contact Where AccountId In:accId];
        List<Contact> conDelList = new List<Contact>();
        Map<Id,Decimal> conCountMap = new Map<Id,Decimal>();
        for(Contact con:conList){
            if(accmapNew.get(con.AccountId) < accOldMap.get(con.AccountId).Number_Of_Contacts__c){
                Decimal getConCountMap;
                if(conCountMap.IsEmpty()){
                    getconCountMap = 1;                  
                }else{
                    getconCountMap = conCountMap.get(con.AccountId);
                }
                if(getConCountMap <= accmapNew.get(con.AccountId)){
                    if(conCountMap.containskey(con.AccountId)){
                        conCountMap.put(con.AccountId,conCountMap.get(con.AccountId)+1);
                    }
                    else{
                       conCountMap.put(con.AccountId,2); 
                    }
                    
                }else{
                   conDelList.add(con); 
                }           
            }
        }
        if(!conListNew.IsEmpty()){
            Insert conListNew;       
        }  
        if(!conDelList.IsEmpty()){
            Delete conDelList;            
        }
    }
    Public Static Void contactDelete(List<Account> accListOld){
        Set<Id> setId = new Set<Id>();
        for(Account acc:accListOld){
            setId.add(acc.Id);
        }
        List<Contact> conList = [Select Id,AccountId From Contact Where AccountId In:setId];
       if(!conList.IsEmpty()){
            Delete conList;            
        }      
    }
}