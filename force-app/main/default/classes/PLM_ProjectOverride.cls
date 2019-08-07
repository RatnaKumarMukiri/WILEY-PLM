/**********************************************************************
Name: PLM_ProjectOverride
Copyright © 2015 Salesforce
-------
History 
------- 
VERSION   AUTHOR                  DATE        DETAIL Description
1.0       Name : Abilash Patha   30/07/2019   INITIAL DEVELOPMENT CSR: 
***********************************************************************/
/**
      * @Description: Class used to create and update Product Family and Proposal Data
**/
public With Sharing class PLM_ProjectOverride {
    
   public static PLM_Temporary_Proposal__c tempProp;
   public static String proposalRecordTypeName;
   public static String productFamilyRecordTypeName;
    
    /**
      * @Description: Retrive RecordType Name of Selected Proposal RecordType.
      * @Params		: recId			 	- RecordType ID from New Action of Proposal Screen
      * @return		: recordTypeByName	- Return the name of the Selected Proposal RecordType
      */
    
    @auraEnabled
    public static String recordTypeByNameForProposal(Id recId){
        try{
            return Schema.getGlobalDescribe().get('PLM_Proposal__c').getDescribe().getRecordTypeInfosById().get(recId).getName();
        }catch(exception e){
            system.debug('Exception occured in recordTypeByNameForProposal method at Line '+ e.getLineNumber() +' Error Message '+e.getMessage());
            return null;
        }
    }
    
    /**
      * @Description: Create Edition records and associate to it's Product Family.
      * @Params		: productFamily 	- With the search text
      *            	  edititonNumber 	- Edition Number from Proposal Screen
      * 			  crdDate 			- crdDate from Proposal Screen
      * 			  pfrdDate 			- pfrdDate from Proposal Screen
      * @return		: message 			- Status of the record creation or failure
      */
    @auraEnabled
    public static string createEdition(PLM_Product_Family__c productFamily,Integer edititonNumber,Date crdDate,Date pfrdDate){
        string message = '';
        system.debug('productFamily Edit Number::'+productFamily.Edition_Number__c);
        system.debug('Edition Number::'+edititonNumber);
        try{
            if(productFamily != Null)
            {
                update productFamily;

                PLM_Edition__c newedition = new PLM_Edition__c();
                newedition.Proposal__c = productFamily.Id;
                newEdition.Edition_Number1__c = edititonNumber;
                newEdition.CRD__c= crdDate;
                newEdition.PFRD__c = pfrdDate;
                insert newEdition;
                message= newEdition.id;
            }
        }
        catch(exception e)
        {
            message= 'Edition Record Creation Failed';
        }
        
        return message;
    }
     
     /**
      * @Description: Create Proposal records on Temp Object
      * @Params		: edititonNumber 	-  Edition Number from Proposal Screen
      *            	  proposalName		-  Name of the Proposal
      * 			  description 		-  Description from Proposal
      * 			  pFRD	 			-  pFRD from Proposal Screen
      * 			  strRecordTypeId	-  RecordType of New Proposal Creation
      * @return		: productFamilyRecordTypeName			-  Passing ProductFamily RecordType using Proposal RecordType
      */
    @auraEnabled 
    public static String proposalInsert(Integer editionNumber, string proposalName,string description,string pFRD,string strRecordTypeId){
        try{

            proposalRecordTypeName = Schema.getGlobalDescribe().get('PLM_Proposal__c').getDescribe().getRecordTypeInfosById().get(strRecordTypeId).getName();
            productFamilyRecordTypeName = Schema.getGlobalDescribe().get('PLM_Product_Family__c').getDescribe().getRecordTypeInfosByName().get(proposalRecordTypeName).getRecordTypeId();
            tempProp = new PLM_Temporary_Proposal__c();
            tempProp.Description__c = description;
            tempProp.Edition_Number__c = editionNumber;
            tempProp.Proposal_Name__c = proposalName;
            //tempProp.PFRD__c = Date.valueOf(pFRD);
            
            insert tempProp;

            return productFamilyRecordTypeName;
        }catch(exception e){
            system.debug('In Exception proposalInsert '+e.getMessage()+ ' Line '+e.getLineNumber());
            return e.getMessage();
        }
    } 
}