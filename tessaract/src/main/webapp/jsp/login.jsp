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
body {
	margin: 0;
	padding: 0;
	background: rgb(196, 85, 42);
	background: linear-gradient(90deg, rgba(196, 85, 42, 1) 10%,
		rgba(195, 12, 157, 1) 100%);
	color: white;
}

#loginPane {
	border: 4px solid #4f0f1c;
	padding: 0 10px;
	margin-right: 50px;
	margin-left: 50px;
}

#submit {
	margin: 0px;
}

#header {
	margin-left: 10px;
	height: 70px;
	font-weight: bold;
}

.form-group {
	color: black;
}

#label {
	color: white;
}
</style>
<body>
	<!-- 	<h3 align="center">Tesseract</h3> -->
	<div id="header">
		<h3>Tesseract</h3>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-xs-12 col-md-12" id="login-panel">
				<s:form action="login">

					<div id="loginPane" align="center">
						<h3 align="center" class="header">Login</h3>
						<div class="input-group form-group">
							<label id="label">Username</label>&emsp;<input type="text"
								name="loginBean.userName" id="name" />
						</div>
						<br>
						<div class="input-group form-group">
							<label id="label">Password</label>&emsp;<input type="password"
								name="loginBean.password" id="password" /><br> <br>
							<div id="input-group form-group">
								<input type="submit" name="submit" value="login"
									class="btn btn-warning btn-block" />
							</div>
						</div>
						<br>
					</div>
				</s:form>
			</div>
		</div>
	</div>
</body>
</html>