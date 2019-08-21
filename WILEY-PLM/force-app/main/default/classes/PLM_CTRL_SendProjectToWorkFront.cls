/**********************************************************************
Name: PLM_CTRL_SendProjectToWorkFront()
@Purpose: Intigration with Work front to create proposal data into WorkFront.
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

        //Get Proposal Details
        PLM_Proposal__c objProp = [select id, name,Proposal_Name__c,Recordtype.name,Product_Family__c from PLM_Proposal__c where id=:lstInputParams[0]];
        PLM_WorkFront_Details__c objWFDetails = PLM_WorkFront_Details__c.getValues('Work Front Project');
		//System.debug('***** objWFDetails' + objWFDetails);
        PLM_Product_Family__c objProdFamily = [select id, name,Product_line_Description__c,Product_line_Description__r.Name,PFRD__c,
                                               Author__r.Name,Author__r.First_Name__c,Author__r.Last_Name__c,
                                               Full_Title__c from PLM_Product_Family__c where id=:objProp.Product_Family__c];
        System.debug('***** objProdFamily' + objProdFamily);
        String sEndPointURl;
        sEndPointURl = objWFDetails.End_Point_URL__c;
        //sEndPointURl += 'name=' + objProp.Proposal_Name__c;
        //sEndPointURl += '&status=CUR';
        //sEndPointURl += '&apiKey=' + objWFDetails.Api_Key__c;
        
        JSONGenerator jsonGen = JSON.createGenerator(true);    
        jsonGen.writeStartObject();      
        jsonGen.writeStringField('name', objProp.Proposal_Name__c);
        jsonGen.writeStringField('projectID', '5d408ae303168d231d2c55865eba1c0b');
        jsonGen.writeStringField('DE:Product Family Product P-Number', objProdFamily.Name);
        jsonGen.writeStringField('DE:Author First and Last Name', objProdFamily.Author__r.First_Name__c + ' ' + objProdFamily.Author__r.Last_Name__c);
        jsonGen.writeStringField('DE:Product P-Number or ISBN Number', 'ISBN987654321');
        jsonGen.writeStringField('DE:Title', objProdFamily.Full_Title__c);
        if(objProdFamily.PFRD__c!=null) jsonGen.writeStringField('DE:Projected First Receipt', string.valueof(objProdFamily.PFRD__c));//'2019-10-30'
        jsonGen.writeStringField('DE:Product Line', objProp.Recordtype.name);	//Check what is Product lIne in WF
        jsonGen.writeStringField('DE:Primary Product?', 'Yes');
        jsonGen.writeStringField('DE:Manuscript Delivery Date', '2019-10-31');	//Not sure where is this date
        jsonGen.writeStringField('DE:Business Unit', objProp.Recordtype.name);        
        jsonGen.writeEndObject();    
        String jsonS = jsonGen.getAsString();
		System.debug('**** jsonMaterials'+ jsonS);
        
        /*JSONGenerator jsonGen2 = JSON.createGenerator(true);    
        jsonGen2.writeStartObject();      
        jsonGen2.writeStringField('name', 'Karthiks New Book Proposal 22  Suraj');
        jsonGen2.writeStringField('projectID', '5d408ae303168d231d2c55865eba1c0b');
        jsonGen2.writeStringField('DE:Product Family Product P-Number', 'P-54321');
        jsonGen2.writeStringField('DE:Author First and Last Name', 'Karthik Srikanti');
        jsonGen2.writeStringField('DE:Product P-Number or ISBN Number', 'ISBN987654321');
        jsonGen2.writeStringField('DE:Title', 'Karthiks New Book for Dummies Title SS');
        jsonGen2.writeStringField('DE:Projected First Receipt', '2019-10-30');
        jsonGen2.writeStringField('DE:Product Line', 'Reference');
        jsonGen2.writeStringField('DE:Primary Product?', 'Yes');
        jsonGen2.writeStringField('DE:Manuscript Delivery Date', '2019-10-31');
        jsonGen2.writeStringField('DE:Business Unit', 'Education');        
        jsonGen2.writeEndObject();    
        String jsonS2 = jsonGen2.getAsString();
		System.debug('**** jsonMaterials'+ jsonS2);
        
        List<String> lstS = new List<String>();
        lstS.add(jsonS);
        lstS.add(jsonS2);
        String sFinal  = JSON.serialize(lstS);*/
        
         //request.setEndpoint('https://wileycontent.sb01.workfront.com/attask/api/v9.0/project?name=ETM_Test_Project_through_API_KS&status=CUR&apiKey=ozkzchm3cfzz527u11af7mvltzu68gtd');
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(sEndPointURl);
        request.setMethod('POST');
        request.setbody(jsonS);
        request.setHeader('apiKey', objWFDetails.Api_Key__c);  
     	request.setHeader('Content-Type', 'application/json'); 
        HttpResponse response = http.send(request);
        System.debug('***** ' + response + ' *** ' + response.getBody());

    }
}
/**********************************************************************
History 
------- 
VERSION   AUTHOR                  DATE        DETAIL Description
1.0       Name : Suraj Yadav   05/08/2019   INITIAL DEVELOPMENT CSR: 
***********************************************************************/