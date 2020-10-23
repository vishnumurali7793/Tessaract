/**
 * 
 */

$(document).ready(function() {
	$('#enableGST').prop('checked', true);
	$('#enableIGST').prop('checked', false);
	$('#gstDiv').show();
	$('.igstTaxAmount').hide();
	$('.gstTaxAmount').show();
	$('#datetimepicker1').datetimepicker({
		minView: 2,
		pickTime: false,
		autoclose: true,
	});
	$("#itemTable").on('click', '.removeRow', function() {
		$(this).parent().parent().remove();
		calculateTotalAmount();
		var table = document.getElementById('itemTable');
		var rowCount = table.rows.length;
		for (var i = 1; i < rowCount; i++) {
			var label = document.querySelectorAll('#itemTable tbody tr:nth-child(' + i + ') td:nth-child(1) label');
			label[0].innerHTML = i + ".";
		}
	});

	//itemwise gross amount calculation for dynamically added rows
	$('#itemTable').on('keyup', '.dynamicElement', (element) => {
		var elementId = element.target.id;
		var rowCount = elementId.split("_");
		calculateItemwiseRate(rowCount[1]);
	});
});

function enableTaxFields(element) {
	var value = element.value;
	if (element.checked == true) {
		if (value === 'GST') {
			$('#enableGST').prop('checked', true);
			$('#enableIGST').prop('checked', false);
			$('#gstDiv').show();
			$('#igstDiv').hide();
			$('.igstTaxAmount').hide();
			$('.gstTaxAmount').show();
		} else if (value === 'IGST') {
			$('#enableGST').prop('checked', false);
			$('#enableIGST').prop('checked', true);
			$('#gstDiv').hide();
			$('#igstDiv').show();
			$('.igstTaxAmount').show();
			$('.gstTaxAmount').hide();
		}
	}
}

function getStateList(element) {
	debugger;
	$('#' + element.id).autocomplete({
		source: function(request, response) {
			$.ajax({
				url: 'getStateSetupList',
				data: {
					'autoCompleteSTR': request.term,
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
								label: i[0] + "-" + i[1],
								value: i[0] + "-" + i[1]
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
}

$(document).on("keypress", ".itemName", function() {
	$('.itemName').autocomplete({
		source: function(request, response) {
			$.ajax({
				url: 'getItemAutoCompleteForSales',
				data: {
					'autoCompleteSTR': request.term,
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
								label: i[0],
								value: i[1]
							};
						}));
					}
				},
			});
		},
		select: function(event, ui) {
			event.preventDefault();
			$(this).val(ui.item.label);
			$(this).parent().find("input:hidden:first").val(ui.item.value);
		},
		appendTo: '#addSales',
		autoFocus: true,
		delay: 100,
	});
});