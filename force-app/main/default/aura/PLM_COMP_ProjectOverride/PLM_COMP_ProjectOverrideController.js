({
	doInit : function(cmp, event, helper) {
       
       // cmp.set('v.setdefaultval',todayDate);
         var recordTypeId = cmp.get("v.pageReference").state.recordTypeId;
        //alert('recordTypeId-----------------'+recordTypeId);
        var action = cmp.get("c.recordTypeByNameForProposal");
		action.setParams({ "recId" : recordTypeId });
		action.setCallback(this, function(response) {
			var state = response.getState();
            //alert('state----------------'+state);
            //alert('res---------------------'+response.getReturnValue()); 
            if (state === 'SUCCESS') {
               //alert('res---------------------'+response.getReturnValue()); 
                if(response.getReturnValue() =='Reference'){
                    cmp.set("v.selectedProposalRecordTypeName",true); 
                      var today = $A.localizationService.formatDate(new Date(), "YYYY-MM-DD");
                     cmp.set("v.today", today);
                    
                }else{
                    cmp.set("v.selectedProposalRecordTypeName",false); 
                    var cmpBack3 = cmp.find('recordTypeErrorDialog');
                    $A.util.addClass(cmpBack3,'slds-fade-in-open');
                }
              //cmp.set("v.selectedProposalRecordTypeName",response.getReturnValue()); 
            }
        });
        $A.enqueueAction(action);
	},

    cancelDialog : function(component, helper) {
        var homeEvt = $A.get("e.force:navigateToObjectHome");
		homeEvt.setParams({
    	"scope": "PLM_Proposal__c"
	});
	homeEvt.fire();
	},
   
    
    
    /* [ saveRecordProductFamily]MEthod to save Edition Record and Update Product Family
     * 01-08-2019
     * [Rama]*/
    saveRecordProductFamily : function(cmp, event) {
        alert("Edition Number "+cmp.find("edititonNumber").get("v.value"));
        var action = cmp.get("c.CreateEdition");
          action.setParams({
              "productFamily" : cmp.get("v.selectedLookUpRecord") ,
              "edititonNumber": cmp.find("edititonNumber").get("v.value")                   
                                       
                                        });
       // alert('edition number::'+cmp.get("v.selectedLookUpRecord").)
        action.setCallback(this, function(response) {
            var state = response.getState();
               console.log('state1'+state);
           // alert('Edition Record Creation'+state);
            if (state === "SUCCESS") {
                var responseMessage = response.getReturnValue();
                alert(responseMessage);
                var toastEvent = $A.get("e.force:showToast");
                 toastEvent.setParams({
                 type : "success",
                 "message": "Edition Record created Successfully."
                });
                toastEvent.fire();
                     var navEvent = $A.get("e.force:navigateToSObject");
                     navEvent.setParams({
                          recordId: responseMessage,
                          slideDevName: "detail"
                     });
                     navEvent.fire(); 
            }
            
        });
         $A.enqueueAction(action);
        
    },
    
     saveRecordNewProductFamily : function(cmp, event) { 
        // alert('edition number::'+cmp.get("v.Full_Title__c"));
        /* var action = cmp.get("c.createProductFamily"); 
         action.setParams({ "cProdFam" : cmp.get("v.Copy_Product_Family__c") ,
                           "editNum" : cmp.get("v.Edition_Number__c") ,
                           "fullTitle" : cmp.get("v.Full_Title__c") ,
                           "globalSubCatDescr" : cmp.get("v.Global_Subject_Category_Description__c"),
                           "primaryMktCat" : cmp.get("v.Primary_Market_Category__c") ,
                           "prodFamShrtTitle" : cmp.get("v.Product_Family_Short_Title__c"),
                          
                           "nameOfProd" : cmp.get("v.Name"),
                           "editCode" : cmp.get("v.Editor_Code__c"),
                           "globSubCatCode" : cmp.get("v.Global_Subject_Category_Code__c"),
                           "numbOfVol" : cmp.get("v.Number_Of_Volumes__c") ,
                           "prodFamName" : cmp.get("v.Product_Family_Name__c"),
                           "prodLineCode" : cmp.get("v.Product_Line_Code__c") ,
                           "secondMarCat" : cmp.get("v.Secondary_Market_Category__c") ,
                           "editorName" : cmp.get("v.Editor_Name__c"), 
                           "ProposalName" : cmp.get("v.ProposalName__c"),   
                           "Description" : cmp.get("v.Description__c")
                           
                           
                          }
                         );
       // alert('edition number::'+cmp.get("v.selectedLookUpRecord").)
        action.setCallback(this, function(response) {
            var state = response.getState();
               console.log('state1'+state);
           // alert('Edition Record Creation'+state);
            if (state === "SUCCESS") {
                var responseMessage = response.getReturnValue();
                var toastEvent = $A.get("e.force:showToast");
                 toastEvent.setParams({
                 type : "success",
                 "message": "Product Record created Successfully."
                });
                toastEvent.fire();
                     var navEvent = $A.get("e.force:navigateToSObject");
                     navEvent.setParams({
                          recordId: responseMessage,
                          slideDevName: "detail"
                     });
                     navEvent.fire(); 
            }
            
        });
         $A.enqueueAction(action);*/
        
    },
    
    saveRecord : function(cmp, event) {
        // var selectedOptionValue = event.getParam("value");
        var selectedOptionValuefin = cmp.get("v.selValue");
         if(selectedOptionValuefin=='Create New Edition on existing Product Family'){
            cmp.set("v.editFamilyBoolean",true);
            var cmpTarget = cmp.find('editDialog');
            var cmpBack = cmp.find('editDialog1');
            var cmpBack2 = cmp.find('editDialog2');
            $A.util.removeClass(cmpTarget,'slds-fade-in-open');
            $A.util.removeClass(cmpBack,'slds-fade-in-open');
            $A.util.addClass(cmpBack2, 'slds-fade-in-open');
        }
        else{
            
                    if(cmp.get("v.selectedLookUpRecord").Name != undefined){
            
            //alert(cmp.get("v.selectedLookUpRecord").Name);
            cmp.set('FName',cmp.get("v.selectedLookUpRecord").Name);
        }
        
        
        
        var recordTypeId = cmp.get("v.pageReference").state.recordTypeId;
        var prodFamrecID;
        //alert('Abilash1');
      	  var action = cmp.get("c.recordTypeByName");
          action.setParams({ "recId" : recordTypeId });
          action.setCallback(this, function(response) {
         
            var state = response.getState();
               console.log('state1'+state);
            if (state === "SUCCESS") {
                console.log('state'+state);
                prodFamrecID = response.getReturnValue();
                //alert('Abbbilash123'+response.getReturnValue());
               if(selectedOptionValuefin == 'Create Product Bundle'){  
                 var toastEvent = $A.get("e.force:showToast");
                 toastEvent.setParams({
                 type : "success",
                 "message": "Product Bundles are in progress."
                });
                toastEvent.fire();
                
            }else if(selectedOptionValuefin == 'Create New Product Family'){
               /* alert('fin rec ID'+prodFamrecID);
                var cmpTarget = cmp.find('editDialog');
                var cmpBack = cmp.find('productFamily');
                
                $A.util.removeClass(cmpTarget,'slds-fade-in-open');
                $A.util.addClass(cmpBack, 'slds-fade-in-open'); */
                var createRecordEvent = $A.get("e.force:createRecord");
                    //var RecTypeID  = response.getReturnValue();
                    createRecordEvent.setParams({
                       "entityApiName": 'PLM_Product_Family__c',
                        "recordTypeId" : prodFamrecID
                    });
                    createRecordEvent.fire();
                
            }else if(selectedOptionValuefin == 'Create Product Group in Existing Product'){
                var createRecordEvent = $A.get("e.force:createRecord");
                    //var RecTypeID  = response.getReturnValue();
                    createRecordEvent.setParams({
                       "entityApiName": 'PLM_Edition__c'
                    });
                    createRecordEvent.fire();
            }else{
                 var toastEvent = $A.get("e.force:showToast");
                 toastEvent.setParams({
                 type : "error",
                 "message": "Select any value."
                });
                toastEvent.fire();
            }
                } 
                else {
                  console.log(state);
                }
              });
              $A.enqueueAction(action);
            
        
        }
        
        
    
        //alert('Abilash'+selectedOptionValuefin);
       
	},
    closeModal:function(component,event,helper){ 
        //alert('Abilash');
       /* var prod = component.get("v.ProposalName");
        if(prod == null){
             var toastEvent = $A.get("e.force:showToast");
                 toastEvent.setParams({
                 type : "error",
                 "message": "Select any value."
                });
                toastEvent.fire();
        }else{*/
        
       
        var cmpTarget = component.find('editDialog');
        var cmpBack = component.find('editDialog1');
        
        $A.util.removeClass(cmpTarget,'slds-fade-in-open');
        $A.util.addClass(cmpBack, 'slds-fade-in-open'); 
        //}
    },
    
    handleChange: function (cmp, event,helper) {
        // This will contain the string of the "value" attribute of the selected option
        var selectedOptionValue = event.getParam("value");
        /*if(selectedOptionValue=='Create New Edition on existing Product Family'){
            cmp.set("v.editFamilyBoolean",true);
            var cmpTarget = cmp.find('editDialog');
            var cmpBack = cmp.find('editDialog1');
            var cmpBack2 = cmp.find('editDialog2');
            $A.util.removeClass(cmpTarget,'slds-fade-in-open');
            $A.util.removeClass(cmpBack,'slds-fade-in-open');
            $A.util.addClass(cmpBack2, 'slds-fade-in-open');
        }*/
        cmp.set("v.selValue",selectedOptionValue);
        //alert("Option selected with value: '" + selectedOptionValue + "'");

    }
    
    
})