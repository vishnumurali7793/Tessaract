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
				<h3 align="center">Product Master</h3>
			</div>
		</div>
		<div class="row">
			<div class="panel-group m-all-15">
				<div class="panel panel-default form-panel-primary">
					<div class="panel-heading">Add Product</div>
					<div class="panel-body">
						<s:form action="saveProduct">
							<div class="row">
								<s:hidden name="categoryBean.categoryId" />
								<s:hidden name="productBean.productId" />
								<s:hidden name="modelBean.modelId" />
								<div class="col-md-4 col-sm-12">
									<div class="form-group m-all-15">
										<label for="select">Category Name</label> <select
											class="custom-select custom-select-sm input-sm form-control"
											id="select"
											value="<s:property value="productBean.category.categoryName" />"
											name="productBean.category.categoryId">
											<option selected="selected">--Select from the list--</option>
											<s:iterator value="catList" status="row">
												<option value="<s:property value='categoryId'/>"><s:property
														value='categoryName' /></option>
											</s:iterator>
										</select>
									</div>
								</div>
								<div class="col-md-4 col-sm-12">
									<div class="form-group m-all-15">
										<label for="productCode">ProductCode</label> <input
											id="productCode" name="productBean.productCode" type="text"
											value="<s:property value="productBean.productCode"/>"
											class="validate input-sm form-control"
											placeholder="ProductCode">
									</div>
								</div>
								<div class="col-md-4 col-sm-12">
									<div class="form-group m-all-15">
										<label for="productName">Product Name</label> <input
											name="productBean.productName" type="text" id="productName"
											class="validate input-sm form-control"
											value="<s:property value="productBean.productName"/>"
											placeholder="ProductName">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-4 col-sm-12">
									<div class="form-group m-all-15 ml-25">
										<label for="modelName">Model Name</label> <select
											class="custom-select custom-select-sm input-sm form-control"
											id="modalName"
											value="<s:property value="productBean.modelId.modelId" />"
											name="productBean.modelId.modelId">
											<s:iterator value="modelList" status="row">
												<option value="<s:property value='modelId'/>"><s:property
														value='modelName' /></option>
											</s:iterator>
										</select>
									</div>
								</div>
								<div class="col-md-4 col-sm-12">
									<div class="form-group m-all-15">
										<label for="date">Date</label> <input
											name="productBean.addedOn" type="date"
											class="validate input-sm form-control" id="date"
											value="<s:property value="productBean.addedOn"/>"
											required="required"> <i class="fa fa-calendar"
											style="font-size: 22px; margin: -46px auto;"></i>
									</div>
								</div>
								<div class="col-md-4 col-sm-12">
									<div class="form-group m-all-15">
										<label for="activeStatus">Active Status</label> <select
											class="custom-select  input-sm form-control"
											value='<s:property value="productBean.activeStatus"/>'
											id="activeStatus" name="productBean.activeStatus">
											<option selected>--Select from the list--</option>
											<option value="Active">Active</option>
											<option value="Inactive">Inactive</option>
										</select>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12 col-sm-12">
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
					<div class="panel-heading">View Product Details</div>
					<div class="panel-body">
						<table class="table table-bordered">
							<thead>
								<tr class="info">
									<th>#</th>
									<th>CATEGORY NAME</th>
									<th>PRODUCT CODE</th>
									<th>PRODUCT NAME</th>
									<th>MODEL NAME</th>
									<th>DATE</th>
									<th>ACTIVE STATUS</th>
									<th>ACTIONS</th>
								</tr>
							</thead>
							<tbody>
								<s:if test="prodList!=null && prodList.size()>0">
									<s:iterator value="prodList" status="row">
										<tr class="default">
											<td><s:property value="#row.count" /></td>
											<td><s:property value="category.categoryName" /></td>
											<td><s:property value="productCode" /></td>
											<td><s:property value="productName" /></td>
											<td><s:property value="modelId.modelName" /></td>
											<td><s:property value="addedOn" /></td>
											<td><s:property value="activeStatus" /></td>
											<td><button class="btn-xs btn-link"
													onclick="editProductDetails('<s:property value="productId"/>')">
													<span class="glyphicon glyphicon-edit"
														style="font-size: 15px; text-align: center;"></span>
												</button>
												<button class="btn-xs btn-link"
													onclick="deleteProductDetails('<s:property value="productId"/>')">
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

	function editProductDetails(productId) {
		location.href = "editProduct?productBean.productId=" + productId;
	}

	function deleteProductDetails(productId) {
		location.href = "deleteProduct?productBean.productId=" + productId;
	}
</script>
</html>