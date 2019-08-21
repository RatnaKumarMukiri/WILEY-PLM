/**********************************************************************
Name: PLM_TestDataUtility
Copyright © 2015 Salesforce
======================================================
======================================================
@Purpose: Test Data Utility Class to maintain and reusable code for Entire Project
======================================================
***********************************************************************/

/**
      * @Description: Create/Update/Read Test Data for all Test Classes.
**/
public class PLM_TestDataUtility {

	/**
      * @Description: Test method for the Creation of temp proposal data
      * @Params                  : NA                                                                                  
      * @return                  : PLM_Temporary_Proposal__c object
      */
    public static PLM_Temporary_Proposal__c createTempProposalData(){
        PLM_Temporary_Proposal__c tempPropData = new PLM_Temporary_Proposal__c();
        tempPropData.Description__c = 'WileyPLM Description';
        tempPropData.Edition_Number__c = 789.00;
        tempPropData.Proposal_Name__c = 'Wiley Products';
        tempPropData.PFRD__c = Date.today();
        
        insert tempPropData;
        return tempPropData;
    }
    
    /**
      * @Description: Test method for the Creation of proposal data
      * @Params                  : NA                                                                                  
      * @return                  : PLM_Proposal__c object
      */
     public static PLM_Proposal__c createProposalData(){
       PLM_Proposal__c testProposal =  new PLM_Proposal__c();
       testProposal.Proposal_Name__c = 'Wiley Proposal';
       testProposal.Edition_Number__c = 1234;
       testProposal.Description__c = 'Prop Descr';
         
       insert testProposal;
       return testProposal;
    }

    /**
      * @Description: Test method for the Creation of Author data
      * @Params                  : NA                                                                                  
      * @return                  : PLM_Author__c object
      */
    public static PLM_Author__c createAuthor(){
     PLM_Author__c Au= New PLM_Author__c();
     Au.Name='Test Author';
     Au.Location__c='Germany';
     return Au;
    }
    
     /**
      * @Description: Test method for the Creation of Product Line Description data
      * @Params                  : NA                                                                                  
      * @return                  : PLM_Product_line_Description__c object
      */
     public static PLM_Product_line_Description__c createProductLineDescription(){
     PLM_Product_line_Description__c Pl = New PLM_Product_line_Description__c();
     Pl.Name='Test Product Line';
     Pl.Location__c='Germany';
     //insert Pl;
     return  Pl;
     }

     /**
      * @Description: Test method for the Creation of Editor data
      * @Params                  : NA                                                                                  
      * @return                  : PLM_Editor__c object
      */
    public static PLM_Editor__c createEditor(){
    PLM_Editor__c Edtr = New PLM_Editor__c();
    Edtr.Name='Test Editor';
    Edtr.Location__c='Germany';
    //insert Edtr;
    return Edtr;
    }

    /**
      * @Description: Test method for the Creation of Product Family data
      * @Params                  : NA                                                                                  
      * @return                  : PLM_Product_Family__c object
      */
     public static PLM_Product_Family__c createProductFamily(Id AuthorId,Id PldId,Id EdtrId){
     PLM_Product_Family__c Pf = New PLM_Product_Family__c();
     Pf.Edition_Number__c=1;
     Pf.Edition_Number__c=1;
     Pf.Number_Of_Volumes__c=1;
     Pf.Product_Family_Short_Title__c='Short test';
     Pf.Full_Title__c='Full Test';
     Pf.Product_Group_Origin_Description__c='Germany';
     Pf.Author__c=AuthorId;
     Pf.Product_line_Description__c=PldId;
     Pf.Editor_Name__c=EdtrId;
     Pf.Global_Subject_Category_Description__c='PD Allocated';
     Pf.Primary_Market_Category__c='Textbook';
     Pf.RecordTypeId=Schema.SObjectType.PLM_Product_Family__c.getRecordTypeInfosByName().get('Reference').getRecordTypeId();
    // insert Pf;
     return Pf;
     }

     /**
      * @Description: Test method for the Creation of Edition data
      * @Params                  : NA                                                                                  
      * @return                  : PLM_Edition__c object
      */
    public static PLM_Edition__c createEdition(Id PfId){
     PLM_Edition__c Edtn= New PLM_Edition__c();
     Edtn.Edition_Number1__c=1;
     Edtn.Proposal__c=PfId;
     //insert Edtn;
     return Edtn;
    }
}
/**********************************************************************
======================================================
History Check new comments 22 444   dsdfasd
------- 
VERSION   AUTHOR                  			DATE        DETAIL Description
1.0       Name : Offshore Team           08/08/2019  INITIAL DEVELOPMENT CSR: 
***********************************************************************/