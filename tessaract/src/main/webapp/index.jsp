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
body {
	background-color: #ebebeb;
	margin: 0px;
	padding: 0px;
}

#myProgress {
	width: 100%;
	background-color: grey;azimuth: 
	
}

#myBar {
	width: 1%;
	height: 30px;
	background-color: #3da5ff;
}

h3 {
	font-family: serif;
	font-size: 40px;
	color: #707070;
	margin-left: 10px;
	margin-top: 15px;
 	padding-top: 15px;
}

#header {
	height: 70px;
	background-color: #fcfcfc;
}
#contentpane{
height: 10cm;
}
</style>
</head>
<body>
	<div id="header">
		<h3>Tesseract</h3>
	</div>
	<div id="contentpane"></div>
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
		var id = setInterval(frame, 100);
		function frame() {
			if (width >= 100) {
				clearInterval(id);
				location.href = "login";
			} else {
				width++;
				elem.style.width = width + '%';
			}
		}
	})
</script>
</html>