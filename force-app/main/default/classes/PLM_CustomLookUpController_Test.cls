/**********************************************************************
Name: PLM_CustomLookUpControllerTest()
======================================================
======================================================
@Purpose: Linked to Custom Lookup component's class PLM_CustomLookUpController for Test Coverage.
======================================================
***********************************************************************/
@isTest
public class PLM_CustomLookUpController_Test {
  /**
      * @Description: For creating common test records that are available for all test methods in the class.
      * @Params                  : NA                                                                                  
      * @return                  : void
      */  
    @testSetup
    static void setup(){
        PLM_Author__c AuthorObj= PLM_TestDataUtility.createAuthor();
        insert AuthorObj;
        PLM_Product_line_Description__c productLineDescObj= PLM_TestDataUtility.createProductLineDescription();
        insert productLineDescObj;
        PLM_Editor__c editorObj=PLM_TestDataUtility.createEditor();
        insert editorObj;
        PLM_Product_Family__c productFamilyObj=PLM_TestDataUtility.createProductFamily(AuthorObj.Id,productLineDescObj.Id,editorObj.Id);
        insert productFamilyObj;
    }
     /**
      * @Description: Test method for the PLM_CustomLookUpController.fetchProductFamily class
      * @Params                  : NA                                                                                  
      * @return                  : void
      */
    @isTest
   static void testfetchProductFamily(){
       String searchKeyWord='Full Test';
       String objectName=null;
       List <PLM_Product_Family__c> productFamilyList= new List<PLM_Product_Family__c>();
       Test.startTest();
       productFamilyList=PLM_CustomLookUpController.fetchProductFamily(searchKeyWord,objectName);
       Test.stopTest();
       if(productFamilyList.size()>0)
       {
           System.assert(true);
       }
       else
       {
           System.assert(false);
       }
    }

}
/**********************************************************************
======================================================
History 
------- 
VERSION   AUTHOR                     DATE        DETAIL Description
1.0       Name : Sravani Gadde   08/08/2019   INITIAL DEVELOPMENT CSR: 
***********************************************************************/