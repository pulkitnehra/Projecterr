<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login</title>
<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
<link rel="stylesheet" href="../css/style.css">
</head>
<body>

	<div align="center">
	<h1>Book Store Administration</h1>
	<h2>Admin Login</h2>
	
	<c:if test="${message !=null}">
	<div align="center">
	<h4 class="message"><i>${message}</i></h4>
	</div>
	</c:if>
	
	<div>&nbsp;</div>
	<form id="formLogin" action="login" method="post">
		<table>
			<tr>
				<td>Email:</td>
				<td><input type="text" id="email" name="email" size="20"></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type="password" id="password" name="password" size="20"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><button type="submit">Login</button></td>
			</tr>
			
		</table>		
	</form>
</div>
</body>
<script type="text/javascript">

	$(document).ready(function(){
		
		$("#formLogin").validate({
			rules:{
				email:{
					required:true,
					email:true
				},
				password:"required",
			},
		messages:{
			email:{
				required:"Please enter email!",
				email:"Please enter a valid email address!"
			},
			password:"Please enter Password!"
		}
	});		
});

</script>
</html>