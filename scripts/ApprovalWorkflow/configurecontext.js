$.context.genericusertask = {
	control: {
		source: "/stockinfo",
		properties: ["quoteID", "ProductID", "ProductName", "UnitsInStock", "UnitsOnOrder"]
	}
};

$.context.reorder = $.context.stockinfo.UnitsOnOrder > 0; 