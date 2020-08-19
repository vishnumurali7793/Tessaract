<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="resources/jquery/jquery-3.5.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="resources/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/form-styles.css">
<title><tiles:insertAttribute name="title" ignore="true" /></title>
</head>
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
				<div class="col-md-12 col-sm-12">
					<ul class="nav nav-tabs" style="font-size: 12px;">
						<li class="nav-item"><a class="nav-link active primary"
							href="goToTaxMaster">Taxes</a></li>
						<li class="nav-item"><a class="nav-link" href="goToCategory">Categories</a></li>
						<li class="nav-item"><a class="nav-link" href="goToProduct">Products</a></li>
						<li class="nav-item"><a class="nav-link" href="goToModel">Models</a>
						<li class="nav-item"><a class="nav-link" href="goToCarat">Carats</a>
						<li class="nav-item"><a class="nav-link" href="goToRate">Rates</a>
						<li class="nav-item"><a class="nav-link" href="goToCustomer">Customers</a>
						<li class="nav-item"><a class="nav-link" href="goToVendor">Vendors</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<tiles:insertAttribute name="body" />
			</div>
		</div>
	</div>
</body>
</html>