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
										<label for="datePicker">Date </label> <input
											name="taxBean.addedOn" type="date"
											class="input-sm form-control" required="required"
											id="datePicker">
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
								<s:else>
									<tr>
										<td colspan="8">-- No Data Found --</td>
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
	function deleteTax(taxid) {
		location.href = "deleteTax?taxBean.taxId=" + taxid;
	}

	function toggleTableContainer() {
		$('#tableContainer').toggle();
	}
</script>
</html>