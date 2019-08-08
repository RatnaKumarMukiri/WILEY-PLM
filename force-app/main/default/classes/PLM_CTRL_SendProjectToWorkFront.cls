/**********************************************************************
Name: PLM_CTRL_SendProjectToWorkFront()
Copyright © 2015 Salesforce
======================================================
======================================================
@Purpose: Intigration with Work front to create proposal data into WorkFront.
======================================================
======================================================
History 
------- 
VERSION   AUTHOR                  DATE        DETAIL Description
1.0       Name : Suraj Yadav   05/08/2019   INITIAL DEVELOPMENT CSR: 
***********************************************************************/
public without sharing class PLM_CTRL_SendProjectToWorkFront {
    
     /**
     * @Purpose: Invocable method to be exicutabel from Process builder. 
     * @Returns: null.
     * @Parameters:  List of values of proposal record. 
     */
    @InvocableMethod(label='SendProjectToWorkFront')
    public static List<String> sendProjectToWorkFront(List<String> lstInputParams) {
        try{
        	calloutProcess(lstInputParams);
        }catch(exception e){
            
        }
            return null;
    }
    
     /**
     * @Purpose: Future method to invoke call out to Workfront. 
     * @Returns: null.
     * @Parameters:  List of values of proposal record. 
     */
    @future(callout=true)
    public static void calloutProcess(List<String> lstInputParams){
       //System.debug('***** ' + lstInputParams);
        try{
        //Get Proposal Details
        PLM_Proposal__c objProp = [select id, name,Proposal_Name__c from PLM_Proposal__c where id=:lstInputParams[0]];
        PLM_WorkFront_Details__c objWFDetails = PLM_WorkFront_Details__c.getValues('Work Front Project');
		//System.debug('***** objWFDetails' + objWFDetails);
        
        String sEndPointURl;
        sEndPointURl = objWFDetails.End_Point_URL__c;
        sEndPointURl += 'name=' + objProp.Proposal_Name__c;
        sEndPointURl += '&status=CUR';
        sEndPointURl += '&apiKey=' + objWFDetails.Api_Key__c;
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        //request.setEndpoint('https://wileycontent.sb01.workfront.com/attask/api/v9.0/project?name=ETM_Test_Project_through_API_KS&status=CUR&apiKey=ozkzchm3cfzz527u11af7mvltzu68gtd');
        request.setEndpoint(sEndPointURl);
        request.setMethod('POST');
        HttpResponse response = http.send(request);
        //System.debug('***** ' + response.getStatusCode() + ' *** ' + response.getBody());
        }catch(exception e){
            
        }

    }
}