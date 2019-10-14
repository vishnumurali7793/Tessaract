<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>tessaract</title>
	<link href="style.css" rel="stylesheet" type="text/css">
	
</head>
<body>
	<h3 align="center">
		Welcome HomE !
		
	</h3>
	<form align="center">
		<div class="login">
			<p align="center">LOGIN</p><br> 
			<label>user ID</label><br> 
			<input type="text" name="name" id="name" /><br>
			<label>password</label><br>
			<input type="text" name="password" id="password" /></br>
			<div class="btnn"><br>
				<input type="submit" name="submit" value="login" />
			</div><br> 
		</div>
	</form>
</body>
</html>