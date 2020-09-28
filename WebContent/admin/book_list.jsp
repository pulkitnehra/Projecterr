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
<title>Manage Books - Evergreen Bookstore Administration</title>
</head>
<body>

	<jsp:directive.include file="header.jsp"/>	
	<div align="center">
	<br><br>
	<h2 class="pageheading">Book's Management</h2>
	<a href="new_book"><b>Create New Book</b></a>
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
	<th>Image</th>
	<th>Title</th>
	<th>Author</th>
	<th>Category</th>
	<th>Price</th>
	<th>Last Updated</th>
	<th>Actions</th>
	</tr>
	
	<!-- Fetching and inserting data into table -->
	<c:forEach var="book" items="${listBooks}" varStatus="status">
	<tr>
	<td>${status.index + 1}</td>
	<td>${book.bookId}</td>
	<td>
		<img src="data:image/jpg;base64,${book.base64Image}" width="84" height="110">
	</td>
	<td>${book.title}</td>
	<td>${book.author}</td>
	<td>${book.category.name}</td>
	<td>${book.price}</td>
	<td>${book.lastUpdateTime}</td>
	<td>
	<b>
	<a href="edit_book?id=${book.bookId}">Edit</a>&nbsp;
	<a href="javascript:void(0)" class="deleteLink" id="${book.bookId}">Delete</a>
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
			userId = $(this).attr("id");
			if(confirm("Are You sure you want to delete the user with ID: "+ userId +" ?.")){
				window.location = "delete_user?id=" +userId;
			}
		})
	});
});


/* 	function confirmDelete(userId){
		if(confirm("Are You sure you want to delete the user with ID: "+ userId +" ?.")){
			window.location = "delete_user?id=" +userId;
		}
	} */

</script>

</html>