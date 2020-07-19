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
<title></title>
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
	<div class="container-fluid">
		<div class="row">
			<div class="col-xs-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3>Purchase Return</h3>
					</div>
					<div class="panel-body content-body">
						<div class="row">
							<div class="col-xs-2" align="center">
								<form action="getPurchaseBillById">
									<div class="input-group">
										<input type="text" class="form-control" placeholder="Search"
											value='<s:property value = "billno" />' name="billno"
											id="txtSearch" />
										<div class="input-group-btn">
											<button class="btn btn-primary" type="submit">
												<span class="glyphicon glyphicon-search"></span>
											</button>
										</div>
									</div>
								</form>
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-xs-12">
								<s:if
									test="(purchaseList!=null && purchaseList.size()>0) || (purchases!=null && purchases.size()>0)">
									<table class="table table-bordered">
										<thead class="table-bg">
											<tr>
												<th>#</th>
												<th>INVOICE NO & DATE</th>
												<th>BILL NO & DATE</th>
												<th>VENDOR DETAILS</th>
												<th>GST CODE</th>
												<th>RATE</th>
												<th>ACTIONS</th>
											</tr>
										</thead>
										<tbody class="table-body">
											<s:if test="purchaseList!=null && purchaseList.size()>0">
												<s:iterator value="purchaseList" status="row">
													<tr>
														<td><s:property value="#row.count" /></td>
														<td><s:property value="invoice" />&</br> <s:property
																value="invoiceDate" /></td>
														<td><s:property value="purBillNo" />&</br> <s:property
																value="purchaseDate" /></td>
														<td><s:property value="vendor.vendorCode" /></br> <s:property
																value="vendor.vendorName" />, <s:property
																value="vendor.address1" />, <s:property
																value="vendor.contact" />, <s:property
																value="vendor.pin" /></td>
														<td><s:property value="gstCode" /></td>
														<td>GOLD :<s:property value="goldRate" /></br> SILVER :<s:property
																value="silverRate" /></br> PLATINUM :<s:property
																value="platinumRate" />
														</td>
														<td><div align="center">
																<a class="glyphicon glyphicon-share-alt"
																	style="font-size: 20px; margin-top: 12px; color: #4CAF50;"
																	href="getPurchaseBillById?purchaseBean.purchaseId=<s:property value="purchaseId" />"></a>
															</div></td>
													</tr>
												</s:iterator>
											</s:if>
											<s:elseif test="purchases!=null && purchases.size()>0">
												<s:iterator value="purchases" status="row">
													<tr>
														<td><s:property value="#row.count" /></td>
														<td><s:property value="invoice" />&</br> <s:property
																value="invoiceDate" /></td>
														<td><s:property value="purBillNo" />&</br> <s:property
																value="purchaseDate" /></td>
														<td><s:property value="vendor.vendorCode" /></br> <s:property
																value="vendor.vendorName" />, <s:property
																value="vendor.address1" />, <s:property
																value="vendor.contact" />, <s:property
																value="vendor.pin" /></td>
														<td><s:property value="gstCode" /></td>
														<td>GOLD :<s:property value="goldRate" /></br> SILVER :<s:property
																value="silverRate" /></br> PLATINUM :<s:property
																value="platinumRate" />
														</td>
														<td><div align="center">
																<a class="glyphicon glyphicon-share-alt"
																	style="font-size: 20px; margin-top: 12px; color: #4CAF50;"
																	href="getPurchaseBillById?purchaseBean.purchaseId=<s:property value="purchaseId" />"></a>
															</div></td>
													</tr>
												</s:iterator>
											</s:elseif>
										</tbody>
									</table>
								</s:if>
								<s:else>
									<div align="center">-- No Data Found --</div>
								</s:else>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>