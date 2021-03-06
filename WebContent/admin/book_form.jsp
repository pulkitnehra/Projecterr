<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Create New Book</title>
	<link rel="stylesheet" href="../css/jquery-ui.min.css" >
	<link rel="stylesheet" href="../css/style.css" >
	<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
	<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	
	<div align="center">
		<h2 class="pageheading">
			<c:if test="${book != null}">
				Edit Book
			</c:if>
			<c:if test="${book == null}">
				Create New Book
			</c:if>
		</h2>
	</div>
	
	<div align="center">
		<c:if test="${book != null}">
			<form action="update_book" method="post" id="bookForm">
			<input type="hidden" name="userId" value="${book.userId}">
		</c:if>
		<c:if test="${book == null}">
			<form action="create_book" method="post" id="bookForm">
		</c:if>
		
		<table class="form">
			<tr>
			<td>Category:</td>
			<td>
			<select name="category">
			<c:forEach items="${listCategory}" var="category">
				<option value="${category.categoryId}">
				${category.name}
				</option>
			</c:forEach>
			</select>
			</td>
			</tr>
			<tr>
				<td align="right">Title:</td>
				<td align="left"><input type="text" id="title" name="title" size="20" value="${book.title}" /></td>
			</tr>
			<tr>
				<td align="right">Author:</td>
				<td align="left"><input type="text" id="author" name="author" size="20" value="${book.author}" /></td>
			</tr>
			<tr>
				<td align="right">ISBN:</td>
				<td align="left"><input type="text" id="isbn" name="isbn" size="20" value="${book.isbn}" /></td>
			</tr>
			<tr>
				<td align="right">Publish Date:</td>
				<td align="left"><input type="text" id="publishDate" name="publishDate" size="20" value="${book.publishDate}" /></td>
			</tr>
			<tr>
			<tr>
				<td align="right">Image:</td>
				<td align="left">
				<input type="file" id="bookImage" name="bookImage" size="20" /><br>
				<img id="thumbnail" alt="Image Preview" style="width:20%; margin-top: 10px">
				</td>
			</tr>
			<tr>
				<td align="right">Price:</td>
				<td align="left"><input type="text" id="price" name="price" size="20" /></td>
			</tr>
			<tr>
				<td align="right">Description:</td>
				<td align="left">
					<textarea rows="5" cols="50" name="description" id="description"></textarea>
				</td>
			<tr>
			<tr><td>&nbsp;</td></tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit">Save</button>&nbsp;&nbsp;&nbsp;
					<button id="buttonCancel">Cancel</button>
				</td>
			</tr>				
		</table>
		</form>
	</div>

	<jsp:directive.include file="footer.jsp" />
</body>
<script type="text/javascript">

	$(document).ready(function() {
		$("#bookImage").change(function(){
			showImageThumbnail(this);			
		})
		
		$("#bookForm").validate({
			rules: {
				category:"rewuired",
				title: "required",
				author: "required",
				isbn: "required",
				publishDate: "required",
				bookImage: "required",
				price: "required",
				description: "required",
			},
			
			messages: {
					category:"Please select a category from the book",
					title: "Please enter book title",
					author: "Please enter an author's name",
					isbn: "Please enter valid isbn number",
					publishDate: "Please enter a Publish Date",
					bookImage: "Please enter the book's image",
					price: "Please enter the book's price",
					description: "Please enter the book's description",
					
				},
				
				<c:if test="${user == null}">
				password: "Please enter password"
				</c:if>				
			}
		});
		
		$("#buttonCancel").click(function() {
			history.go(-1);
		});
		
		  
		$("#publishDate").datepicker();  
	});
	
	function showImageThumbnail(fileInput) {
		var file = fileInput.files[0];
		
		var reader = new FileReader();
		
		reader.onload = function(e) {
			$('#thumbnail').attr('src', e.target.result);
		};
		
		reader.readAsDataURL(file);
	}
		

	
	
</script>
</html>