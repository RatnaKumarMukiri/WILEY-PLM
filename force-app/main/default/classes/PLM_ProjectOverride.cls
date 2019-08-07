/**********************************************************************
Name: PLM_ProjectOverride()
Copyright © 2015 Salesforce
======================================================
======================================================
@Purpose: Linked to Proposal Screen component PLM_COMP_ProjectOverride.
======================================================
======================================================
History 
------- 
VERSION   AUTHOR                  DATE        DETAIL Description
1.0       Name : Abilash Patha   30/07/2019   INITIAL DEVELOPMENT CSR: 
***********************************************************************/
public With Sharing class PLM_ProjectOverride {
   public static List<RecordType> propRecTypeList;
   public static String recPropName;
   public static Id finRecId;
   public static List<RecordType> prodFamRecTypeList;
   public static PLM_Product_Family__c prodFamilyNewRec;
   public static PLM_Proposal__c propRecordCre;
	
    /**
     * @Purpose: To get the record type Id of Product Family. 
     * @Returns: Product Family record type Id.
     * @Parameters:  Record type id of Proposal selected in the first screen in the Component. 
     */
    @auraEnabled
    public static Id recordTypeByName(Id recId){
        propRecTypeList = new List<RecordType>();
        prodFamRecTypeList = new List<RecordType>();
        try{  
            system.debug('in apex project override class'+recId);
           propRecTypeList = [SELECT Id, SobjectType, Name, DeveloperName FROM RecordType WHERE SobjectType='PLM_Proposal__c' and Id=: recId LIMIT 1];
            if(propRecTypeList.size() > 0){
            	recPropName = propRecTypeList[0].Name;
            
               prodFamRecTypeList = [SELECT Id, SobjectType, Name, DeveloperName FROM RecordType WHERE SobjectType='PLM_Product_Family__c' and Name=: recPropName LIMIT 1];
                system.debug('final rec id'+prodFamRecTypeList);
                if(prodFamRecTypeList.size() > 0){
                    finRecId = prodFamRecTypeList[0].Id;
                    return finRecId;
                }else{
                    return null;
                }
            }else{
                return null;
            }
        }catch(exception e){
            system.debug('Exception occured in recordTypeByName method at Line '+ e.getLineNumber() +' Error Message '+e.getMessage());
            return null;
        }
    }
    @auraEnabled
    public static String recordTypeByNameForProposal(Id recId){
        propRecTypeList = new List<RecordType>();
        prodFamRecTypeList = new List<RecordType>();
        try{  
            system.debug('in apex project override class'+recId);
           propRecTypeList = [SELECT Id, SobjectType, Name, DeveloperName FROM RecordType WHERE SobjectType='PLM_Proposal__c' and Id=: recId LIMIT 1];
            if(propRecTypeList.size() > 0){
            	recPropName = propRecTypeList[0].Name;
                return recPropName;
			}else{
                return null;
            }
        }catch(exception e){
            system.debug('Exception occured in recordTypeByNameForProposal method at Line '+ e.getLineNumber() +' Error Message '+e.getMessage());
            return null;
        }
    }
    @auraEnabled
    public static string CreateEdition(PLM_Product_Family__c productFamily,Integer edititonNumber){
        string message = '';
        system.debug('productFamily Edit Number::'+productFamily.Edition_Number__c);
        system.debug(' Edition Number::'+edititonNumber);
        try{
            
            if(productFamily != Null)
            {
                update productFamily;
                system.debug('Product family ');
                PLM_Edition__c newedition = new PLM_Edition__c();
                newedition.Proposal__c = productFamily.Id;
                newEdition.Edition_Number1__c = edititonNumber;
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
     * @Purpose: To create Product Family & Proposal. 
     * @Returns: Product Family record type Id.
     * @Parameters: All the values of Product family. 
     */
    @auraEnabled 
    public static string createProductFamily(String cProdFam,string editNum,string fullTitle,string globalSubCatDescr,
                                             string primaryMktCat, string prodFamShrtTitle, string nameOfProd, 
                                             string editCode, string globSubCatCode, string numbOfVol, string prodFamName, 
                                             string prodLineCode, string secondMarCat, string editorName, string ProposalName,string Description){
        string message = '';
           system.debug('@#@#@#@#@#'+fullTitle);
        try{
           	prodFamilyNewRec = new PLM_Product_Family__c();
            prodFamilyNewRec.Copy_Product_Family__c = cProdFam;
            //prodFamilyNewRec.Edition_Number__c = editNum;
            prodFamilyNewRec.Full_Title__c = fullTitle;
            prodFamilyNewRec.Global_Subject_Category_Description__c = globalSubCatDescr;
            prodFamilyNewRec.Primary_Market_Category__c = primaryMktCat;
            prodFamilyNewRec.Product_Family_Short_Title__c = prodFamShrtTitle;
            //prodFamilyNewRec.Product_line_Description__c =  prodLineDescr;
            //prodFamilyNewRec.Name
            prodFamilyNewRec.Editor_Code__c = editCode;
            prodFamilyNewRec.Global_Subject_Category_Code__c = globSubCatCode;
            //prodFamilyNewRec.Number_Of_Volumes__c = numbOfVol;
            prodFamilyNewRec.Product_Family_Name__c = prodFamName;
            prodFamilyNewRec.Product_Line_Code__c = prodLineCode;
            prodFamilyNewRec.Secondary_Market_Category__c = secondMarCat;
            prodFamilyNewRec.Editor_Name__c = editorName;
            system.debug('#############0'+Description);
            insert prodFamilyNewRec;
  			system.debug('#############'+ProposalName);
            propRecordCre = new PLM_Proposal__c();
            propRecordCre.Proposal_Name__c = ProposalName;
            propRecordCre.Product_Family__c = prodFamilyNewRec.ID;
            propRecordCre.Description__c = Description;
            insert propRecordCre;
            system.debug('#$#$#$'+propRecordCre.Id);
            message= propRecordCre.Id;
            }
        catch(exception e)
        {
            	system.debug('@#@#@#@#@#'+e.getMessage());
			 message= 'Product Family Record Creation Failed';
        }
        
        return message;
    }
    
     @auraEnabled
    public static Temp_Proposal__c setTempProposal(Temp_Proposal__c tempProposal){
       tempProposal.Name=userInfo.getUserName();
       Database.insert(tempProposal);
       return tempProposal;
    }
}