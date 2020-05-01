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

	function calculateamount(index) {
		var purity = document.getElementById('purity' + index).value;
		var gwt = document.getElementById('gramweight' + index).value;
		var touch = document.getElementById('touch' + index).value;
		var netwt=parseFloat((gwt*touch)/purity);
		document.getElementById('netweight' + index).value=netwt.toFixed(3);
		var rate = document.getElementById('rate' + index).value;
		var amount=parseFloat(rate*netwt);
		document.getElementById('totalamount' + index).value=Math.round(amount);
		
	}
</script>
<body>
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
				<div class="col-xs-12">

					<table class="table">
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
								<th>TOTAL AMOUNT</th>
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
											id="purity<s:property value="#row.index" />" value="<s:property value="purity"/>"
											onchange="calculateamount('<s:property value="#row.index" />')" /></td>
										<td><input class="form-control" type="text"
											name="prodDetList[<s:property value="#row.index"/>].gramweight"
											value="<s:property value="gramweight"/>" id="gramweight<s:property value="#row.index" />"
											 onchange="calculateamount('<s:property value="#row.index" />')"/></td>
										<td><input class="form-control" type="text"
											name="prodDetList[<s:property value="#row.index"/>].touch"
											value="<s:property value="touch"/>" id="touch<s:property value="#row.index" />"
											onchange="calculateamount('<s:property value="#row.index" />')" /></td>
										<td><input class="form-control" type="text"
											name="prodDetList[<s:property value="#row.index"/>].netweight"
											value="<s:property value="netweight"/>" id="netweight<s:property value="#row.index" />"
											onchange="calculateamount('<s:property value="#row.index" />')" /></td>
										<td><input class="form-control" type="text"
											name="prodDetList[<s:property value="#row.index"/>].rate"
											value="<s:property value="rate"/>" id="rate<s:property value="#row.index" />"
											onchange="calculateamount('<s:property value="#row.index" />')" /></td>
										<td><input class="form-control" type="text"
											name="prodDetList[<s:property value="#row.index"/>].totalamount"
											value="<s:property value="totalamount"/>" id="totalamount<s:property value="#row.index" />"
											onchange="calculateamount('<s:property value="#row.index" />')" /></td>

									</tr>
								</s:iterator>
							</s:if>
							<s:else>no product added</s:else>
							<tr>
							<td colspan="8" align="right"><label>Net amount</label></td>
							<td colspan="1"><input class="form-control"
									type="text" name="purchaseamtBean.grossamount" value="" /></td>
							</tr>
							<tr>
							<td colspan="8" align="right"><label>Round off</label></td>
							<td colspan="1"><input class="form-control"
									type="text" name="purchaseamtBean.roundoff" value="" /></td>
							</tr>
							<tr>
							<td colspan="8" align="right"><label>Total Net amount</label></td>
							<td colspan="1"><input class="form-control"
									type="text" name="purchaseamtBean.netamount" value="" /></td>
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