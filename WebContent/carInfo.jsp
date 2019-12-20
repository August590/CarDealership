<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
        <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ page import= "com.cars.Inventory" %>
    <%@ page import= "com.cars.Car" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link rel="stylesheet" href="styles\styles.css">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
		
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="Navbar.jsp"/>
	<c:set var = "Price" value = "${car.myPrice()}" />
	<div class="container mt-2" style="width:60vw">
	  <h5><c:out value = "${car.getManufacturer()}"/> </h5>
	  <div>
		  
		  <img alt="" src="${car.getUrlPic() }" width=50%>
		  <ul class="list-group list-group-horizontal-sm">
			  <li class="list-group-item"><c:out value = "Model: ${car.getMake()}"/></li>
			  <c:if test="${car.isUsed()}">
			  <li class="list-group-item">Used: Yes</li>
			  </c:if>
			  <c:if test="${!car.isUsed()}">
			  <li class="list-group-item">Used: No</li>
			  </c:if>
			  <li class="list-group-item"><c:out value = "Kilo: ${car.getKilo()}"/></li>
			  <li class="list-group-item"><fmt:formatNumber value = "${Price}" type = "currency"/></li>
			</ul>
	  </div>
	</div>

 	<div class="container">
		<form action="addingTransactionServlet" id="transForm">
		  <div class="form-group">
		     <label for="firstName" class="col-form-label">First Name</label>
		     <input type="text" class="form-control" name="firstName" id="firstName" placeholder="First Name" required>
		  </div>
		  <div class="form-group">
		     <label for="lastName" class="col-form-label">Last Name</label>
		     <input type="text" class="form-control" name="lastName" id="lastName" placeholder="Last Name" required>
		  </div>
		  <div class="form-group" class="col-form-label">
		     <label for="email">Email</label>
		     <input type="text" class="form-control" name="email" id="email" placeholder="Email" required>
		     <input type="hidden" name="vendID" value="${vendID}">
		  </div>
		  	<c:if test="${car.getDaysInv() >=120}">
		  		<c:set var = "discountPrice" value = "${car.myDiscPrice()}" />
		  		<label for="bidPrice">between <fmt:formatNumber value = "${discountPrice}" type = "currency"/> and <fmt:formatNumber value = "${Price}" type = "currency"/></label>
		  		<input type="number" min="${car.myDiscPrice()}" max="${car.myPrice()}" required>
		  		<input type="submit" value = "Buy">
		  		<!--<button type="submit" name="vendID" class="btn btn-primary" value="${vendID}">Buy</button>-->
		  		
		  	</c:if>
		  	<c:if test="${car.getDaysInv() <120}">
		  	  <input type="submit" value = "Buy">
		      <!--  <button type="submit" name="vendID" class="btn btn-primary" value="${vendID}">Buy</button>-->
		     </c:if>
		 </form>
		      
	 </div>
</body>
</html>