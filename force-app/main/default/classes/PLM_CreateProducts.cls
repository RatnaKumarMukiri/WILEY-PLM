/**********************************************************************
Name: PLM_ProjectOverride()
Copyright © 2015 Salesforce
======================================================
======================================================
@Purpose: Linked to Add products component AddProduct.
======================================================
======================================================
History 
------- 
VERSION   AUTHOR                     DATE        DETAIL Description
1.0       Name : Srikanth kottala   30/07/2019   INITIAL DEVELOPMENT CSR: 
***********************************************************************/
public with sharing class PLM_CreateProducts {
   /**
      * @Description: search products from SF backend
      * @Params                  : objectName - name of the Sobject 
      *                        fldAPIText -  field API name
      *                                         fldAPIVal -  value in the field
      *                                         lim -  limit of records
                                                                                  fldAPISearch - field on which the search is intended.
                                                                                  searchText -  search keyword.
                                                                                  
      * @return                    : JSON string of records.
      */
  @AuraEnabled(cacheable=true)
    public static String searchDB(String objectName, String fldAPIText, String fldAPIVal, 
                                  Integer lim,String fldAPISearch,String searchText ){
        
        searchText='\'%' + String.escapeSingleQuotes(searchText.trim()) + '%\'';

        
        String query = 'SELECT '+fldAPIText+' ,'+fldAPIVal+
                  ' FROM '+objectName+
                    ' WHERE '+fldAPISearch+' LIKE '+searchText+ 
                  ' LIMIT '+lim;
        
        List<sObject> sobjList = Database.query(query);
        List<ResultWrapper> lstRet = new List<ResultWrapper>();
        
        for(SObject s : sobjList){
            ResultWrapper obj = new ResultWrapper();
            obj.objName = objectName;
            obj.text = String.valueOf(s.get(fldAPIText)) ;
            obj.val = String.valueOf(s.get(fldAPIVal))  ;
            lstRet.add(obj);
        } 
         return JSON.serialize(lstRet) ;
    }
    
    public class ResultWrapper{
        public String objName {get;set;}
        public String text{get;set;}
        public String val{get;set;}
    }   
}