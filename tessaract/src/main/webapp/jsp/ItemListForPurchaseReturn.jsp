<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="resources/jquery/jquery-3.5.0.js"></script>
<script type="text/javascript" src="resources/jquery-ui/jquery-ui.js"></script>
<script type="text/javascript"
	src="resources/bootstrap/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="resources/jquery-ui/jquery-ui.css">
<link rel="stylesheet" type="text/css"
	href="resources/jquery-ui/jquery-ui.structure.css">
<link rel="stylesheet" type="text/css"
	href="resources/jquery-ui/jquery-ui.theme.css">
<title>Insert title here</title>
</head>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
}

table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

td, th {
	border: 1px solid #dddddd;
	text-align: left;
	padding: 8px;
}

.bd-navbar {
	min-height: 4rem;
	background-color: #563d7c;
	box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, .05), inset 0 -1px 0
		rgba(0, 0, 0, .1);
}

#allign {
	text-align: center;
	font-weight: bold;
}

#tablecolor {
	background-color: #563d7c;
}

.bar {
	border-radius: 0px;
}

#accordion {
	max-height: 100%;
}

.panel, .tax {
	margin: 10px;
}

.element {
	margin-top: 15px;
}
/* #submitButton {
	float: right;
} */
/* #statusDropdown {
	float: right;
	align-items: left;
} */
.tax {
	justify-content: center;
	align-items: center;
}

.content-body {
	background-color: #fcfcfc;
}

.content-body .table-bg {
	background-color: #337ab7;
	color: white;
}

.content-body .table-body {
	background: #e7f4ff;
}

h3 {
	color: #337ab7;
}
</style>
<body>
	<nav class="navbar navbar-inverse bar">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="goToHome">Tesseract</a>
			</div>
			<ul class="nav navbar-nav">
				<li><a href="goToHome">Home</a></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">Master<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="goToTaxMaster">Tax</a></li>
						<li><a href="goToCategory">Category</a></li>
						<li><a href="goToProduct">Product</a></li>
						<li><a href="goToModel">Model</a></li>
						<li><a href="goToCarat">Carat</a></li>
						<li><a href="goToRate">Rate</a></li>
						<li><a href="goToCustomer">Customer</a></li>
						<li><a href="goToVendor">Vendor</a></li>
						<li><a href="goToPurchase">Purchase</a></li>
						<li class="active"><a href="goToSales">Sales</a></li>
						<li><a href="#">Page 1-3</a></li>
					</ul></li>
				<li><a href="#">Page 2</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#"><span class="glyphicon glyphicon-user"></span>
						Sign Up</a></li>
				<li><a href="logout"><span
						class="glyphicon glyphicon-log-out"></span> Logout</a></li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<center>
			<h3 style="color: green; margin-top: 300px;">
				Successfully redirected to purchase return item list view for
				billId:
				<s:property value="purchaseBean.purchaseId" />
			</h3>
		</center>
	</div>
</body>
</html>