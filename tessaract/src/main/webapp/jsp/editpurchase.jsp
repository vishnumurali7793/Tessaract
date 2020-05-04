<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<title>tessaract</title>
</head>
<script type="text/javascript">
	function getProductList() {
		$('#productModal #modalTitle').html("Add items to purchase bill");
		$
				.ajax({
					type : "GET",
					url : "getProductListForPurchase",
					data : {
						"purchaseBean.purchaseId" : '<s:property value="purchaseBean.purchaseId"/>'
					},
					beforeSend : function() {
						$('#productModal .modal-body').html('Loading..');
					},
					success : function(msg) {
						$('#productModal .modal-body').html(msg);
					}
				});
		$('#productModal').modal('show');
		return false;
	}
	var totamt = 0;
	function calculateamount(index) {
		var purity = document.getElementById('purity' + index).value;
		var gwt = document.getElementById('gramweight' + index).value;
		var touch = document.getElementById('touch' + index).value;
		var netwt = parseFloat((gwt * touch) / purity);
		document.getElementById('netweight' + index).value = netwt.toFixed(3);
		var rate = document.getElementById('rate' + index).value;
		var amount = parseFloat(rate * netwt);
		document.getElementById('totalamount' + index).value = Math
				.round(amount);
		totamt += Math.round(amount);
		netamttot();
	}

	function netamttot() {
		document.getElementById('totamt').value = totamt;
	}
	var roundofff = 0;
	function nettotalamt() {
		roundofff = document.getElementById('roundoff').value;
		var netamt = totamt - roundofff;
		document.getElementById('totnetamt').value = netamt;
	}
	function deletepurchase(purid) {
		location.href = "deletePurchase?purchaseDetails.purchaseScreenId=" + purid;
	}
</script>
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

td {
	border: 1px solid #dddddd;
	text-align: right;
	padding: 8px;
}

th {
	text-align: center;
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
</style>
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
					<li class="active"><a href="goToProduct">Product</a></li>
					<li><a href="goToModel">Model</a></li>
					<li><a href="goToCarat">Carat</a></li>
					<li><a href="#">Page 1-2</a></li>
					<li><a href="#">Page 1-3</a></li>
				</ul></li>
			<li><a href="#">Page 2</a></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<%-- <li><a href="#"><span class="glyphicon glyphicon-user"></span>
						Sign Up</a></li> --%>
			<li><a href="logout"><span
					class="glyphicon glyphicon-log-out"></span> Logout</a></li>
		</ul>
	</div>
	</nav>
	<div class="container-fluid">
		<div class="row"></div>
		<div class="row">
			<div class="col-md-12">
				<s:hidden name="purchaseBean.purchaseId" />
				<button type="button" class="btn btn-primary" data-toggle="modal"
					onclick="getProductList()">Add products</button>
			</div>
		</div>

		<div class="row">
			<form action="savepurchaseDetails">
				<s:hidden name="purchaseBean.purchaseId" />
				<s:hidden name="purchaseamtBean.purchaseAmountId" />
				<div class="col-xs-12">

					<table class="table">
						<thead class="thead-dark">
							<tr>
								<th>#</th>
								<th>HSNCODE</th>
								<th>PRODUCT</th>
								<th>PURITY</th>
								<th>GM.WT</th>
								<th>TOUCH</th>
								<th>NET WT</th>
								<th>RATE</th>
								<th>TOTAL AMOUNT</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<s:if test="prodDetList!=null && prodDetList.size()>0">
								<s:iterator value="prodDetList" status="row">
									<tr>
										<td><s:property value="#row.count" /></td>
										<td><input class="form-control" type="text"
											name="prodDetList[<s:property value="#row.index"/>].hsnCode"
											value='<s:property value="hsnCode"/>' /></td>
										<td><s:property value="productId.category.categoryName" /></br>
											<s:property value="productId.productName" /></td>
										<td><input class="form-control" type="text"
											name="prodDetList[<s:property value="#row.index"/>].purity"
											id="purity<s:property value="#row.index" />"
											value="<s:property value="purity"/>"
											onchange="calculateamount('<s:property value="#row.index" />')" /></td>
										<td><input class="form-control" type="text"
											name="prodDetList[<s:property value="#row.index"/>].gramweight"
											value="<s:property value="gramweight"/>"
											id="gramweight<s:property value="#row.index" />"
											onchange="calculateamount('<s:property value="#row.index" />')" /></td>
										<td><input class="form-control" type="text"
											name="prodDetList[<s:property value="#row.index"/>].touch"
											value="<s:property value="touch"/>"
											id="touch<s:property value="#row.index" />"
											onchange="calculateamount('<s:property value="#row.index" />')" /></td>
										<td><input class="form-control" type="text"
											name="prodDetList[<s:property value="#row.index"/>].netweight"
											value="<s:property value="netweight"/>"
											id="netweight<s:property value="#row.index" />"
											onchange="calculateamount('<s:property value="#row.index" />')" /></td>
										<td><input class="form-control" type="text"
											name="prodDetList[<s:property value="#row.index"/>].rate"
											value="<s:property value="rate"/>"
											id="rate<s:property value="#row.index" />"
											onchange="calculateamount('<s:property value="#row.index" />')" /></td>
										<td><input class="form-control totamont" type="text"
											name="prodDetList[<s:property value="#row.index"/>].totalamount"
											value="<s:property value="totalamount"/>"
											id="totalamount<s:property value="#row.index" />"
											onchange="calculateamount('<s:property value="#row.index" />')" /></td>

										<td><button class="btn-xs btn-link"
															onclick="deletepurchase('<s:property value="purchaseScreenId"/>')">[DELETE]</button></td>
									</tr>
								</s:iterator>
							</s:if>
							<s:else>no product added</s:else>
							<tr>
								<td colspan="8" align="right"><label>Net amount</label></td>
								<td colspan="1"><input class="form-control" id="totamt"
									type="text" name="purchaseamtBean.grossamount"
									value="<s:property value="purchaseamtBean.grossamount"/>" /></td>
							</tr>
							<tr>
								<td colspan="8" align="right"><label>Round off</label></td>
								<td colspan="1"><input class="form-control" id="roundoff"
									type="text" name="purchaseamtBean.roundoff"
									value="<s:property value="purchaseamtBean.roundoff"/>"
									onchange="nettotalamt()" /></td>
							</tr>
							<tr>
								<td colspan="8" align="right"><label>Total Net
										amount</label></td>
								<td colspan="1"><input class="form-control" id="totnetamt"
									type="text" name="purchaseamtBean.netamount"
									value="<s:property value="purchaseamtBean.netamount"/>" /></td>
							</tr>
						</tbody>


					</table>

					<div class="row">
						<div align="center">
							<s:if test="prodDetList != null">
								<s:submit class="btn btn-primary" value="save"></s:submit>
							</s:if>
							<s:else>-- no products added</s:else>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>



	<div class="modal fade" id="productModal" role="dialog">
		<div class="modal-dialog modal-lg modal-xl">
			<div class="modal-content">
				<div class="modal-header" style="background-color: #581845;">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" align="center">
						<span style="color: white;" class="" id="modalTitle"></span>
					</h4>
				</div>
				<div class="modal-body"></div>
			</div>
		</div>
	</div>
</body>
</html>