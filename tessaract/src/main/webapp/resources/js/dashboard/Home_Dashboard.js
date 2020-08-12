
$(document).ready(function() {
	debugger;
	getStockDetails();
	getOverallSalesDetails();
	getTodaysSalesDetails();
	loadChart();
	getRateDetails();
	getCategoryWiseSaleAmount("GD");
	getCategoryWiseSaleAmount("SL");
	
	$('.dropdown-toggle').dropdown(); //keep always on the bottom.

});

function getOverallSalesDetails(){
	$.ajax({
		type : "GET",
		async : true,
		url : "getAllSalesData",
		success : function(data){
			$('#overallSalesCount').html(data[0][0]);
			$('#overallSalesAmount').html(parseFloat(data[0][1]).toFixed(2));
		},
	});
	
}

function getTodaysSalesDetails(){
	$.ajax({
		type : "GET",
		async : true,
		url : "getTodaysSalesData",
		success : function(data){
				$('#todaysSalesCount').html(data[0][0]);
				$('#todaysSalesAmount').html(parseFloat(data[0][1]).toFixed(2));
		},
	});
	
}

function getStockDetails() {
	$.ajax({
		type : "GET",
		async : true,
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

function getRateDetails(){
	$.ajax({
		type : "GET",
		async : true,
		url : "getRateDetails",
		success : function(data) {
			$.map(data, function(v){
				if (v[2] === 'GD_22CT') {
					$('#GD_22').html(v[0]);
					$('#GD_22_A').html('&#8377;' + v[1]);
				} else if (v[2] === 'GD_24CT') {
					$('#GD_24').html(v[0]);
					$('#GD_24_A').html('&#8377;' + v[1]);
				} else if (v[2] === 'SL_22CT') {
					$('#SL_22').html(v[0]);
					$('#SL_22_A').html('&#8377;' + v[1]);
				} else if (v[2] === 'SL_24CT') {
					$('#SL_24').html(v[0]);
					$('#SL_24_A').html('&#8377;' + v[1]);
				} else if (v[2] === 'PT_22CT') {
					$('#PT_22').html(v[0]);
					$('#PT_22_A').html('&#8377;' + v[1]);
				} else if (v[2] === 'PT_24CT') {
					$('#PT_24').html(v[0]);
					$('#PT_24_A').html('&#8377;' + v[1]);
				}
			});
		},
	});
}

function getCategoryWiseSaleAmount(category) {
	$.ajax({
		type : "GET",
		async : true,
		url : "getCategoryWiseSaleAmount",
		beforeSend : function() {
			if (category === "GD") {
				$('#GD_S_CT').html('loading...');
				$('#GD_S_AMT').html('loading...');
			} else if (category === "SL") {
				$('#SL_S_CT').html('loading...');
				$('#SL_S_AMT').html('loading...');
			}
		},
		data : {
			"category.categoryCode" : category,
		},
		success : function(data) {
			if (data[0][2] === "GD") {
				$('#GD_S_CT').html(data[0][0]);
				$('#GD_S_AMT').html(data[0][1]);
			} else if (data[0][2] === "SL") {
				$('#SL_S_CT').html(data[0][0]);
				$('#SL_S_AMT').html(data[0][1]);
			}else{
				
			}
		},
	});

}