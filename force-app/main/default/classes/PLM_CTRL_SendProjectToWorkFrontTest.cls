/**********************************************************************
Name: PLM_CTRL_SendProjectToWorkFrontTest()
Copyright © 2015 Salesforce
======================================================
======================================================
@Purpose: Test class.
======================================================
======================================================
History 
------- 
VERSION   AUTHOR                  DATE        DETAIL Description
1.0       Name : Abilash Patha   08/08/2019   INITIAL DEVELOPMENT CSR: 
***********************************************************************/
@isTest
public class PLM_CTRL_SendProjectToWorkFrontTest {

    @testSetup 
 static void testSetup(){
     
       PLM_Proposal__c testProposal =  new PLM_Proposal__c();
       testProposal.Proposal_Name__c = 'Proposa WorkFront';
       testProposal.Edition_Number__c = 1234;
       testProposal.Description__c = 'Prop Descr';
       insert testProposal;
     
       PLM_WorkFront_Details__c wfDetails =  new PLM_WorkFront_Details__c();
       wfDetails.End_Point_URL__c = 'https://wileycontent.sb01.workfront.com/attask/api/v9.0/project?';
       wfDetails.Api_Key__c = 'abcdef';
       insert wfDetails;
     
     }
  @isTest
    public static void invocableMethod(){
        
    }
}