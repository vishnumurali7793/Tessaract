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
				<h3 align="center">Customer Master</h3>
			</div>
		</div>
		<div class="row">
			<div class="panel-group m-all-15">
				<div class="panel panel-default form-panel-primary">
					<div class="panel-heading">Add Customer</div>
					<div class="panel-body">
						<s:form action="saveCustomer">
							<div class="row">
								<s:hidden name="customerBean.customerId" />
								<div class="col-md-4">
									<div class="form-group m-all-15">
										<label for="customerCode">Customer Code</label><input
											id="customerCode" name="customerBean.customerCode"
											type="text"
											value="<s:property value="customerBean.customerCode"/>"
											class="validate input-sm form-control"
											placeholder="customerCode">
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group m-all-15">
										<label for="customerName">Customer Name</label><input
											id="customerName" name="customerBean.customerName"
											type="text"
											value="<s:property value="customerBean.customerName"/>"
											class="validate input-sm form-control"
											placeholder="customerName">
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group m-all-15">
										<label for="address1">Customer Address-I</label><input
											name="customerBean.address1" type="text"
											class="validate input-sm form-control" id="address1"
											value="<s:property value="customerBean.address1"/>"
											placeholder="address">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-4">
									<div class="form-group m-all-15 ml-30 mr-10">
										<label for="address2">Customer Address-II</label><input
											name="customerBean.address2" type="text"
											class="validate input-sm form-control" id="address2"
											value="<s:property value="customerBean.address2"/>"
											placeholder="address">
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group m-all-15 ml-20 mr-20">
										<label for="email">E-mail</label><input
											name="customerBean.email" type="text"
											class="validate input-sm form-control" id="email"
											value="<s:property value="customerBean.email"/>"
											placeholder="email">
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group m-all-15 ml-10 mr-30">
										<label for="contactNumber">Contact Number</label><input
											name="customerBean.contact" type="text"
											class="validate input-sm form-control" id="contactNumber"
											value="<s:property value="customerBean.contact"/>"
											placeholder="contactNumber">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-4">
									<div class="form-group m-all-15 ml-30 mr-10">
										<label for="pinCode">PIN Code</label><input
											name="customerBean.pin" type="text"
											class="validate input-sm form-control" id="pinCode"
											value="<s:property value="customerBean.pin"/>"
											placeholder="Customer Pin Code">
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group m-all-15 ml-20 mr-20">
										<label for="event">Event</label></br> <input
											name="customerBean.event" type="text"
											class="validate input-sm form-control" id="event"
											value="<s:property value="customerBean.event"/>"
											placeholder="Event Name">
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group m-all-15 ml-10 mr-30">
										<label for="eventDate">Event Date</label></br> <input
											id="eventDate" name="customerBean.eventDate" type="date"
											class="validate input-sm form-control"
											value="<s:property value="customerBean.eventDate"/>"
											required="required"> <i class="fa fa-calendar"
											style="font-size: 22px; float: right; margin: -46px auto;"></i>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-4">
									<div class="form-group m-all-15 ml-30 mr-10">
										<label for="customerAddedOn">Added On</label></br> <input
											name="customerBean.addedOn" type="date"
											class="validate input-sm form-control" id="customerAddedOn"
											value="<s:property value="customerBean.addedOn"/>"
											required="required"> <i class="fa fa-calendar"
											style="font-size: 22px; float: right; margin: -46px auto;"></i>
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group m-all-15 ml-20 mr-20">
										<label for="activeStatus">Active Status</label> <select
											class="custom-select custom-select-sm input-sm form-control"
											id="activeStatus" name="customerBean.activeStatus">
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
									<th>Customer Name</th>
									<th>Customer Address</th>
									<th>Customer Contact</th>
									<th>Event</th>
									<th>Event Date</th>
									<th>Added On</th>
									<th>Active Status</th>
									<th>Actions</th>
								</tr>
							</thead>
							<tbody>
								<s:if test="customerList!=null && customerList.size()>0">
									<s:iterator value="customerList" status="row">
										<tr class="default">
											<td><s:property value="#row.count" /></td>
											<td><s:property value="customerCode" />,&nbsp; <s:property
													value="customerName" /></td>
											<td><s:property value="address1" />,&nbsp; <s:property
													value="address2" />,&nbsp; <s:property value="email" />,&nbsp;
												<s:property value="pin" /></td>
											<td><s:property value="contact" /></td>
											<td><s:property value="event" /></td>
											<td><s:property value="eventDate" /></td>
											<td><s:property value="addedOn" /></td>
											<td><s:property value="activeStatus" /></td>
											<td><button class="btn-xs btn-link"
													onclick="editCustomer('<s:property value="customerId"/>')">
													<span class="glyphicon glyphicon-edit"
														style="font-size: 15px; text-align: center;"></span>
												</button>
												<button class="btn-xs btn-link"
													onclick="deleteCustomer('<s:property value="customerId"/>')">
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
</body>
<script type="text/javascript">
	function editCustomer(customerId) {
		location.href = "editCustomer?customerBean.customerId=" + customerId;
	}

	function deleteCustomer(customerId) {
		location.href = "deleteCustomer?customerBean.customerId=" + customerId;
	}
	function toggleTableContainer() {
		$('#tableContainer').toggle();
	}
</script>
</html>