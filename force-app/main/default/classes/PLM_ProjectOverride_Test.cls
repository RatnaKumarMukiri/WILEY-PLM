/**********************************************************************
Name: PLM_ProjectOverride_Test
Copyright © 2015 Salesforce
======================================================
======================================================
@Purpose: Test Class to coverage for PLM_ProjectOverride Class
======================================================
======================================================
History 
------- 
VERSION   AUTHOR                  			DATE        DETAIL Description
1.0       Name : Offshore Team           08/08/2019  INITIAL DEVELOPMENT CSR: 
***********************************************************************/

@isTest
public class PLM_ProjectOverride_Test {
    
    @isTest
    public static void createProposal(){
        ID referenceRecTypeID = Schema.SObjectType.PLM_Proposal__c.getRecordTypeInfosByName().get('Reference').getRecordTypeId();
        PLM_ProjectOverride.recordTypeByNameForProposal(referenceRecTypeID);
    }
}