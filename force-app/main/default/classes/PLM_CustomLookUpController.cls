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
        List < PLM_Product_Family__c  > lstOfAccount = new List < PLM_Product_Family__c  > ();
        if (!Schema.sObjectType.PLM_Product_Family__c.isAccessible()) {
            return null;
        }
        lstOfAccount = [select id, Name,Editor_Name__c,Copy_Product_Family__c,CreatedBy.Name,Full_Title__C,Editor_Code__c,OwnerId,Global_Subject_Category_Code__c, Global_Subject_Category_Description__c,Number_Of_Volumes__c,Primary_Market_Category__c,Product_Family_Name__c,Product_Family_Short_Title__c,Product_Line_Code__c,Product_line_Description__c,Secondary_Market_Category__c from PLM_Product_Family__c where Name LIKE: searchKey OR Full_Title__C Like: searchkey];
        system.debug('lstOfAccount::'+lstOfAccount);
        return lstOfAccount;
    }
      
}