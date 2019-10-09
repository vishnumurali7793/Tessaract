<%@ page contentType="text/html; charset=UTF-8"%>
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
<title>Insert title here</title>
<style type="text/css">
* {
	padding: 0;
	margin: 0;
}

.main-container {
	width: 50%;
	background-color: blue;
}
.col-sm{
background-color: yellow;
align-content: center;
}
</style>
</head>
<body>
	<%-- <div class="main-container">
		<h1 style="color: white;">Hello World!</h1>
		<s:form action="login">
			<s:textfield name="name" />
			<br>
			<s:password name="password" />
			<s:submit class="btn btn-danger" align="center" />
		</s:form>
	</div> --%>
	<div class="container">
		<div class="row">
			<div class="col-sm">
				<s:form action="login">
					<s:textfield name="name" />
					<br>
					<s:password name="password" tooltip="password" />
					<s:submit class="btn btn-danger" align="center" />
				</s:form>
			</div>
		</div>
	</div>
</body>
</html>