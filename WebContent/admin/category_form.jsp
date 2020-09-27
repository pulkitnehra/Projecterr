<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/style.css">
<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
<meta charset="ISO-8859-1">
<c:if test="${category != null}">
<title>Edit Category</title>
</c:if>
<c:if test="${category != null}">
<title>Create a new Category</title>
</c:if>
</head>
<body>

	<jsp:directive.include file="header.jsp"/>	
	
	<div align="center">
	<br><br>
	<h2 class="pageheading">
		<c:if test="${category != null}">
		Edit Category
		</c:if>
		<c:if test="${category == null}">
		Create New Category
		</c:if>
	</h2>
	</div>
	
	<div align="center">
	<c:if test="${category != null}">
		<form name="myform" action="update_category" method="post" id="categoryForm">
		<input type="hidden" name="categoryId" value="${category.categoryId}">
	</c:if>
	
	<c:if test="${category == null}">
	<form name="myform" action="create_category" method="post" id="categoryForm">
	</c:if>
	<table>
		<tr>
			<td align="right">Name:</td>
			<td align="left"><input type="text" id="name" name="name" size="20" value="${category.name}"></td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr >
		
			<td colspan="2" align="center">
			<button type="submit">Save</button>&nbsp;&nbsp;&nbsp;
			<button type="button" onclick="javascript:history.go(-1)">Cancel</button>
			</td>
		</tr>
	
	</table>
	</form>
	</div>
	
	
	
	<jsp:directive.include file="footer.jsp"/>
</body>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#categoryForm").validate({
		rules:{
			name:"required",
		},
	messages:{
		name:"Please enter Category Name!",
	}
});	
});

</script>


</html>