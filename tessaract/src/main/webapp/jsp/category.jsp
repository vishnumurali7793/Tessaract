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
					<div class="panel-heading">View Category Details</div>
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
</body>
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
</html>