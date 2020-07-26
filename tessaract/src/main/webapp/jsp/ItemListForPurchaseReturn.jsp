<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="resources/jquery/jquery-3.5.0.js"></script>
<script type="text/javascript" src="resources/jquery-ui/jquery-ui.js"></script>
<script type="text/javascript"
	src="resources/bootstrap/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="resources/jquery-ui/jquery-ui.css">
<link rel="stylesheet" type="text/css"
	href="resources/jquery-ui/jquery-ui.structure.css">
<link rel="stylesheet" type="text/css"
	href="resources/jquery-ui/jquery-ui.theme.css">
<title>Insert title here</title>
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

.element {
	margin-top: 15px;
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

.content-body {
	background-color: #fcfcfc;
}

.content-body .table-bg {
	background-color: #337ab7;
	color: white;
}

.content-body .table-body {
	background: #e7f4ff;
}

h3 {
	color: #337ab7;
}
</style>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						//alert('<s:property value = "purchaseReturnItems[0].purchaseReturnScreenId"/>');
					});
</script>
<body>
	<nav class="navbar navbar-inverse bar">
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
						<li><a href="goToCategory">Category</a></li>
						<li><a href="goToProduct">Product</a></li>
						<li><a href="goToModel">Model</a></li>
						<li><a href="goToCarat">Carat</a></li>
						<li><a href="goToRate">Rate</a></li>
						<li><a href="goToCustomer">Customer</a></li>
						<li><a href="goToVendor">Vendor</a></li>
						<li><a href="goToPurchase">Purchase</a></li>
						<li class="active"><a href="goToSales">Sales</a></li>
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
	</nav>
	<div class="container-fluid">
		<s:form action="updatePurchaseReturn">
			<s:hidden name="purchaseBean.purchaseId" />
			<input type="hidden"name="purchaseReturnAmount.purchaseReturnAmountId"
										value='<s:property value="purchaseReturnAmount.purchaseReturnAmountId" />' />
			<div class="row">
				<div class="col-xs-12">
					<table class="ttable table-bordered">
						<thead>
							<tr>
								<th>#</th>
								<th>HSNCODE</th>
								<th>PRODUCT</th>
								<th>PURITY</th>
								<th>GM.WT</th>
								<th>TOUCH</th>
								<th>NET WT</th>
								<th>RATE</th>
								<th>QUANTITY</th>
								<th>TOTAL AMOUNT</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<s:if
								test="purchaseReturnItems!=null && purchaseReturnItems.size()>0">
								<s:iterator value="purchaseReturnItems" status="row"
									var="prItems">
									<input type="hidden"
										name="purchaseReturnItems[<s:property value = "#row.index"/>].purchaseId.purchaseId"
										value='<s:property value="purchaseId.purchaseId" />' />
									<input type="hidden"
										name="purchaseReturnItems[<s:property value = "#row.index"/>].purchaseReturnScreenId"
										value="<s:property value="purchaseReturnScreenId" />" />
									<tr>
										<td><s:property value="#row.count" /></td>
										<td><input type="text" class="form-control input-sm"
											name="purchaseReturnItems[<s:property value = "#row.index"/>].hsnCode"
											value="<s:property value = "hsnCode"/>" /></td>
										<td><s:property value="productId.productName" /></td>
										<td><input type="text" class="form-control input-sm"
											name="purchaseReturnItems[<s:property value = "#row.index"/>].purity"
											value="<s:property value = "purity"/>" /></td>
										<td><input type="text" class="form-control input-sm"
											name="purchaseReturnItems[<s:property value = "#row.index"/>].gramweight"
											value="<s:property value = "gramweight"/>" /></td>
										<td><input type="text" class="form-control input-sm"
											name="purchaseReturnItems[<s:property value = "#row.index"/>].touch"
											value="<s:property value = "touch"/>" /></td>
										<td><input type="text" class="form-control input-sm"
											name="purchaseReturnItems[<s:property value = "#row.index"/>].netweight"
											value="<s:property value = "netweight"/>" /></td>
										<td><input type="text" class="form-control input-sm"
											name="purchaseReturnItems[<s:property value = "#row.index"/>].rate"
											value="<s:property value = "rate"/>" /></td>
										<td><input type="text" class="form-control input-sm"
											name="purchaseReturnItems[<s:property value = "#row.index"/>].quantity"
											value="<s:property value = "quantity"/>" /></td>
										<td><input type="text" class="form-control input-sm"
											name="purchaseReturnItems[<s:property value = "#row.index"/>].totalamount"
											value="<s:property value = "totalamount"/>" /></td>
											<td><button class="btn-xs btn-link"
															onclick="deletepurchase('<s:property value="purchaseScreenId"/>')">[DELETE]</button></td>
									
									</tr>
								</s:iterator>
							</s:if>
							<s:else>
								<tr>
									<td colspan="10">
										<div align="center">--No Data Found--</div>
									</td>
								</tr>
							</s:else>
							<tr>
								<td colspan="9" align="right"><label>Net amount</label></td>
								<td colspan="1"><input class="form-control" id="totamt"
									type="text" name="purchaseReturnAmount.grossamount"
									value="<s:property value="purchaseReturnAmount.grossamount"/>" /></td>
							</tr>
							<tr>
								<td colspan="9" align="right"><label>Round off</label></td>
								<td colspan="1"><input class="form-control" id="roundoff"
									type="text" name="purchaseRetAmtBean.roundoff"
									value="<s:property value="purchaseReturnAmount.roundoff"/>"
									onchange="nettotalamt()" /></td>
							</tr>
							<tr>
								<td colspan="9" align="right"><label>Total Net
										amount</label></td>
								<td colspan="1"><input class="form-control" id="totnetamt"
									type="text" name="purchaseReturnAmount.netamount"
									value="<s:property value="purchaseReturnAmount.netamount"/>" /></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col-xs-12">
					<div align="center">
						<s:submit class="btn btn-sm btn-success" value="Update Details"></s:submit>
					</div>
				</div>
			</div>
		</s:form>
	</div>
</body>
</html>