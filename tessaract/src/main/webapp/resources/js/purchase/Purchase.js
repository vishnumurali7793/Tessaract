/**
 * 
 */

function addNewPurchaseBill() {
	location.href = "editPurchaseDetails";
}

$(document).ready(function(){
	$('#supplierCode').autocomplete({
		source: function(request, response) {
			$.ajax({
				url: 'getVendorDetails',
				data: {
					'purchaseBean.vendor.vendorCode': request.term,
				},
				success: function(data) {
					if (data == null || !data.length) {
						var result = [{
							label: '--No Matches Found--',
							value: 0
						}];
						response(result);
					} else {
						response($.map(data, function(i) {
							return {
								label: i[0] + "-" + i[1] + "-" + i[2],
								value: i[1]
							};
						}));
					}
				},
			});
		},
		appendTo: '#addSales',
		autoFocus: true,
		delay: 100
	});
});