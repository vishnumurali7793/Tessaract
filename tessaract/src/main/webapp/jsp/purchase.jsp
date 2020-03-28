<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jQuery.js" /></script>
<link rel='stylesheet'
	href='webjars/bootstrap/3.2.0/css/bootstrap.min.css'>
<script type="text/javascript" src="webjars/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript"
	src="webjars/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<title>tessaract</title>
<link href="css/style.css" rel="stylesheet" type="text/css">

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
		<div class="row">
			<div class="panel">
				<h2>PURCHASE SCREEN</h2>
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
								<s:form action="saveVendor">
									<div class="row">
										<div class=" col-sm-12">
											<s:hidden name="vendorBean.vendorId" />

											<div class="col-md-6">
												<label>Ivoice Number</label> <input
													name="purchaseBean.invoice" type="text"
													value="<s:property value="purchaseBean.invoice"/>"
													class="validate" placeholder="invoice"></br> <label>Bill
													No</label> <input name="purchaseBean.purBillNo" type="text"
													value="<s:property value="purchaseBean.purBillNo"/>"
													class="validate" placeholder="purBillNo"></br> <label>GST</label>
												<input name="purchaseBean.gstCode" type="text"
													value="<s:property value="purchaseBean.gstCode"/>"
													class="validate" placeholder="GST"></br> <label>Vendor
													Code</label> <input name="purchaseBean.vendor.vendorCode"
													type="text"
													value="<s:property value="purchaseBean.vendor.vendorCode"/>"
													class="validate" placeholder="vendorCode"></br> <label>Vendor
													Name</label>:<label><s:property
														value="purchaseBean.vendor.vendorName" /></label></br> <label>Vendor
													Address1</label> :<label><s:property
														value="purchaseBean.vendor.address1" /></label></br> <label>Vendor
													Address2</label> :<label><s:property
														value="purchaseBean.vendor.address2" /></label></br> <label>Vendor
													Contact</label> :<label><s:property
														value="purchaseBean.vendor.contact" /></label></br> <label>Vendor
													Pin</label>:<label><s:property
														value="purchaseBean.vendor.pin" /></label></br> <label>State </label>:<label><s:property
														value="purchaseBean.vendor.state" /></label></br>
											</div>
											<div class="col-md-6">
												<label>Date</label> <input name="purchaseBean.purchaseDate"
													type="date" class="validate"
													value="<s:property value="purchaseBean.purchaseDate"/>"
													required="required"> <i class="fa fa-calendar"
													style="font-size: 22px; float: right; margin: -46px auto;"></i></br>

												<label>GoldRate</label> <input name="purchaseBean.goldRate"
													type="text"
													value="<s:property value="purchaseBean.goldRate"/>"
													class="validate" placeholder="goldRate"></br> <label>8Gram
												</label>:<label></label></br> <label>SilverRate</label> <input
													name="purchaseBean.silverRate" type="text"
													value="<s:property value="purchaseBean.silverRate"/>"
													class="validate" placeholder="silverRate"></br> <label>10Gram
												</label>:<label></label></br> <label>PlatinumRate</label> <input
													name="purchaseBean.platinumRate" type="text"
													value="<s:property value="purchaseBean.platinumRate"/>"
													class="validate" placeholder="platinumRate"></br> <label>10Gram
												</label>:<label></label>
											</div>
											&nbsp &nbsp
											<button class="waves-effect waves-light btn" type="submit">Submit</button>

										</div>
									</div>
							<div class="row">
							<div class="container">
							<table class="table">
								<thead>
									<tr>
										<th>#</th>
										<th>HSN CODE</th>
										<th>ITEM NAME</th>
										<th>PURITY</th>
										<th>GRAM WT</th>
										<th>TOUCH</th>
										<th>NET WT</th>
										<th>RATE</th>
										<th>TOTAL AMT</th>
										<th>ACTIONS</th>
									</tr>
								</thead>
								<%int i=0;%>
								<tbody>
								<tr>
								<td><% %></td>
								</tr>
								
								</tbody>
								<%i++; %>
								</table>
								</div>
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
												<td><s:property value="address1" /></br> <s:property
														value="address2" /></br> <s:property value="pin" /></td>
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
			</div>
		</div>
	</div>
	</div>
	</div>




</body>
</html>