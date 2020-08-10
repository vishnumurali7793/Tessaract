<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
<script type="text/javascript"
	src="resources/jquery/jquery-3.5.0.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="resources/bootstrap/css/bootstrap.min.css">
<script type="text/javascript"
	src="resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/canvasjs/canvasjs.min.js"></script>
<script type="text/javascript"
	src="resources/js/dashboard/Home_Dashboard.js"></script>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	/* background: rgb(196, 85, 42);
	background: linear-gradient(90deg, rgba(196, 85, 42, 1) 10%,
		rgba(195, 12, 157, 1) 100%); */
	background-color: #f7f7f7;
}

.bar {
	border-radius: 0px;
}

/* for dashboard */
.layer_1 {
	height: 50px;
	font-size: 22px;
	line-height: 1px;
	padding-top: 25px;
	color: #ffffff;
	border-radius: 4px 4px 0px 0px;
	text-align: center;
	line-height: 1px;
}

.layer_2 {
	height: 30px;
	font-size: 14px;
	line-height: 1px;
	padding-top: 8px;
	color: #ffffff;
	background-color: rgba(0, 0, 0, 0.2);
	text-align: center;
	line-height: 1px;
}

.layer_3 {
	height: 30px;
	font-size: 15px;
	line-height: 1px;
	padding: 14px;
	color: #ffffff;
	border: none;
	text-align: center;
	vertical-align: middle;
}

.mt-10 {
	margin-top: 10px;
}

.stock-panel {
	margin-top: 30px;
}

#stock-heading {
	background-color: white;
	color: #696969;
	font-weight: bold;
	font-size: 20px;
}

#stock-body {
	background-color: #e8e8e8;
}
</style>
</head>
<body>
	<nav class="navbar navbar-inverse bar">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="goToHome">Tesseract</a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="goToHome">Home</a></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">Master <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="goToTaxMaster">Tax</a></li>
						<li><a href="goToCategory">Category</a></li>
						<li><a href="goToProduct">Product</a></li>
						<li><a href="goToModel">Model</a></li>
						<li><a href="goToCarat">Carat</a></li>
						<li><a href="goToRate">Rate</a></li>
						<li><a href="goToCustomer">Customer</a></li>
						<li><a href="goToVendor">Vendor</a></li>
						<li><a href="#">Page 1-2</a></li>
						<li><a href="#">Page 1-3</a></li>
					</ul></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">Transanctions <span
						class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="goToPurchase">Purchase</a></li>
						<li><a href="goToPurchaseReturn">PurchaseReturn</a></li>
						<li><a href="goToSales">Sales</a></li>
						<li><a href="goToSalesReturn">SalesReturn</a></li>
					</ul></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="logout"><span
						class="glyphicon glyphicon-log-out"></span> Logout</a></li>
			</ul>
		</div>
	</nav>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-9">
				<div class="col-lg-3 col-md-4 col-sm-6">
					<div class="div_style" style="border: none;">
						<div class="layer_1"
							style="background-color: #005075; text-align: right;">
							<div style="font-size: 40px; font-weight: bold; margin: 10px;">
								<span id="overallSalesCount"></span><font size="5px;">Nos.</font>
							</div>
						</div>
						<div class="layer_2" style="background-color: #005075;">
							<div style="font-weight: bold;">
								&#8377;<span id="overallSalesAmount"></span>
							</div>
						</div>
						<div class="layer_3"
							style="background-color: #05435f; font-size: 12px; padding: 15px;">Overall
							Sales</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6">
					<div class="div_style" style="border: none;">
						<div class="layer_1"
							style="background-color: #0071A9; text-align: right;">
							<div style="font-size: 40px; font-weight: bold; margin: 10px;">
								<span id="todaysSalesCount"></span><font size="5px;">Nos.</font>
							</div>
						</div>
						<div class="layer_2" style="background-color: #0071A9;">
							<div style="font-weight: bold;">
								&#8377;<span id="todaysSalesAmount"></span>
							</div>
						</div>
						<div class="layer_3"
							style="background-color: #0a5e87; font-size: 12px; padding: 15px;">Today's
							sales</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6">
					<div class="div_style" style="border: none;">
						<div class="layer_1" style="background-color: #33aea7;">
							<div style="padding-right: 6%; margin-top: 7px;"></div>
						</div>
						<div class="layer_2" style="background-color: #33aea7;"></div>
						<div class="layer_3"
							style="background-color: #009d97; font-size: 12px; padding: 15px;"
							onclick='getSummaryDetails("I")'>--</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6">
					<div class="div_style" style="border: none;">
						<div class="layer_1" style="background-color: #86cbb3;">
							<div style="padding-right: 6%; margin-top: 7px;">
								<!-- <span class="glyphicon glyphicon-paste"
								title="Pending Proposals In Finance"></span> <b><s:property
									value="financialSanction.finForwarded" /></b> -->
							</div>
						</div>
						<div class="layer_2" style="background-color: #86cbb3;"></div>
						<div class="layer_3"
							style="background-color: #7ec2aa; font-size: 12px; padding: 15px;"
							onclick='getSummaryDetails("P")'>--</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="panel panel-default stock-panel">
						<div class="panel-heading" id="stock-heading">Stock</div>
						<div class="panel-body" id="stock-body"></div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="panel panel-default stock-panel">
						<div class="panel-heading" id="stock-heading">Sales Trend</div>
						<div class="panel-body" id="stock-body">
							<div id="chartContainer" style="height: 300px; width: 100%;"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-3 col-lg-3">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="div_style" style="border: none;">
						<div class="layer_1" style="background-color: #c5cd5d;">
							<div class="col-md-12">
								<span>test</span>
							</div>
						</div>
						<div class="layer_2" style="background-color: #c5cd5d;">
							<div class="col-md-12">
								<span>test</span>
							</div>
						</div>
						<div class="layer_3"
							style="background-color: #bcc747; font-size: 12px; padding: 15px;"
							onclick='getSummaryDetails("RJ")'>Gold Rate</div>
					</div>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 mt-10">
					<div class="div_style" style="border: none;">
						<div class="layer_1" style="background-color: #fa3568;">
							<div style="padding-right: 6%; margin-top: 7px;">
								<!-- <span class="glyphicon glyphicon-remove-circle"
								title="Rejected Proposals"></span> <b><s:property
									value="financialSanction.rejected" /></b> -->
							</div>
						</div>
						<div class="layer_2" style="background-color: #fa3568;"></div>
						<div class="layer_3"
							style="background-color: #f2295d; font-size: 12px; padding: 15px;"
							onclick='getSummaryDetails("RJ")'>Silver Rate</div>
					</div>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 mt-10">
					<div class="div_style" style="border: none;">
						<div class="layer_1" style="background-color: #fe5ff0;">
							<div style="padding-right: 6%; margin-top: 7px;">
								<!-- <span class="glyphicon glyphicon-remove-circle"
								title="Rejected Proposals"></span> <b><s:property
									value="financialSanction.rejected" /></b> -->
							</div>
						</div>
						<div class="layer_2" style="background-color: #fe5ff0;"></div>
						<div class="layer_3"
							style="background-color: #f854e9; font-size: 12px; padding: 15px;"
							onclick='getSummaryDetails("RJ")'>Platinum Rate</div>
					</div>
				</div>
			</div>
			<!-- 			<div class="container"> -->
			<!-- 			<div class="row"> -->
			<!-- 				<div id="chartContainer" style="height: 300px; width: 100%;"></div> -->
			<!-- 			</div> -->
			<!-- 		</div> -->
		</div>
	</div>
</body>
</html>