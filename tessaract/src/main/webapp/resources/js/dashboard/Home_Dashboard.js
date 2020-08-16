$(document).ready(function() {
	getStockDetails();
	getOverallSalesDetails();
	getTodaysSalesDetails();
	getDataPoints("ST"); //fetching x, y co-ordinates for the sales trend(ST) chart
	getDataPoints("PSD"); //fetching x, y co-ordinates for the sales Vs purchase chart
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

function loadChart(salesDataPoints, purchaseDataPoints, fetchType) {
	if (fetchType === "ST") {
		plotSalesTrend(salesDataPoints);
	} else if (fetchType === "PSD") {
		 plotPurchaseVsSalesData(salesDataPoints, purchaseDataPoints);
	}
}

//plotting sales trend graph
function plotSalesTrend(salesTrendDataPoints){
	var chart = new CanvasJS.Chart("salesChartContainer", {
		animationEnabled: true,
		theme: "light2",
		title : {
			text : "Sales Details",
			fontSize: 15,
		},
		axisX: {
			title: "Date",
			titleFontSize: 10,
			includeZero: false,
			valueFormatString: "DD MM YY"
		},
		axisY: {
			title: "Count",
			titleFontSize: 10,
			includeZero: true,
			suffix: " Nos."
		},
		data : [ {
			type : "spline",
			dataPoints : salesTrendDataPoints
		} ]
	});

	chart.render();
}

//plotting sales vs purchase graph
function plotPurchaseVsSalesData(salesDataPoints, purchaseDataPoints){
	var chart = new CanvasJS.Chart("purchaseVsSalesChartContainer", {
		animationEnabled: true,
		theme: "light2",
		title : {
			text : "Sales vs Purchase Details",
			fontSize: 15,
		},
		axisX: {
			title: "Date",
			titleFontSize: 10,
			includeZero: false,
			valueFormatString: "DD MMM YY"
		},
		axisY: {
			title: "Amount",
			titleFontSize: 10,
			includeZero: true,
			prefix: "\u20B9 "
		},
		toolTip:{
			shared:true
		},
		data : [ {
			type : "line",
			showInLegend: true,
			name: "Sales",
			yValueFormatString: "#,##0\u20B9",
			dataPoints : salesDataPoints
		}, {
			type : "line",
			showInLegend: true,
			name: "Purchase",
			lineDashType: "dash",
			yValueFormatString: "#,##0\u20B9",
			dataPoints : purchaseDataPoints
		} ]
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

function getDataPoints(fetchType) {
	var salesDataPointsForSalesTrend = [];
	var salesDataPointsForPvsS = [];
	var purchaseDataPoints = [];
	$.ajax({
		type : "GET",
		async : true,
		url : "getAllSalesDataDateWise",
		data : {
			'fetchType' : fetchType,
		},
		success : function(data) {
			$.map(data, function(v) {
				if (fetchType === "ST") {
					salesDataPointsForSalesTrend.push({
						'x' : new Date(v[0]),
						'y' : v[1]
					});
				} else if (fetchType === "PSD") {
					salesDataPointsForPvsS.push({
						'x' : new Date(v[0]),
						'y' : v[1]
					});
				}
			});
			if (fetchType === "ST") {
				loadChart(salesDataPointsForSalesTrend, purchaseDataPoints, fetchType);
			} else if (fetchType === "PSD") {
				$.ajax({
					type : "GET",
					async : true,
					url : "getAllPurchaseDataDateWise",
					success : function(data) {
						$.map(data, function(v) {
							purchaseDataPoints.push({
								'x' : new Date(v[0]),
								'y' : v[1]
							});
						});
						loadChart(salesDataPointsForPvsS, purchaseDataPoints, fetchType);
					}
				});
			}
		},
	});
}