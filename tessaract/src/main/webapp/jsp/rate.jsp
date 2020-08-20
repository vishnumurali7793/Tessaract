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
				<h3 align="center">Rate Master</h3>
			</div>
		</div>
		<div class="row">
			<div class="panel-group m-all-15">
				<div class="panel panel-default form-panel-primary">
					<div class="panel-heading">Add Rate</div>
					<div class="panel-body">
						<s:form action="saveRate">
							<s:hidden name="rateBean.rateId" />
							<s:hidden name="categoryBean.categoryId" />
							<s:hidden name="caratBean.caratId" />
							<div class="row">
								<div class="col-md-4">
									<div class="form-group m-all-15">
										<label for="categoryName">Category Name</label> <select
											class="custom-select custom-select-sm input-sm form-control"
											id="categoryName"
											value="<s:property value="rateBean.categoryId.categoryName" />"
											name="rateBean.categoryId.categoryId">
											<option selected>--Select from the list--</option>
											<s:iterator value="catList" status="row">
												<option value="<s:property value='categoryId'/>"><s:property
														value='categoryName' /></option>
											</s:iterator>
										</select>
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group m-all-15">
										<label for="karatSelect">Karat</label> <select
											class="custom-select custom-select-sm input-sm form-control"
											id="karatSelect" 
											value="<s:property value="rateBean.caratId.caratName" />"
											name="rateBean.caratId.caratId">
											<option selected>--Select from the list--</option>
											<s:iterator value="caratList" status="row">
												<option value="<s:property value='caratId'/>"><s:property
														value='caratName' /></option>
											</s:iterator>
										</select>
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group m-all-15">
										<label for="rate">Rate</label> <input name="rateBean.amount"
											type="text" class="validate input-sm form-control" id="rate"
											value="<s:property value="rateBean.amount"/>"
											placeholder="amount">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group m-all-15">
										<label for="date">Date</label> <input name="rateBean.addedOn"
											type="date" class="validate form-control input-sm" id="date"
											value="<s:property value="rateBean.addedOn"/>"
											required="required"> <i class="fa fa-calendar"
											style="font-size: 22px; float: right; margin: -46px auto;"></i>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group m-all-15">
										<label for="activeStatus">Active Status</label> <select
											class="custom-select form-control input-sm" id="activeStatus"
											name="rateBean.activeStatus">
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
									<th>CATEGORY NAME</th>
									<th>CARAT</th>
									<th>AMOUNT</th>
									<th>DATE</th>
									<th>ACTIVE STATUS</th>
									<th>ACTIONS</th>
								</tr>
							</thead>
							<tbody>
								<s:if test="rateList!=null && rateList.size()>0">
									<s:iterator value="rateList" status="row">
										<tr class="default">
											<td><s:property value="#row.count" /></td>
											<td><s:property value="categoryId.categoryName" /></td>
											<td><s:property value="caratId.caratName" /></td>
											<td><s:property value="amount" /></td>
											<td><s:property value="addedOn" /></td>
											<td><s:property value="activeStatus" /></td>
											<td>
												<button class="btn-xs btn-link"
													onclick="editRate('<s:property value="rateId"/>')">
													<span class="glyphicon glyphicon-edit"
														style="font-size: 15px; text-align: center;"></span>
												</button>
												<button class="btn-xs btn-link"
													onclick="deleteRate('<s:property value="rateId"/>')">
													<span class="glyphicon glyphicon-trash"
														style="color: #f11c1c; font-size: 15px; text-align: center;"></span>
												</button>
											</td>
										</tr>
									</s:iterator>
								</s:if>
								<s:else>
									<tr class="default">
										<td colspan="7" class="text-center">-- No Data Found --</td>
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
	function editRate(rateId) {
		location.href = "editRate?rateBean.rateId=" + rateId;
	}

	function deleteRate(rateId) {
		location.href = "deleteRate?rateBean.rateId=" + rateId;
	}

	function toggleTableContainer() {
		$('#tableContainer').toggle();
	}
</script>
</html>