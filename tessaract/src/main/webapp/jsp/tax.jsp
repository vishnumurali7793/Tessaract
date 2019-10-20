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
						<li class="active"><a href="goToTaxMaster">Tax Master</a></li>
						<li><a href="#">Page 1-2</a></li>
						<li><a href="#">Page 1-3</a></li>
					</ul></li>
				<li><a href="#">Page 2</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<%-- <li><a href="#"><span class="glyphicon glyphicon-user"></span>
						Sign Up</a></li> --%>
				<li><a href="logout"><span
						class="glyphicon glyphicon-log-out"></span> Logout</a></li>
			</ul>
		</div>
	</nav>
	<div class="container-fluid">
		<div class="row">
			<div class="panel">
				<h2>Tax Master</h2>
				<div class="panel-group" id="accordion">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapse1">Add TAX</a>
							</h4>
						</div>
						<div id="collapse1" class="panel-collapse collapse in">
							<div class="panel-body ">
								<s:form action="addTax">
									<div class="tax">
										<div class="col-xs-2">
											<div class="tax-row">
												<input type="text" placeholder="SGST" name="taxBean.sgst" />
											</div>
										</div>
										<div class="col-xs-2">
											<div class="tax-row">
												<input type="text" placeholder="CGST" name="taxBean.cgst" />
											</div>
										</div>
										<div class="col-xs-2">
											<div class="tax-row">
												<input type="text" placeholder="IGST" name="taxBean.igst" />
											</div>
										</div>
										<div class="col-xs-5">
											<div class="form-group form-group-sm">
												<div class="col-xs-6">
													<input type="date" name="taxBean.addedOn"
														value="dd/mm/yyyy" placeholder="Date" />
												</div>
												<div class="col-xs-6">
													<select class="form-control" name="taxBean.activeStatus">
														<option></option>
														<option>Active</option>
														<option>De-active</option>
													</select>
												</div>
											</div>

										</div>
										<div class="col-xs-1" id="submitButton">
											<button type="submit" class="btn btn-warning">
												<span class="glyphicon glyphicon-save"></span>&nbsp;Add
											</button>
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
								aria-controls="collapse2" href="#collapse2">Tax Details</a>
						</h4>
					</div>
					<div id="collapse2" class="panel-collapse collapse" role="tabpanel"
						aria-labelledby="collapse-two">
						<div class="panel-body">
							<div class="container">
								<h2>Tax Table</h2>
								<table class="table">
									<thead>
										<tr>
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
											<tr>
												<s:iterator value="taxList" status="row">
													<td><s:property value="#row.count" /></td>
													<td><s:property value="cgst" /></td>
													<td><s:property value="sgst" /></td>
													<td><s:property value="igst" /></td>
													<td><s:property value="cgst + sgst" /></td>
													<td><s:property value="activeStatus" /></td>
													<td><s:property value="addedOn" /></td>
													<td><button>TEST</button></td>
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