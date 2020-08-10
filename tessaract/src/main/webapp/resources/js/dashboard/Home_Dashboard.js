$(document).ready(function(){
	getOverallSalesDetails();
	getTodaysSalesDetails();
});

function getOverallSalesDetails(){
	$.ajax({
		type: "GET",
		url: "getAllSalesData",
		success: function(data){
			$('#overallSalesCount').html(data[0][0]);
			$('#overallSalesAmount').html(parseFloat(data[0][1]).toFixed(2));
		},
	});
}

function getTodaysSalesDetails(){
	$.ajax({
		type: "GET",
		url: "getTodaysSalesData",
		success: function(data){
			$('#todaysSalesCount').html(data[0][0]);
			$('#todaysSalesAmount').html(parseFloat(data[0][1]).toFixed(2));
		},
	});
}