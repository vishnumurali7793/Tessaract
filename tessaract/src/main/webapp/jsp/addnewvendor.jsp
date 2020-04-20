<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">

$(document).ready(function(){
	$("#vendor-code").keyup(function(){
		$.ajax({
		type: "POST",
		url: "autovenCode",
		data: ['purchaseBean.vendor.vendorCode': $('#vendor-code').val()],
		beforeSend: function(){
			$("#suggesstion-box").show();
			$("#suggesstion-box").html("pleasewait");
		},
		success: function(data){
			$("#suggesstion-box").show();
			$("#suggesstion-box").html(data);
			$("#search-box").css("background","#FFF");
		}
		});
	});
});

</script>
<body>
	<div class="container-fluid">
		<!-- <div class="row">
			<div class="panel">
				<h2>Add vendor</h2>
			</div>
		</div> -->

		<form action="savepurchaseVendor">
			<div class="row">
				<div class="col-xs-3">
					<label class="form-group" for="gst-code">GST</label>
					<s:textfield name="purchaseBean.gstCode" type="text" value=""
						id="gst-code" class="form-control" placeholder="GSTCODE" />
				</div>
				<div class="col-xs-3">
					<label class="form-group" for="vendor-code">Vendor Code</label>
					<s:textfield name="purchaseBean.vendor.vendorCode" type="text"
						id="vendor-code" value="" class="form-control"
						placeholder="vendorCode" />
						<div id="suggesstion-box"></div>
				</div>
				<div class="col-xs-3">
					<label class="form-group" for="purch-date">PURCHASE Date</label> <input
						name="purchaseBean.purchaseDate" type="date" id="purch-date"
						class="form-control"
						value="<s:property value="purchaseBean.purchaseDate"/>"
						required="required"> <i class="fa fa-calendar"
						style="font-size: 22px; float: right; margin: -46px auto;"></i>
				</div>
				<div class="col-xs-3">
					<label class="form-group" for="invoice-date">INVOICE DATE</label> <input
						name="purchaseBean.invoiceDate" type="date" class="form-control"
						id="invoice-date"
						value="<s:property value="purchaseBean.invoiceDate"/>"
						required="required"> <i class="fa fa-calendar"
						style="font-size: 22px; float: right; margin: -46px auto;"></i>
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-xs-3">
					<label class="form-group" for="gold-rate">Gold rate</label>
					<s:textfield name="purchaseBean.goldRate" type="text" value=""
						id="gold-rate" class="form-control" placeholder="goldRate" />
				</div>
				<div class="col-xs-3">
					<label class="form-group" for="silver-rate">Silver rate</label>
					<s:textfield name="purchaseBean.silverRate" type="text" value=""
						id="silver-rate" class="form-control" placeholder="silverRate" />
				</div>
				<div class="col-xs-3">
					<label class="form-group" for="platinum-rate">Platinum rate</label>
					<s:textfield name="purchaseBean.platinumRate" type="text" value=""
						id="platinum-rate" class="form-control" placeholder="platinumRate" />
				</div>
				<div class="col-xs-3">
					<label class="form-group" for="bill-no">bill no</label>
					<s:textfield name="purchaseBean.purBillNo" type="text" value=""
						class="form-control" id="bill-no" placeholder="purBillNo" />
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-xs-6">
					<label class="form-group" for="invoice-no">invoice no</label>
					<s:textfield name="purchaseBean.invoice" type="text" value=""
						id="invoice-no" class="form-control" placeholder="invoiceno" />
				</div>
				<div class="col-xs-6">
					<button class="btn btn-sm btn-success" type="submit"
						id="submit-btn">Submit</button>
				</div>
			</div>
	</div>
	</form>
</body>
</html>