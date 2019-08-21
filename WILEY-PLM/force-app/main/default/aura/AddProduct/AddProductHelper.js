({
	createObjectData: function(component, event) {
        // get the contactList from component and add(push) New Object to List  
        var RowItemList = component.get("v.associatedProds");
        RowItemList.push({
            'sobjectType': 'Associated_Products__c',
            'Name': '',
        });
        // set the updated list to attribute (contactList) again    
        component.set("v.associatedProds", RowItemList);
    },
})