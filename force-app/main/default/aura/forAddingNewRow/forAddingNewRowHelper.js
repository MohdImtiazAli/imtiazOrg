({
	createObjectData: function(component, event) {
       
        var RowItemList = component.get("v.opportunityList");
        console.log('size==>>    '+RowItemList.length);
        RowItemList.push({
            'sobjectType': 'Opportunity',
            'Name': '',
            'CloseDate': '',
            'StageName ': ''
        });
       alert(RowItemList);
        component.set("v.opportunityList", RowItemList);
    },
    
    
   
})