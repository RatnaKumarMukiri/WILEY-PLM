/**********************************************************************
Name: PLM_CustomLookUpController()
Copyright © 2015 Salesforce
======================================================
======================================================
@Purpose: Linked to Custom lookup created for Product family.
======================================================
======================================================
History 
------- 
VERSION   AUTHOR                  DATE        DETAIL Description
1.0       Name : RamaRao          30/07/2019  INITIAL DEVELOPMENT CSR: 
***********************************************************************/
/**
 * @Description This is used to get the lookup fields for the product family object
 */
public With Sharing class PLM_CustomLookUpController {
    
     /**
      * @Description: This is used to get the fetch fields from product family.
      * @Params		: searchKeyWord - with the search text
      *               objectName -  in which object to search
      * @return		: List - List of PLM_Product_Family__c
      */
    @AuraEnabled
    public static List < PLM_Product_Family__c  > fetchProductFamily(String searchKeyWord,string objectName) {
        String searchKey = searchKeyWord + '%';
      //  List < PLM_Product_Family__c  > returnList = new List < PLM_Product_Family__c  > ();
       List < PLM_Product_Family__c  > lstOfAccount = new List < PLM_Product_Family__c  > ();
        if (!Schema.sObjectType.PLM_Product_Family__c.fields.Name.isAccessible()) {
            return null;
        }
        lstOfAccount = [select id, Name,Editor_Name__c,Copy_Product_Family__c,CreatedBy.Name,Full_Title__C,Editor_Code__c,OwnerId,Global_Subject_Category_Code__c, Global_Subject_Category_Description__c,Number_Of_Volumes__c,Primary_Market_Category__c,Product_Family_Name__c,Product_Family_Short_Title__c,Product_Line_Code__c,Product_line_Description__c,Secondary_Market_Category__c from PLM_Product_Family__c where Name LIKE: searchKey OR Full_Title__C Like: searchkey];
        system.debug('lstOfAccount::'+lstOfAccount);
      /*  for (PLM_Product_Family__c  acc: lstOfAccount) {
            returnList.add(acc);
        }*/
        return lstOfAccount;
    }
    
    /**
      * @Description: This is used to get the fetch fields from any object for future
      * @Arguments:searchKeyWord - with the search text
      *            objectName -  in which object to search
      */
  /*  @AuraEnabled
    public static List < sObject > fetchLookUpValues(String searchKeyWord, String objectName) {
        system.debug('objectName-->' + objectName);
        String searchKey = searchKeyWord;
        List < sObject > returnList = new List < sObject > ();
        
        String sQuery='FIND {' + searchKey + '*} IN NAME FIELDS RETURNING Account(Id,Name), Contact(Id,Name)';
        system.debug('sQuery-->' + sQuery);
        Search.SearchResults searchResults = Search.find(sQuery);
        List<Search.SearchResult> articlelist = searchResults.get(objectName);       
        for (Search.SearchResult searchResult : articleList) { 
            if(objectName == 'Account'){
                account obj = (Account) searchResult.getSObject();
                returnList.add(obj);
            }else{
                Contact obj = (Contact) searchResult.getSObject();
                returnList.add(obj);
            }           
        }        
        system.debug('returnList::'+returnList);
        return returnList;
    }
*/    
    
}