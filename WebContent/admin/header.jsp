<div align="center">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<img src="../images/BookstoreAdminLogo.png">
	<div>
	Welcome, <c:out value="${sessionScope.useremail}" /> | <a href="logout">logout</a><br>
</div>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<div id="headermenu">

	<div>
		<a href="user_list">
		<img src="../images/users.png"/><br>Users
		</a>
	</div>
	
		
	<div>
		<a href="list_category">
		<img src="../images/category.png"/><br>Categories
		</a>
	</div>
	
	<div>
		<a href="books">
		<img src="../images/bookstack.png"/><br>Books
		</a>
	</div>
	
	<div>
		<a href="custoemr">
		<img src="../images/customer.png"/><br>Customer
		</a>
	</div>
	
	<div>
		<a href="review">
		<img src="../images/review.png"/><br>Review
		</a>
	</div>
	
	<div>
		<a href="orders">
		<img src="../images/order.png"/><br>Orders
		</a>
	</div>
	
	</div>
	
</div>
