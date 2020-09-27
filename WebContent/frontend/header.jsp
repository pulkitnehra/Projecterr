<div align="center">
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div>
	<img src="images/BookstoreLogo.png"/>
	</div>
	
	<div>
	<input type="text" name="keyword" size=50>
	<input type="button" value="Search">
	
	<!-- For spacing -->
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	
	<a href="login">Sign In</a> |
	<a href="Register">Register</a> |
	<a href="view_cart">Cart</a>
	</div>
	<div>&nbsp;</div>
	<div>
	<c:forEach var="category" items = "${listcategory}" varStatus="status">
	<b>
	<a href="view_category?id=${category.categoryId}">
		<font size="+1"><c:out value="${category.name}"/> </font>
	</a>
	</b>
	<!-- removing the last line -->
	<c:if test = "${not status.last}">
	&nbsp; |  &nbsp;
	</c:if>
	</c:forEach>
	</div>
	

	</div>