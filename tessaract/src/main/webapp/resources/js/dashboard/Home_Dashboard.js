
$(document).ready(function() {
	getStockDetails();
	getOverallSalesDetails();
	getTodaysSalesDetails();
	loadChart();
	$('.dropdown-toggle').dropdown();

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
			if(data.size > 0){
				$('#todaysSalesCount').html(data[0][0]);
				$('#todaysSalesAmount').html(parseFloat(data[0][1]).toFixed(2));
			}else{
				$('#todaysSalesCount').html("--");
				$('#todaysSalesAmount').html("--");
			}
		},
	});
	
}

function getStockDetails() {
	$.ajax({
		type : "GET",
		url : "getStockDetails",
		success : function(data) {
			$('#stock-body').html(data);
		},
	});

}

function loadChart() {
	var chart = new CanvasJS.Chart("chartContainer", {
			title : {
				text : "Books Issued from Central Library"
			},
			data : [ {
				type : "spline",
				dataPoints : [
					{x : new Date(2012, 00, 1),y : 1352}, 
					{x : new Date(2012, 01, 1),y : 1514}, 
					{x : new Date(2012, 02, 1),y : 1321}, 
					{x : new Date(2012, 03, 1),y : 1163}, 
					{x : new Date(2012, 04, 1),y : 950}, 
					{x : new Date(2012, 05, 1),y : 1201}, 
					{x : new Date(2012, 06, 1),y : 1186}, 
					{x : new Date(2012, 07, 1),y : 1281}, 
					{x : new Date(2012, 08, 1),y : 1438}, 
					{x : new Date(2012, 09, 1),y : 1305}, 
					{x : new Date(2012, 10, 1),y : 1480}, 
					{x : new Date(2012, 11, 1),y : 1291} ]
			}
			]
	});

	chart.render();
}