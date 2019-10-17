<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel='stylesheet'
	href='webjars/bootstrap/3.2.0/css/bootstrap.min.css'>
<script type="text/javascript" src="webjars/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript"
	src="webjars/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<title>tessaract</title>
<link href="css/style.css" rel="stylesheet" type="text/css">

</head>
<style type="text/css">
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
</style>
<header
	class="navbar navbar-expand navbar-dark flex-column flex-md-row bd-navbar"
	id="allign">TAX</header>
<body>
	<form align="center">
		<div class="tax">
			<br> <label>SGST</label> <input type="text" name="name" />&nbsp
			<label>CGST</label> <input type="text" name="name" />&nbsp <label>IGST</label>
			<input type="text" name="name" />&nbsp <label>DATE</label> <input
				type="date" value="dd/mm/yyyy" />&nbsp <label>STATUS</label> <select
				name="">
				<option value="A">active</option>
				<option value="D">deactive</option>
			</select>&nbsp
			<div class="btnn">
				<br> <input type="submit" name="submit" />
			</div>
			<br>
		</div>
	</form>
	<div class="table">
		<table>
			<tr id="tablecolor">
				<th>sl.no</th>
				<th>SGST</th>
				<th>CGST</th>
				<th>IGST</th>
				<th>DATE</th>
				<th>STATUS</th>
				<th>ACTION</th>
			</tr>
			<tr>
				<td>1</td>
				<td>1</td>
				<td>1</td>
				<td>1</td>
				<td>1</td>
				<td>1</td>
				<td><div class="btn-group">
						<input type="button" class="btn btn-info" value="EDIT"
							id="edit"/>&nbsp<input
							type="button" class="btn btn-danger" value="DELETE"
							id="delete" />
					</div></td>
			</tr>
		</table>
	</div>
</body>

</html>