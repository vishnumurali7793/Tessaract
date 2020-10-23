<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
				<h3 align="center">Karat Master</h3>
			</div>
		</div>
		<div class="row">
			<div class="panel-group m-all-15">
				<div class="panel panel-default form-panel-primary">
					<div class="panel-heading">Add Karat</div>
					<div class="panel-body">
						<s:form action="saveCarat">
							<s:hidden name="caratBean.caratId" />
							<div class="row">
								<div class="col-md-4">
									<div class="form-group m-all-15">
										<label for="karatCode">Karat Code</label> <input
											name="caratBean.caratCode" type="text" id="karatCode"
											value="<s:property value="caratBean.caratCode"/>"
											class="validate input-sm form-control"
											placeholder="CaratCode">
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group m-all-15">
										<label for="karatName">Karat Name</label> <input
											name="caratBean.caratName" type="text"
											class="validate input-sm form-control" id="karatName"
											value="<s:property value="caratBean.caratName"/>"
											placeholder="CaratName">
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group m-all-15">
										<label for="activeStatus">Active Status</label> <select
											class="custom-select form-control input-sm" id="activeStatus"
											name="caratBean.activeStatus"
											value='<s:property value="caratBean.activeStatus"/>'>
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
					<div class="panel-heading">View Karat Details</div>
					<div class="panel-body">
						<table class="table table-bordered">
							<thead>
								<tr class="info">
									<th>#</th>
									<th>Karat CODE</th>
									<th>Karat NAME</th>
									<th>Active Status</th>
									<th>Actions</th>
								</tr>
							</thead>
							<tbody>
								<s:if test="caratList!=null && caratList.size()>0">
									<s:iterator value="caratList" status="row">
										<tr class="default">
											<td><s:property value="#row.count" /></td>
											<td><s:property value="caratCode" /></td>
											<td><s:property value="caratName" /></td>
											<td><s:property value="activeStatus" /></td>
											<td>
												<button class="btn-xs btn-link"
													onclick="editKarat('<s:property value="caratId"/>')">
													<span class="glyphicon glyphicon-edit"
														style="font-size: 15px; text-align: center;"></span>
												</button>
												<button class="btn-xs btn-link"
													onclick="deleteKarat('<s:property value="caratId"/>')">
													<span class="glyphicon glyphicon-trash"
														style="color: #f11c1c; font-size: 15px; text-align: center;"></span>
												</button>
											</td>
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
<script type="text/javascript">
	function editKarat(carid) {
		location.href = "editCarat?caratBean.caratId=" + carid;
	}

	function deleteKarat(carid) {
		location.href = "deleteCarat?caratBean.caratId=" + carid;
	}

	function toggleTableContainer() {
		$('#tableContainer').toggle();
	}
</script>
</html>