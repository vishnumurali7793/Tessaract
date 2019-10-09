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
#myProgress {
	width: 100%;
	background-color: grey;
}

#myBar {
	width: 1%;
	height: 30px;
	background-color: green;
}

.container{
align-content: center;
justify-content: center;
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
	<%-- <div class="container">
		<div class="row">
			<div class="col-sm 1"></div>
			<div class="col-sm 2">
				<s:form action="login">
					<s:textfield name="name" />
					<br>
					<s:password name="password" tooltip="password" />
					<s:submit class="btn btn-danger" align="center" />
				</s:form>
			</div>
			<div class="col-sm 3"></div>
			<div class="col-sm 4"></div>
		</div>
	</div> --%>
	<!-- <div class="progress">
		<div class="progress-bar progress-bar-striped progress-bar-animated"
			role="progressbar" aria-valuenow="75" aria-valuemin="0"
			aria-valuemax="100" style="width: 75%"></div>
	</div> -->
	<div class="container">
		<div id="myProgress">
			<div id="myBar"></div>
		</div>
	</div>
</body>
<script type="text/javascript">
$(document).ready(function move() {
	  var elem = document.getElementById("myBar");
	  var width = 1;
	  var id = setInterval(frame, 10);
	  function frame() {
	    if (width >= 100) {
	      clearInterval(id);
	      location.href = "login";
	    } else {
	      width++;
	      elem.style.width = width + '%';
	    }
	  }
	} )
</script>
</html>