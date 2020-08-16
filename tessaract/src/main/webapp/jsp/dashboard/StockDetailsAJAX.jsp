<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script type="text/javascript" src="resources/jquery/jquery-3.5.0.min.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.min.css">
		<script type="text/javascript" src="resources/bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="resources/canvasjs/canvasjs.min.js"></script>

<style type="text/css">
table tr th {
	background-color: #696969;
	color: white;
}

table tr {
	background-color: white;
}

table {
	text-align: center;
}

.download-button {
	font-size: 18px;
}
</style>
</head>
		<body>
			<div class="fluid-container">
				<div class="row">
					<div class="col-lg-12" align="right">
						<a role="button" href="generateStockReport" title="Download stock report">
							<span class="glyphicon glyphicon-floppy-save download-button"></span>
						</a>
					</div>
					<div class="col-lg-12">
						<table class="table table-bordered stock-table">
							<thead>
								<tr>
									<th>#</th>
									<th>Product</th>
									<th>Stock</th>
								</tr>
							</thead>
							
							<tbody>
							<s:if test="stockList !=nulll && stockList.size()>0">
								<s:iterator value="stockList" status="row">
									<tr>
										<td><s:property value="#row.count" /></td>
										<td><s:property value="productId.productName" /></td>
										<td><s:property value="Quantity" /></td>
									</tr>
								</s:iterator>
							</s:if>
							<s:else>
								<tr>
									<td colspan="3">--Data unavailable--</td>
								</tr>
							</s:else>
					</tbody>
						</table>
					</div>
				</div>
			</div>
		</body>
</html>