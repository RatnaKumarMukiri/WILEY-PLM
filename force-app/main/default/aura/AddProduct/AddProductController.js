({ // eslint-disable-line
    doInit: function(component, event, helper) {
        // create a Default RowItem [Contact Instance] on first time Component Load
        // by call this helper function  
        helper.createObjectData(component, event);
    },
    init: function (cmp, helper) {
        
        var columns = [
            {
                type: 'text',
                fieldName: 'accountName',
                label: 'Account Name',
                initialWidth: 300
            },
            {
                type: 'number',
                fieldName: 'employees',
                label: 'Employees'
            }
        ];

        cmp.set('v.gridColumns', columns);

        // data
        var nestedData = [
            {
                "name": "123556",
                "accountName": "Higher Education",
                "employees": 10000,
                "phone": "837-555-1212",
                "accountOwner": "http://example.com/john-doe",
                "accountOwnerName": "John Doe",
                "billingCity": "San Francisco, CA",
                "_children": [
                    {
                        "name": "123556-A",
                        "accountName": "Custom product, previously published content",
                        "employees": 3000,
                        "phone": "837-555-1212",
                        "accountOwner": "http://example.com/john-doe",
                        "accountOwnerName": "John Doe",
                        "billingCity": "New York, NY",
                        "_children": [
                            {
                                "name": "123556-A-A",
                                "accountName": "ebook PDF",
                                "employees": 745,
                                "phone": "837-555-1212",
                                "accountOwner": "http://example.com/john-doe",
                                "accountOwnerName": "John Doe",
                                "billingCity": "New York, NY"
                            },
                            {
                                "name": "123556-A-B",
                                "accountName": "Cloth",
                                "employees": 578,
                                "phone": "837-555-1212",
                                "accountOwner": "http://example.com/jane-doe",
                                "accountOwnerName": "Jane Doe",
                                "billingCity": "Los Angeles, CA"
                            },
                            {
                                "name": "123556-A-C",
                                "accountName": "Paper",
                                "employees": 578,
                                "phone": "837-555-1212",
                                "accountOwner": "http://example.com/jane-doe",
                                "accountOwnerName": "Jane Doe",
                                "billingCity": "Los Angeles, CA"
                            },
                            {
                                "name": "123556-A-D",
                                "accountName": "ebook Mobi",
                                "employees": 578,
                                "phone": "837-555-1212",
                                "accountOwner": "http://example.com/jane-doe",
                                "accountOwnerName": "Jane Doe",
                                "billingCity": "Los Angeles, CA"
                            }
                        ]
                    },{
                        "name": "123556-B",
                        "accountName": "Knewton/Alta",
                        "employees": 3000,
                        "phone": "837-555-1212",
                        "accountOwner": "http://example.com/john-doe",
                        "accountOwnerName": "John Doe",
                        "billingCity": "New York, NY",
                        "_children": [
                            {
                                "name": "123556-B-A",
                                "accountName": "ebook PDF",
                                "employees": 745,
                                "phone": "837-555-1212",
                                "accountOwner": "http://example.com/john-doe",
                                "accountOwnerName": "John Doe",
                                "billingCity": "New York, NY"
                            },
                            {
                                "name": "123556-B-B",
                                "accountName": "Cloth",
                                "employees": 578,
                                "phone": "837-555-1212",
                                "accountOwner": "http://example.com/jane-doe",
                                "accountOwnerName": "Jane Doe",
                                "billingCity": "Los Angeles, CA"
                            },
                            {
                                "name": "123556-B-C",
                                "accountName": "Paper",
                                "employees": 578,
                                "phone": "837-555-1212",
                                "accountOwner": "http://example.com/jane-doe",
                                "accountOwnerName": "Jane Doe",
                                "billingCity": "Los Angeles, CA"
                            },
                            {
                                "name": "123556-B-D",
                                "accountName": "ebook Mobi",
                                "employees": 578,
                                "phone": "837-555-1212",
                                "accountOwner": "http://example.com/jane-doe",
                                "accountOwnerName": "Jane Doe",
                                "billingCity": "Los Angeles, CA"
                            }
                        ]
                    },{
                        "name": "123556-C",
                        "accountName": "zybooks",
                        "employees": 3000,
                        "phone": "837-555-1212",
                        "accountOwner": "http://example.com/john-doe",
                        "accountOwnerName": "John Doe",
                        "billingCity": "New York, NY",
                        "_children": [
                            {
                                "name": "123556-C-A",
                                "accountName": "ebook PDF",
                                "employees": 745,
                                "phone": "837-555-1212",
                                "accountOwner": "http://example.com/john-doe",
                                "accountOwnerName": "John Doe",
                                "billingCity": "New York, NY"
                            },
                            {
                                "name": "123556-C-B",
                                "accountName": "Cloth",
                                "employees": 578,
                                "phone": "837-555-1212",
                                "accountOwner": "http://example.com/jane-doe",
                                "accountOwnerName": "Jane Doe",
                                "billingCity": "Los Angeles, CA"
                            },
                            {
                                "name": "123556-C-C",
                                "accountName": "Paper",
                                "employees": 578,
                                "phone": "837-555-1212",
                                "accountOwner": "http://example.com/jane-doe",
                                "accountOwnerName": "Jane Doe",
                                "billingCity": "Los Angeles, CA"
                            },
                            {
                                "name": "123556-C-D",
                                "accountName": "ebook Mobi",
                                "employees": 578,
                                "phone": "837-555-1212",
                                "accountOwner": "http://example.com/jane-doe",
                                "accountOwnerName": "Jane Doe",
                                "billingCity": "Los Angeles, CA"
                            }
                        ]
                    }

                    
                ]
            },

            {
                "name": "123557",
                "accountName": "WEL",
                "employees": 6000,
                "phone": "837-555-1212",
                "accountOwner": "http://example.com/john-doe",
                "accountOwnerName": "John Doe",
                "billingCity": "New York, NY",
                "_children": [
                    {
                        "name": "123557-A",
                        "accountName": "Wiley Efficient Learning (Test Prep)",
                        "employees": 2540,
                        "phone": "837-555-1212",
                        "accountOwner": "http://example.com/john-doe",
                        "accountOwnerName": "John Doe",
                        "billingCity": "New York, NY"
                    }
                ]
            }
        ];

        cmp.set('v.gridData', nestedData);


        var expandedRows = ["123556", "123556-A", "123556-B", "123556-B-B", "123557"];

        cmp.set('v.gridExpandedRows', expandedRows);

    },
    
    addNewProducts : function(component, event, helper){
        var availableProducts = component.get("v.gridData");
        console.log('availableProducts length....'+availableProducts.length);
        if(availableProducts.length > 0){
            var existingProduct = component.find("existingProduct");
            var addNewProduct = component.find("addNewProduct");
            component.set('v.gridDataLength', availableProducts.length);
            component.set("v.addExtProducts", 0);
            $A.util.toggleClass(existingProduct, "slds-hide");
            $A.util.toggleClass(addNewProduct, "slds-hide");
        }
    },
    
    addExistingProducts : function(component, event, helper){
			var addExtProd = component.get("v.addExtProducts");
        	component.set("v.addExtProducts", 1);
            var existingProduct = component.find("existingProduct");
            var addNewProduct = component.find("addNewProduct");
            component.set('v.gridDataLength', 0);
            $A.util.toggleClass(existingProduct, "slds-hide");
            $A.util.toggleClass(addNewProduct, "slds-hide");

    },
    
    handleAddButtonClick : function(component, event, helper){
			var addExtProd = component.get("v.addExtProducts");
        	component.set("v.addExtProducts", 1);
            var existingProduct = component.find("existingProduct");
            var addNewProduct = component.find("addNewProduct");
            component.set('v.gridDataLength', 0);
            //$A.util.toggleClass(existingProduct, "slds-hide");
            //$A.util.toggleClass(addNewProduct, "slds-hide");

    }, 
            
    backToHomeScreen : function(component, event, helper) {
		var griDataLength = component.get("v.gridDataLength");
        component.set('v.gridDataLength', 0);
        var existingProduct = component.find("existingProduct");
        var addNewProduct = component.find("addNewProduct");
        //$A.util.toggleClass(existingProduct, "slds-show");
        //$A.util.toggleClass(addNewProduct, "slds-show");
    },
    
    // function for create new object Row in Contact List 
    addNewRow: function(component, event, helper) {
        // call the comman "createObjectData" helper method for add new Object Row to List  
        helper.createObjectData(component, event);
    },
 
    // function for delete the row 
    removeDeletedRow: function(component, event, helper) {
        // get the selected row Index for delete, from Lightning Event Attribute  
        var index = event.getParam("indexVar");
        // get the all List (associatedProds attribute) and remove the Object Element Using splice method    
        var AllRowsList = component.get("v.associatedProds");
        AllRowsList.splice(index, 1);
        // set the associatedProds after remove selected row element  
        component.set("v.associatedProds", AllRowsList);
    },
    
    handleSubmit : function(component, event, helper) {
    	var toastEvent = $A.get("e.force:showToast");
    	toastEvent.setParams({
        "title": "Success!",
        "type": "Success",
        "message": "Creating Products..Work-In-Progress"
    });
    toastEvent.fire();
    },
     
    handleClose : function(component, event, helper) {
        $A.get("e.force:closeQuickAction").fire() 
    }

}); // eslint-disable-line