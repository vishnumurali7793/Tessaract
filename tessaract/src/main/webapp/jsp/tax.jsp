<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- <script type="text/javascript" src="resources/jquery/jquery-3.5.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="resources/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/form-styles.css"> --%>
<title>Tesseract</title>
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

.tax {
	justify-content: center;
	align-items: center;
}
</style>
<script type="text/javascript">
	function deleteTax(taxid) {
		location.href = "deleteTax?taxBean.taxId=" + taxid;
	}

	function toggleTableContainer() {
		$('#tableContainer').toggle();
	}
</script>
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
						<li class="active"><a href="goToTaxMaster">Tax Master</a></li>
						<li><a href="goToCategory">Category</a></li>
						<li><a href="#">Page 1-2</a></li>
						<li><a href="#">Page 1-3</a></li>
					</ul></li>
				<li><a href="#">Page 2</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="logout"><span
						class="glyphicon glyphicon-log-out"></span> Logout</a></li>
			</ul>
		</div>
	</nav>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<ul class="nav nav-tabs" style="font-size: 12px;">
					<li class="nav-item"><a class="nav-link active primary" href="goToTaxMaster">Taxes</a></li>
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
	</div> --%>
	<div class="container">
		<div class="row">
			<div class="col-md-12 mt-15">
				<h3 align="center">Tax Master</h3>
			</div>
		</div>
		<div class="row">
			<div class="panel-group m-all-15">
				<div class="panel panel-default form-panel-primary">
					<div class="panel-heading">Add Tax</div>
					<div class="panel-body">
						<s:form action="addTax">
							<div class="row">
								<div class="col-md-4">
									<div class="form-group m-all-15">
										<label for="sgst">SGST</label> <input name="taxBean.sgst"
											type="text" class="validate input-sm form-control"
											placeholder="SGST" id="sgst" />
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group m-all-15">
										<label for="cgst">CGST</label> <input name="taxBean.cgst"
											type="text" class="validate input-sm form-control"
											placeholder="CGST" id="cgst" />
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group m-all-15">
										<label>IGST</label> <input name="taxBean.igst" type="text"
											class="validate input-sm form-control" placeholder="IGST" />
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group m-all-15">
										<label for="datePicker">Date </label> <input name="taxBean.addedOn"
											type="date" class="input-sm form-control"
											required="required" id="datePicker">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group m-all-15">
										<label for="activeStatus">Active Status</label> <select
											class="custom-select form-control" id="activeStatus"
											name="taxBean.activeStatus">
											<option selected>--Select from the list--</option>
											<option value="Active">Active</option>
											<option value="Inactive">Inactive</option>
										</select>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group m-all-15 pull-right">
										<button onclick="toggleTableContainer();"
											class="btn btn-sm  form-control form-btn-purple"
											type="button">
											View Saved &nbsp;<span class="glyphicon glyphicon-list-alt"
												style="font-size: 12px;"> </span>
										</button>
									</div>
									<div class="form-group mt-15 pull-right">
										<button
											class="btn btn-sm btn-success form-control form-btn-success"
											type="submit">
											Submit &nbsp;<span class="glyphicon glyphicon-save"
												style="font-size: 12px;"></span>
										</button>
									</div>
								</div>
							</div>
						</s:form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container" hidden="true" id="tableContainer">
		<div class="row">
			<div class="panel-group m-all-15">
				<div class="panel panel-default form-panel-primary">
					<div class="panel-heading">View Tax Details</div>
					<div class="panel-body">
						<table class="table table-bordered">
							<thead>
								<tr class="info">
									<th>#</th>
									<th>CGST %</th>
									<th>SGST %</th>
									<th>IGST %</th>
									<th>GST %</th>
									<th>Active Status</th>
									<th>Added On</th>
									<th>Actions</th>
								</tr>
							</thead>
							<tbody>
								<s:if test="taxList!=null && taxList.size()>0">
									<s:iterator value="taxList" status="row">
										<tr class="default">
											<td><s:property value="#row.count" /></td>
											<td><s:property value="cgst" /></td>
											<td><s:property value="sgst" /></td>
											<td><s:property value="igst" /></td>
											<td><s:property value="cgst + sgst" /></td>
											<td><s:property value="activeStatus" /></td>
											<td><s:property value="addedOn" /></td>
											<td><button class="btn-xs btn-link"
													onclick="deleteTax('<s:property value="taxId"/>')">
													<span class="glyphicon glyphicon-trash"
														style="color: #f11c1c; font-size: 15px; text-align: center;"></span>
												</button></td>
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
</body>
</html>