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
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	background: rgb(196, 85, 42);
	background: linear-gradient(90deg, rgba(196, 85, 42, 1) 10%,
		rgba(195, 12, 157, 1) 100%);
	color: white;
}

.bar {
	border-radius: 0px;
}
</style>
</head>
<script type="text/javascript">
window.onload = function () {
    var chart = new CanvasJS.Chart("chartContainer",
    {
    
      title:{
      text: "Books Issued from Central Library"
      },
       data: [
      {        
        type: "spline",
        
        dataPoints: [
        { x: new Date(2012, 00, 1), y: 1352 },
        { x: new Date(2012, 01, 1), y: 1514 },
        { x: new Date(2012, 02, 1), y: 1321 },
        { x: new Date(2012, 03, 1), y: 1163 },
        { x: new Date(2012, 04, 1), y: 950 },
        { x: new Date(2012, 05, 1), y: 1201 },
        { x: new Date(2012, 06, 1), y: 1186 },
        { x: new Date(2012, 07, 1), y: 1281 },
        { x: new Date(2012, 08, 1), y: 1438 },
        { x: new Date(2012, 09, 1), y: 1305 },
        { x: new Date(2012, 10, 1), y: 1480 },
        { x: new Date(2012, 11, 1), y: 1291 }        
        ]
      }       
        
      ]
    });

    chart.render();
  }
</script>
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
				<%-- <li><a href="#"><span class="glyphicon glyphicon-user"></span>
						Sign Up</a></li> --%>
				<li><a href="logout"><span
						class="glyphicon glyphicon-log-out"></span> Logout</a></li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<div id="chartContainer" style="height: 300px; width: 100%;"></div>
		</div>
	</div>
</body>
</html>