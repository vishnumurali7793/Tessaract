<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12 mt-15">
				<h3 align="center">Vendor Master</h3>
			</div>
		</div>
		<div class="row">
			<div class="panel-group m-all-15">
				<div class="panel panel-default form-panel-primary">
					<div class="panel-heading">Add Vendor</div>
					<div class="panel-body">
						<s:form action="saveVendor">
							<div class="row">
								<s:hidden name="vendorBean.vendorId" />
								<div class="col-md-4">
									<div class="form-group m-all-15">
										<label for="vendorCode">Vendor Code</label> <input
											name="vendorBean.vendorCode" type="text" id="vendorCode"
											value="<s:property value="vendorBean.vendorCode"/>"
											class="validate form-control input-sm"
											placeholder="vendorCode">
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group m-all-15">
										<label for="vendorName">Vendor Name</label> <input
											name="vendorBean.vendorName" type="text" id="vendorName"
											value="<s:property value="vendorBean.vendorName"/>"
											class="validate form-control input-sm"
											placeholder="vendorName">
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group m-all-15">
										<label for="vendorAddress1">Vendor Address-I</label> <input
											name="vendorBean.address1" type="text"
											class="validate form-control input-sm" id="vendorAddress1"
											value="<s:property value="vendorBean.address1"/>"
											placeholder="address">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-4">
									<div class="form-group m-all-15 ml-30 mr-10">
										<label for="vendorAddress2">Vendor Address-II</label> <input
											name="vendorBean.address2" type="text"
											class="validate input-sm form-control" id="vendorAddress2"
											value="<s:property value="vendorBean.address2"/>"
											placeholder="address">
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group m-all-15 ml-20 mr-20">
										<label for="contact">Contact</label> <input
											name="vendorBean.contact" type="text"
											class="validate input-sm form-control" id="contact"
											value="<s:property value="vendorBean.contact"/>"
											placeholder="contactNumber">
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group m-all-15 ml-10 mr-30">
										<label for="pinCode">PIN Code</label> <input
											name="vendorBean.pin" type="text"
											class="validate input-sm form-control" id="pinCode"
											value="<s:property value="vendorBean.pin"/>"
											placeholder="VendorPin">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-4">
									<div class="form-group m-all-15 ml-30 mr-10">
										<label for="vendorAddedOn">Added On</label><input
											name="vendorBean.addedOn" type="date"
											class="validate input-sm form-control" id="vendorAddedOn"
											value="<s:property value="vendorBean.addedOn"/>"
											required="required"> <i class="fa fa-calendar"
											style="font-size: 22px; float: right; margin: -46px auto;"></i>
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group m-all-15 ml-20 mr-20">
										<label for="activeStatus">Active Status</label> <select
											class="custom-select custom-select-sm input-sm form-control"
											id="activeStatus" name="vendorBean.activeStatus">
											<option selected>--Select from the list--</option>
											<option value="Active">Active</option>
											<option value="Inactive">Inactive</option>
										</select>
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group m-all-15">
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
					<div class="panel-heading">View Customer Details</div>
					<div class="panel-body">
						<table class="table table-bordered">
							<thead>
								<tr class="info">
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
								<s:if test="vendorList!=null && vendorList.size()>0">
									<s:iterator value="vendorList" status="row">
										<tr class="default">
											<td><s:property value="#row.count" /></td>
											<td><s:property value="vendorCode" /></td>
											<td><s:property value="vendorName" /></td>
											<td><s:property value="address1" />, <s:property
													value="address2" />, <s:property value="pin" /></td>
											<td><s:property value="contact" /></td>
											<td><s:property value="addedOn" /></td>
											<td><s:property value="activeStatus" /></td>
											<td><button class="btn-xs btn-link"
													onclick="editVendor('<s:property value="vendorId"/>')">
													<span class="glyphicon glyphicon-edit"
														style="font-size: 15px; text-align: center;"></span>
												</button>
												<button class="btn-xs btn-link"
													onclick="deleteVendor('<s:property value="vendorId"/>')">
													<span class="glyphicon glyphicon-trash"
														style="color: #f11c1c; font-size: 15px; text-align: center;"></span>
												</button></td>
										</tr>
									</s:iterator>
								</s:if>
								<s:else>
									<tr class="default">
										<td colspan="8" style="text-align: center;">-- No Data
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
</body>
<script type="text/javascript">
	function editVendor(vendorId) {
		location.href = "editVendor?vendorBean.vendorId=" + vendorId;
	}

	function deleteVendor(venid) {
		location.href = "deleteVendor?vendorBean.vendorId=" + vendorId;
	}

	function toggleTableContainer() {
		$('#tableContainer').toggle();
	}
</script>
</html>