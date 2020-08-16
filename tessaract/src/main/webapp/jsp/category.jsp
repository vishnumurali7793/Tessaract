<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- <script type="text/javascript" src="resources/jquery/jquery-3.5.0.min.js"></script> --%>
<!-- <link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.min.css"> -->
<%-- <script type="text/javascript" src="resources/bootstrap/js/bootstrap.min.js"></script> --%>
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
	function editCategory(catid) {
		location.href = "editCategory?categoryBean.categoryId=" + catid;
	}

	function deleteCategory(catid) {
		location.href = "deleteCategory?categoryBean.categoryId=" + catid;
	}
	function toggleTableContainer() {
		$('#tableContainer').toggle();
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
						<li class="active"><a href="goToCategory">Category</a></li>
						<li><a href="goToProduct">Product</a></li>
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

	<div class="container">
		<div class="row">
			<div class="col-md-12 mt-15">
				<h3 align="center">Category Master</h3>
			</div>
		</div>
		<div class="row">
			<div class="panel-group m-all-15">
				<div class="panel panel-default form-panel-primary">
					<div class="panel-heading">Add Category</div>
					<div class="panel-body">
						<s:form action="saveCategory">
							<div class="row">
								<s:hidden name="categoryBean.categoryId" />
								<s:hidden name="caratBean.caratId" />
								<div class="col-md-4">
									<div class="form-group m-all-15">
										<label for="categoryCode">Category code</label> <input
											name="categoryBean.categoryCode" type="text"
											value="<s:property value="categoryBean.categoryCode"/>"
											class="validate input-sm form-control"
											placeholder="CategoryCode" id="categoryCode">
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group m-all-15">
										<label for="categoryName">Category Name</label> <input
											id="categoryName" name="categoryBean.categoryName"
											type="text" class="validate input-sm form-control"
											value="<s:property value="categoryBean.categoryName"/>"
											placeholder="CategoryName">
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group m-all-15">
										<label for="select">Carat</label> <select
											class="custom-select custom-select-sm input-sm form-control"
											id="select"
											value="<s:property value="categoryBean.caratId.caratName" />"
											name="categoryBean.caratId.caratId">
											<s:iterator value="caratList" status="row">
												<option value="<s:property value='caratId'/>"><s:property
														value='caratName' /></option>
											</s:iterator>
										</select>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group m-all-15 ml-25">
										<label for="activeStatus">Active Status</label> <select
											class="custom-select custom-select-sm input-sm form-control"
											id="activeStatus" name="categoryBean.activeStatus">
											<option selected>--Select from the list--</option>
											<option value="Active">Active</option>
											<option value="Inactive">Inactive</option>
										</select>
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group mt-40 pull-right">
										<button
											class="btn btn-sm btn-success form-control form-btn-success"
											type="submit">
											Submit &nbsp;<span class="glyphicon glyphicon-save"
												style="font-size: 12px;"></span>
										</button>
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group mt-40 pull-left">
										<button onclick="toggleTableContainer();"
											class="btn btn-sm  form-control form-btn-purple"
											type="button">
											View Saved &nbsp;<span class="glyphicon glyphicon-list-alt"
												style="font-size: 12px;"> </span>
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
									<th>Category Code</th>
									<th>Carat</th>
									<th>Category Name</th>
									<th>Active Status</th>
									<th>Actions</th>
								</tr>
							</thead>
							<tbody>
								<s:if test="catList!=null && catList.size()>0">
									<s:iterator value="catList" status="row">
										<tr class="default">
											<td><s:property value="#row.count" /></td>
											<td><s:property value="categoryCode" /></td>
											<td><s:property value="caratId.caratName" /></td>
											<td><s:property value="categoryName" /></td>
											<td><s:property value="activeStatus" /></td>
											<td><button class="btn-xs btn-link"
													onclick="editCategory('<s:property value="categoryId"/>')">
													<span class="glyphicon glyphicon-edit"
														style="font-size: 15px; text-align: center;"></span>
												</button>
												<button class="btn-xs btn-link"
													onclick="deleteCategory('<s:property value="categoryId"/>')">
													<span class="glyphicon glyphicon-trash"
														style="color: #f11c1c; font-size: 15px; text-align: center;"></span>
												</button></td>
										</tr>
									</s:iterator>
								</s:if>
								<s:else>
									<tr class="default">
										<td colspan="6" style="text-align: center;">-- No Data
											Available --</td>
									</tr>
								</s:else>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>







	<%-- <div class="container-fluid">
		<div class="row">
			<div class="panel">
				<h2>CATEGORY</h2>
				<div class="panel-group" id="accordion">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapse1">Add Category</a>
							</h4>
						</div>
						<div id="collapse1" class="panel-collapse collapse in">
							<div class="panel-body ">
								<s:form action="saveCategory">
									<div class="row">
										<div class=" col s12">
											<s:hidden name="categoryBean.categoryId" />
											<s:hidden name="caratBean.caratId" />
											 
											<label>Category Code</label> <input
												name="categoryBean.categoryCode" type="text"
												value="<s:property value="categoryBean.categoryCode"/>"
												class="validate" placeholder="CategoryCode">
												
												<label>Carat</label> <select
												class="custom-select custom-select-sm" id="select"
												value="<s:property value="categoryBean.caratId.caratName" />"
												name="categoryBean.caratId.caratId">
												<s:iterator value="caratList" status="row">
													<option value="<s:property value='caratId'/>"><s:property
															value='caratName' /></option>
												</s:iterator>
											</select>
												 <label>Category
												Name</label> <input name="categoryBean.categoryName" type="text"
												class="validate"
												value="<s:property value="categoryBean.categoryName"/>"
												placeholder="CategoryName"> <label>Status</label> <select
												name="categoryBean.activeStatus"
												value="<s:property value="categoryBean.activeStatus"/>"
												required="required" class="">
												<option value="Active">Active</option>
												<option value="Inactive">Inactive</option>
											</select>&nbsp &nbsp
												<button class="waves-effect waves-light btn" type="submit">Submit</button>
											
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
								aria-controls="collapse2" href="#collapse2">Category Details</a>
						</h4>
					</div>
					<div id="collapse2" class="panel-collapse collapse in" role="tabpanel"
						aria-labelledby="collapse-two">
						<div class="panel-body">
							<div class="container">
								<h2>Category Table</h2>
								<table class="table">
									<thead>
										<tr>
											<th>#</th>
											<th>CATEGORY CODE</th>
											<th>CARAT</th>
											<th>CATEGORY NAME</th>
											<th>Active Status</th>
											<th>Actions</th>
										</tr>
									</thead>
									<tbody>
										<!-- ***list name from redirectaction*** -->
										<s:if test="catList!=null && catList.size()>0">

											<s:iterator value="catList" status="row">
												<tr>
													<td><s:property value="#row.count" /></td>
													<td><s:property value="categoryCode" /></td>
													<td><s:property value="caratId.caratName" /></td>
													<td><s:property value="categoryName" /></td>
													<td><s:property value="activeStatus" /></td>
													<td><button class="btn-xs btn-link"
															onclick="editCategory('<s:property value="categoryId"/>')">[EDIT]</button>
														<button class="btn-xs btn-link"
															onclick="deleteCategory('<s:property value="categoryId"/>')">[DELETE]</button></td>
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
	</div> --%>
</body>
</html>