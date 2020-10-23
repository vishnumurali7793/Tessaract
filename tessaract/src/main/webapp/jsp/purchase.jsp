<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="resources/js/purchase/Purchase.js"></script>
<%-- <script type="text/javascript" src="resources/jquery/jquery-3.5.0.js"></script> --%>
<%-- <script type="text/javascript" src="resources/jquery-ui/jquery-ui.js"></script> --%>
<%-- <script type="text/javascript" --%>
<%-- 	src="resources/bootstrap/js/bootstrap.min.js"></script> --%>

<!-- <link rel="stylesheet" type="text/css" -->
<!-- 	href="resources/bootstrap/css/bootstrap.min.css"> -->
<!-- <link rel="stylesheet" type="text/css" href="resources/jquery-ui/jquery-ui.css"> -->
<!-- <link rel="stylesheet" type="text/css" href="resources/jquery-ui/jquery-ui.structure.css"> -->
<!-- <link rel="stylesheet" type="text/css" href="resources/jquery-ui/jquery-ui.theme.css"> -->
<!-- <title>tessaract</title> -->
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
	

	function addvendor() {
		$('#productModal #modalTitle').html("Add items to purchase bill");
		$.ajax({
			type : "GET",
			url : "getmodalForPurchase",
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
	<%-- <nav class="navbar navbar-inverse bar">
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
						<li class="active"><a href="goToPurchase">Purchase</a></li>
						<li><a href="goToSales">Sales</a></li>
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
	</nav> --%>
	<div class="container-fluid">
		<%--<div class="row">
			 <div class="panel">
				<h2>PURCHASE</h2>
				<div class="panel-group" id="accordion">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapse1">Add Vendor</a>
							</h4>
						</div>
						<div id="collapse1" class="panel-collapse collapse in">
							<div class="panel-body ">
								<s:form action="">
									<div class="row">
										<div class="col-md-12">
											<button type="button" class="btn btn-primary"
												data-toggle="modal" onclick="addvendor()">Add new bill</button>
										</div>
									</div>
									
							</div>
							
							
							<div class="row">
								<table class="table">
									<thead>
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
									<!-- ***list name from redirectaction*** -->
										<s:if test="purchaseList!=null && purchaseList.size()>0">

											<s:iterator value="purchaseList" status="row">
												<tr>
													<td><s:property value="#row.count" /></td>
													<td><s:property value="invoice" />&</br>
													    <s:property value="invoiceDate" />
													</td>
													<td><s:property value="purBillNo" />&</br>
													    <s:property value="purchaseDate" /></td>
													<td><s:property value="vendor.vendorCode" /></br>
													    <s:property value="vendor.vendorName" />,
													    <s:property value="vendor.address1" />,
													    <s:property value="vendor.contact" />,
													    <s:property value="vendor.pin" />
													</td>
													<td><s:property value="gstCode" /></td>
													<td>GOLD :<s:property value="goldRate" /></br>
												    	SILVER :<s:property value="silverRate" /></br>
													    PLATINUM :<s:property value="platinumRate" />
													</td>
													<td>
													<a href="editPurchaseDetails?purchaseBean.purchaseId=<s:property value="purchaseId" />" src="tessaract/src/main/webapp/images/edit.png">EDIT</a>
													</td>
													

												</tr>
											</s:iterator>


										</s:if>
								</table>
							</div>
							</s:form>
						</div>
					</div>
				</div>
			</div>
			<div class="panel panel-primary">
					<div class="panel-heading" role="tab" id="collapse-two">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion"
								class="collapsed" role="button" aria-expanded="true"
								aria-controls="collapse2" href="#collapse2">Vendor Details</a>
						</h4>
					</div>
					<div id="collapse2" class="panel-collapse collapse in"
						role="tabpanel" aria-labelledby="collapse-two">
						<div class="panel-body">
							<div class="container">
								<h2>Vendor Table</h2>
								<table class="table">
									<thead>
										<tr>
											<th>#</th>
											<th>VENDOR CODE</th>
											<th>VENDOR NAME</th>
											<th>VENDOR ADDRESS</th>
											<th>VENDOR CONTACT</th>
											<th>DATE</th>
											<th>Active Status</th>
											<th>Actions</th>
										</tr>
									</thead>
									<tbody>
										<!-- ***list name from redirectaction*** -->
										<s:if test="vendorList!=null && vendorList.size()>0">
											<s:iterator value="vendorList" status="row">
												<tr>
													<td><s:property value="#row.count" /></td>
													<td><s:property value="vendorCode" /></td>
													<td><s:property value="vendorName" /></td>
													<td><s:property value="address1" /><br> <s:property
															value="address2" /><br> <s:property value="pin" /></td>
													<td><s:property value="contact" /></td>
													<td><s:property value="addedOn" /></td>
													<td><s:property value="activeStatus" /></td>
													<td><button class="btn-xs btn-link"
															onclick="editVendor('<s:property value="vendorId"/>')">[EDIT]</button>
														<button class="btn-xs btn-link"
															onclick="deleteVendor('<s:property value="vendorId"/>')">[DELETE]</button></td>
												</tr>
											</s:iterator>
										</s:if>
									</tbody>
								</table>
							</div>
						</div>
					</div>
		</div> --%>
		<div class="row">
			<div class="col-sm-12 col-md-12 col-lg-12 col-xl-12 mt-15 ml-15">
				<button class="btn btn-sm form-btn-purple pull-right mr-30" onclick="addNewPurchaseBill();">Add New Purchase&nbsp;
					<i class="fa fa-plus text-20" aria-hidden="true"></i>
				</button>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-12 col-md-12 col-lg-12 col-xl-12 ml-15">
				<div class="panel-group m-all-15">
					<div class="panel panel-default form-panel-primary">
						<div class="panel-heading">Purchase Details</div>
						<div class="panel-body">
							<table class="table mt-15">
								<thead>
									<tr class="info">
										<th>#</th>
										<th>INVOICE NO & DATE</th>
										<th>BILL NO & DATE</th>
										<th>VENDOR DETAILS</th>
										<th>GST CODE</th>
										<th>RATE</th>
										<th>ACTIONS</th>
									</tr>
								</thead>
								<!-- ***list name from redirectaction*** -->
								<s:if test="purchaseList!=null && purchaseList.size()>0">
	
									<s:iterator value="purchaseList" status="row">
										<tr class="default">
											<td><s:property value="#row.count" /></td>
											<td><s:property value="invoice" />&</br> <s:property
													value="invoiceDate" /></td>
											<td><s:property value="purBillNo" />&</br> <s:property
													value="purchaseDate" /></td>
											<td><s:property value="vendor.vendorCode" /></br> <s:property
													value="vendor.vendorName" />, <s:property
													value="vendor.address1" />, <s:property
													value="vendor.contact" />, <s:property value="vendor.pin" />
											</td>
											<td><s:property value="gstCode" /></td>
											<td>GOLD :<s:property value="goldRate" /></br> SILVER :<s:property
													value="silverRate" /></br> PLATINUM :<s:property
													value="platinumRate" />
											</td>
											<td><a
												href="editPurchaseDetails?purchaseBean.purchaseId=<s:property value="purchaseId" />"
												src="tessaract/src/main/webapp/images/edit.png">EDIT</a></td>
	
	
										</tr>
									</s:iterator>
	
	
								</s:if>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="productModal" role="dialog">
		<div class="modal-dialog modal-dialog-centered modal-lg">
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