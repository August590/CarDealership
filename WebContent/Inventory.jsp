<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!--  page import= "com.user.Student" %> -->
    <!--  Student student = (Student) session.getAttribute("student"); %> -->
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ page import= "com.cars.Inventory" %>
    <%@ page import= "com.cars.Car" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">	
<!--  Student student = (Student) session.getAttribute("student"); %> -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link rel="stylesheet" href="styles\styles.css">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
		<title>Hi There</title>
</head>
<body>
	<jsp:include page="Navbar.jsp"/>
	<br>
<ul class="nav nav-tabs">
  <li class="nav-item">
 	<form action="inventoryServlet">
    	<button class="nav-link active" >Inventory</button>
    </form>
  </li>
  <li class="nav-item">
  	<form class="form-inline mt-2 mt-md-0" action="searchingInventoryServlet">
	    <input class="form-control mr-sm-2" type="text" name ="model" placeholder="Search" aria-label="Search">
	    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
	</form>
</li>
</ul>
<c:forEach items="${inventory.getInvCars()}" var="cars" varStatus="Loop">
	<c:set var = "Price" value = "${cars.getPrice()}" />
	<div class="card" style="width:60vw">
	  <h5 class="card-header"><c:out value = "${cars.getManufacturer()}"/> </h5>
	  <div class="card-body">
		  <img alt="" src="${cars.getUrlPic()}" width=50%>
		  <ul class="list-group list-group-horizontal-sm">
			  <li class="list-group-item"><c:out value = "Model: ${cars.getMake()}"/></li>
			  <c:if test="${cars.isUsed()}">
			  <li class="list-group-item">Used: Yes</li>
			  </c:if>
			  <c:if test="${!cars.isUsed()}">
			  <li class="list-group-item">Used: No</li>
			  </c:if>
			  <li class="list-group-item"><c:out value = "Kilo: ${cars.getKilo()}"/></li>
			  <li class="list-group-item"><fmt:formatNumber value = "${Price}" type = "currency"/></li>
			</ul>
		    <a  class="btn btn-primary" type="button" href="/CarDealership/detailsServlet?vendID=${cars.getVendID()}">Details</a>
	  </div>
	</div>
</c:forEach>
<div class="modal" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
	  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">New Message</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <ul class="list-group list-group-flush myModalList" style= "margin-left: 20px">
				  <li class="listItem list-group-item1">Detail</li>
				  <li class="listItem list-group-item2">Detail</li>
				  <li class="listItem list-group-item3">Detail</li>
				  <li class="listItem list-group-item4">Detail</li>
				  <li class="listItem list-group-item5">Detail</li>
				  <li class="listItem list-group-item5">Detail</li>
				</ul>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		  <!--  		<form action="removingFromInvServlet">
		        	<button type="submit" id="buyBtn" class="btn btn-primary" name="vendID" value="">Buy</button>
		        </form> -->
		        <button type="button" id="bt" class="btn btn-primary" data-toggle="modal" data-target="#transactionModal" 
		        data-vendid="">Buy</button>
		      </div>
		    </div>
	  </div>
</div> 
<div class="modal" id="transactionModal" tabindex="-1" role="dialog" aria-labelledby="transactionModalLabel">
	  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="transactionModalTitle">New Message</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>

		      </div>
		      <div class="modal-body" >
		      	<form action="addingTransactionServlet" id="transForm">
		        	<div class="form-group">
		        	<label for="firstName" class="col-form-label">First Name</label>
		        	<input type="text" class="form-control" name="firstName" id="firstName" placeholder="First Name">
		        	</div>
		        	<div class="form-group">
		        	<label for="lastName" class="col-form-label">Last Name</label>
		        	<input type="text" class="form-control" name="lastName" id="lastName" placeholder="Last Name">
		        	</div>
		        	<div class="form-group" class="col-form-label">
		        	<label for="email">Email</label>
		        	<input type="text" class="form-control" name="email" id="email" placeholder="Email">
		        	</div>
		        
		        </form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		        <button type="submit" class="btn btn-primary" name="vendID"  id="buyBtn" form="transForm" value="sup">Buy</button>
		        
		      </div>
		    </div>
	  </div>
</div>
</body>
    <!-- 			<div class="form1">
		    <label for="password"> Password <span class="Ast"></span></label>
		    <input type="text" class="form-control" name="password" id="password" placeholder="Enter Password">
		  </div> -->
 <script type="text/javascript">
   		$('#exampleModal').on('show.bs.modal', function (event) {
		  var button = $(event.relatedTarget)
		  var myManu = button.data('manu')
		  var myMod = button.data('mod')
		  var myMake = button.data('make')
		  var myKilo = button.data('kilo')
		  var myPrice = button.data('price')
		  var myVend = button.data('vendid')
		  var modal = $(this)
		  modal.find('.modal-title').text(myManu)
		  modal.find('.list-group-item1').text('Model: ' + myMod)
		  modal.find('.list-group-item2').text('Make: ' + myMake)
		  modal.find('.list-group-item3').text('Kilo: ' + myKilo)
		  modal.find('.list-group-item4').text('Price: ' + myPrice)
		  var tranButton = document.getElementById("bt")
		  $('#bt').attr('data-vendid', 'first');
		})
   </script>
  <script type="text/javascript">
   		$('#transactionModal').on('show.bs.modal', function (event) {
		  var buttont $(event.relatedTarget)
		  var myVendt = button.data('vendid')  
		  document.getElementById("buyBtn").value = myVendt
/* 		  var modalt = $(this)
		  modalt.find('.modal-title').text('Model: ') */
		})
   </script>
</html>