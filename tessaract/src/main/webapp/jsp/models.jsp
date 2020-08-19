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
			<div class="col-md-12 col-sm-12 mt-15">
				<h3 align="center">Model Master</h3>
			</div>
		</div>
		<div class="row">
			<div class="panel-group m-all-15">
				<div class="panel panel-default form-panel-primary">
					<div class="panel-heading">Add Model</div>
					<div class="panel-body">
						<s:form action="saveModel">
							<div class="row">
								<s:hidden name="modelBean.modelId" />
								<div class="col-md-4 col-sm-12">
									<div class="form-group m-all-15">
										<label for="modelCode">Model Code</label> <input
											name="modelBean.modelCode" id="modelCode" type="text"
											value="<s:property value="modelBean.modelCode"/>"
											class="validate input-sm form-control"
											placeholder="modelCode">
									</div>
								</div>
								<div class="col-md-4 col-sm-12">
									<div class="form-group m-all-15">
										<label for="modelName">Model Name</label> <input
											name="modelBean.modelName" type="text"
											class="validate input-sm form-control" id="modelName"
											value="<s:property value="modelBean.modelName"/>"
											placeholder="modelName">
									</div>
								</div>
								<div class="col-md-4 col-sm-12">
									<div class="form-group m-all-15">
										<label for="date">Date</label> <input name="modelBean.addedOn"
											id="date" type="date" class="validate input-sm form-control"
											value="<s:property value="modelBean.addedOn"/>"
											required="required"> <i class="fa fa-calendar"
											style="font-size: 22px; float: right; margin: -46px auto;"></i>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6 col-sm-12">
									<div class="form-group m-all-15 ml-25">
										<label for="activeStatus">Active Status</label> <select
											class="custom-select  input-sm form-control"
											value='<s:property value="modelBean.activeStatus"/>'
											id="activeStatus" name="modelBean.activeStatus">
											<option selected>--Select from the list--</option>
											<option value="Active">Active</option>
											<option value="Inactive">Inactive</option>
										</select>
									</div>
								</div>
								<div class="col-md-3 col-sm-12">
									<div class="form-group mt-40 pull-right">
										<button
											class="btn btn-sm btn-success form-control form-btn-success"
											type="submit">
											Submit &nbsp;<span class="glyphicon glyphicon-save"
												style="font-size: 12px;"></span>
										</button>
									</div>
								</div>
								<div class="col-md-3 col-sm-12">
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
					<div class="panel-heading">View Model Details</div>
					<div class="panel-body">
						<table class="table table-bordered">
							<thead>
								<tr class="info">
									<th>#</th>
									<th>MODEL CODE</th>
									<th>MODEL NAME</th>
									<th>DATE</th>
									<th>ACTIVE STATUS</th>
									<th>ACTIONS</th>
								</tr>
							</thead>
							<tbody>
								<s:if test="modelList!=null && modelList.size()>0">
									<s:iterator value="modelList" status="row">
										<tr class="default">
											<td><s:property value="#row.count" /></td>
											<td><s:property value="modelCode" /></td>
											<td><s:property value="modelName" /></td>
											<td><s:property value="addedOn" /></td>
											<td><s:property value="activeStatus" /></td>
											<td><button class="btn-xs btn-link"
													onclick="editModel('<s:property value="modelId"/>')">
													<span class="glyphicon glyphicon-edit"
														style="font-size: 15px; text-align: center;"></span>
												</button>
												<button class="btn-xs btn-link"
													onclick="deleteModel('<s:property value="modelId"/>')">
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
	function toggleTableContainer() {
		$('#tableContainer').toggle();
	}

	function editModel(modelId) {
		location.href = "editModel?modelBean.modelId=" + modelId;
	}

	function deleteModel(modelId) {
		location.href = "deleteModel?modelBean.modelId=" + modelId;
	}
</script>
</html>