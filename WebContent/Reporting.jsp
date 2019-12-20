<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
      <%@ page import= "com.cars.Inventory" %>
        <%@ page import= "com.cars.Customer" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link rel="stylesheet" href="styles\styles.css">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
			
<title>Reporting</title>
</head>
<body>
	<jsp:include page="Navbar.jsp"/>
	<br>
	
<div class="table-responsive">
	<table class="table">
			<tr>
				<th>Date of Purchase</th>
				<th>Contact Information</th>
				<th>Car</th>
				<th>Buyer</th>
			</tr>
			<c:forEach var="report" items="${inventory.getTransactionAL()}">
				<tr>
					<td><c:out value="${report.getDate()}"></c:out></td>
					<td><c:out value="${report.getFullName()}"></c:out></td>
					<td><c:out value="${report.getEmail()}"></c:out></td>
					<td><c:out value="${report.getCar()}"></c:out></td>
				</tr>
			</c:forEach>
	</table>
</div>
</body>
</html>