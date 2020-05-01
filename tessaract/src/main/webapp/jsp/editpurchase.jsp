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
	$.ajax({
		type : "GET",
		url : "getProductListForPurchase",
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
</script>
<body>
	<div class="container-fluid">
		<div class="row"></div>
		<div class="row">
			<div class="col-md-12">
				<button type="button" class="btn btn-primary" data-toggle="modal"
					onclick="getProductList()">Add products</button>
			</div>
		</div>
	</div>
	
	
	
	<div class="modal fade" id="productModal" role="dialog">
		<div class="modal-dialog modal-lg modal-xl">
			<div class="modal-content">
				<div class="modal-header" style="background-color:  #581845;">
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