<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
<link rel="stylesheet" href="../css/style.css">
<meta charset="ISO-8859-1">
<title>Manage Categories - Evergreen Bookstore Administration</title>
</head>
<body>

	<jsp:directive.include file="header.jsp"/>	
	<div align="center">
	<br><br>
	<h2 class="pageheading">Category Management</h2>
	<a href="category_form.jsp"><b>Create New Category</b></a>
	</div>
	
	<c:if test="${message !=null}">
	<div align="center">
	<h4 class="message"><i>${message}</i></h4>
	</div>
	</c:if>
	<div align="center">
	&nbsp;&nbsp;
	<table border="3" cellpadding=5>
	<tr>
	<th>Index</th>
	<th>ID</th>
	<th>Name</th>
	<th>Action</th>
	</tr>
	
	<!-- Fetching and inserting data into table -->
	<c:forEach var="cat" items="${listcategory}" varStatus="status">
	<tr>
	<td>${status.index + 1}</td>
	<td>${cat.categoryId}</td>
	<td>${cat.name}</td>
	<td>
	<b>
	<a href="edit_category?id=${cat.categoryId}">Edit</a>&nbsp;
	<a href="javascript:void(0)" class="deleteLink" id="${cat.categoryId}">Delete</a>
	</b>
	</td>
	</tr>
	</c:forEach>
	
	</table>
	
	</div>
	

	
	<jsp:directive.include file="footer.jsp"/>
</body>
<script type="text/javascript">

$(document).ready(function(){
	
	$(".deleteLink").each(function(){
		$(this).on("click", function(){
			categoryId = $(this).attr("id");
			if(confirm("Are You sure you want to delete the category with ID: "+ categoryId +" ?.")){
				window.location = "delete_category?id=" +categoryId ;
			}
		})
	});
});







	/* function confirmDelete(categoryId){
		if(confirm("Are You sure you want to delete the Category with ID: "+ categoryId +" ?.")){
			window.location = "delete_category?id=" +categoryId;
		}
	} */

</script>

</html>