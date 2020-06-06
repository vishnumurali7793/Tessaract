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
<link rel="stylesheet" type="text/css" href="resources/jquery-ui/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="resources/jquery-ui/jquery-ui.structure.css">
<link rel="stylesheet" type="text/css" href="resources/jquery-ui/jquery-ui.theme.css">
<title>tessaract</title>
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
</style>
<script type="text/javascript">
	function editVendor(venid) {
		location.href = "editVendor?vendorBean.vendorId=" + venid;
	}
	function deleteVendor(venid) {
		location.href = "deleteVendor?vendorBean.vendorId=" + venid;
	}
	

	function addcustomer() {
		$('#productModal #modalTitle').html("Add items to sales bill");
		$.ajax({
			type : "GET",
			url : "getmodalForSales",
			beforeSend : function() {
				$('#productModal .modal-body').html('Loading..');
			},
			success : function(msg) {
				$('#productModal .modal-body').html(msg);
			}
		});
		$('#productModal').modal('show');
		return false;
	}
</script>

<%-- <header
	class="navbar navbar-expand navbar-dark flex-column flex-md-row bd-navbar"
	id="allign">
	TAX -
	<s:property value="loginBean.userName" />
</header> --%>
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
			<div class="panel">
				<h2>SALES</h2>
				<div class="panel-group" id="accordion">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapse1">Add Customer</a>
							</h4>
						</div>
						<div id="collapse1" class="panel-collapse collapse in">
							<div class="panel-body ">
								<s:form action="">
									<div class="row">
										<div class="col-md-12">
											<button type="button" class="btn btn-primary"
												data-toggle="modal" onclick="addcustomer()">Add new bill</button>
										</div>
									</div>
									
							</div>
							
							
							<div class="row">
								<table class="table">
									<thead>
										<tr>
											<th>#</th>
											<th>INVOICE NO & DATE</th>
											<th>CUSTOMER DETAILS</th>
											<th>GST CODE</th>
											<th>RATE</th>
											<th>ACTIONS</th>
										</tr>
									</thead>
									<!-- ***list name from redirectaction*** -->
										<s:if test="salesBaseList!=null && salesBaseList.size()>0">

											<s:iterator value="salesBaseList" status="row">
												<tr>
													<td><s:property value="#row.count" /></td>
													<td><s:property value="invoice" />&</br>
													    <s:property value="invoiceDate" />
													</td>
													<td><s:property value="customerId.customerName" /></br>
													    <s:property value="customerId.address1" />,
													    <s:property value="customerId.address2" />,
													    <s:property value="customerId.contact" />,
													    <s:property value="customerId.pin" />
													</td>
													<td><s:property value="gstCode" /></td>
													<td>GOLD :<s:property value="goldRate" /></br>
												    	SILVER :<s:property value="silverRate" /></br>
													    PLATINUM :<s:property value="platinumRate" />
													</td>
													<td>
													<a href="editsalesDetails?salesBase.salesId=<s:property value="salesId" />" src="tessaract/src/main/webapp/images/edit.png">EDIT</a>
													</td>
													

												</tr>
											</s:iterator>


										</s:if>
										<s:else>
									<p>	----------no sales added-------------------</p>
										</s:else>
								</table>
							</div>
							</s:form>
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</div>
	</div>
	<div class="modal fade" id="productModal" role="dialog">
		<div class="modal-dialog modal-lg modal-xl">
			<div class="modal-content">
				<div class="modal-header" style="background-color:  #581845;">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" align="center">
						<span style="color: white;" class="" id="modalTitle"></span>
					</h4>
				</div>
				<div class="modal-body"></div>
			</div>
		</div>
	</div>
</body>
</html>