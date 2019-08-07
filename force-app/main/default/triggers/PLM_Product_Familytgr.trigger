trigger PLM_Product_Familytgr on PLM_Product_Family__c (After insert) {
Map<Id,PLM_Temporary_Proposal__c> ProductFamilytmpMap =new Map<Id,PLM_Temporary_Proposal__c>();
List<PLM_Proposal__c> Inst_Proposal_list=new list<PLM_Proposal__c>();

for(PLM_Temporary_Proposal__c Pft:[SELECT Id, Description__c, Proposal_Name__c, Edition_Number__c, PFRD__c, Name, CreatedDate,createdbyid FROM PLM_Temporary_Proposal__c where createdbyid=:UserInfo.getUserId() order by CreatedDate desc limit 1])
ProductFamilytmpMap.put(Pft.createdbyid, Pft);

for(PLM_Product_Family__c Pf:trigger.new){
          if(ProductFamilytmpMap.containsKey(pf.createdbyid)){
            PLM_Proposal__c PropObj= new PLM_Proposal__c ();
            PropObj.Description__c= ProductFamilytmpMap.get(pf.createdbyid).Description__c;
            PropObj.Edition_Number__c = ProductFamilytmpMap.get(pf.createdbyid).Edition_Number__c ;
            PropObj.Proposal_Name__c = ProductFamilytmpMap.get(pf.createdbyid).Proposal_Name__c  ;
            PropObj.Product_Family__c =pf.id;  
            Inst_Proposal_list.add(PropObj);
           }
 }
 
 if(Inst_Proposal_list.size()>0)
    Database.SaveResult[] srList = Database.insert(Inst_Proposal_list,false);
   
   system.debug('====Inst_Proposal_list=='+Inst_Proposal_list);
 
}