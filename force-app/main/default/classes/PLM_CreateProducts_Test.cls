@isTest
public class PLM_CreateProducts_Test {
    	
 @testSetup 
 static void setup() 
 {	 
     PLM_Author__c Au= New PLM_Author__c();
     Au.Name='Test Author';
     Au.Location__c='Germany';
     insert Au;
     
     PLM_Product_line_Description__c Pl = New PLM_Product_line_Description__c();
     Pl.Name='Test Product Line';
     Pl.Location__c='Germany';
     insert Pl;
     
     PLM_Editor__c Edtr = New PLM_Editor__c();
     Edtr.Name='Test Editor';
     Edtr.Location__c='Germany';
     insert Edtr;
     
     
     PLM_Product_Family__c Pf = New PLM_Product_Family__c();
     Pf.Edition_Number__c=1;
     Pf.Number_Of_Volumes__c=1;
     Pf.Product_Family_Short_Title__c='Short test';
     Pf.Full_Title__c='Full Test';
     Pf.Product_Group_Origin_Code__c='Germany';
     Pf.Author__c=Au.Id;
     Pf.Product_line_Description__c=Pl.Id;
     Pf.Editor_Name__c=Edtr.Id;
     Pf.Global_Subject_Category_Description__c='PD Allocated';
     Pf.Primary_Market_Category__c='Textbook';
     Pf.RecordTypeId=Schema.SObjectType.PLM_Product_Family__c.getRecordTypeInfosByName().get('Reference').getRecordTypeId();
     insert Pf;
     
  	 PLM_Edition__c Edtn= New PLM_Edition__c();
     Edtn.Edition_Number1__c=1;
     Edtn.Proposal__c=Pf.Id;
     insert Edtn; 
    	 
 }
    @isTest
    static void createProductTest(){
        String objectName ='PLM_Edition__c';
        String fldAPIText= 'ID';
        String fldAPIVal='Edition_Number1__c';
        Integer lim=1;
        String fldAPISearch='Edition_Number1__c';
        String searchText ='1';
        
        Test.startTest();
        PLM_CreateProducts.searchDB(objectName,fldAPIText,fldAPIVal,lim,fldAPISearch,searchText);
        Test.stopTest();
                
    }

}