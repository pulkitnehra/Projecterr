<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Internal server error</title>
</head>
<body>

	<div align="center">
	<img src="${pageContext.request.contextPath}/images/BookstoreLogo.png"/>
	</div>
	
	<div align="center">
	<h2>Sorry, the server has encountered an error while fulfilling your request.</h2>
	<h3>Please try again later or contact our Administrators.</h3>
	</div>
	
	<div align="center">
	<a href="javascript:history.go(-1)">Go back.</a>
	</div>

</body>
</html>