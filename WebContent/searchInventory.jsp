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
		<title>Buy Car Now</title>
</head>
<body>
	<jsp:include page="Navbar.jsp"/>
	<br>
<c:forEach items="${inventory.getInvCars()}" var="cars" varStatus="Loop">
	<c:set var = "Price" value = "${cars.getPrice()}" />
	<div class="card" style="width:60vw">
	  <h5 class="card-header"><c:out value = "${cars.getManufacturer()}"/> </h5>
	  <div class="card-body">
		  <h5 class="card-title"><c:out value = "${cars.getModel()}"/></h5>
		  <img alt="" src="${cars.getUrlPic() }" width=50%>
		  <ul class="list-group list-group-horizontal-sm">
			  <li class="list-group-item"><c:out value = "Make: ${cars.getMake()}"/></li>
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
		        <form action="removingFromInvServlet">
		        	<button type="submit" id="buyBtn" class="btn btn-primary" name="vendID" value="">Buy</button>
		        </form>
		      </div>
		    </div>
	  </div>
</div> 
</body>
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
		  document.getElementById("buyBtn").value = myVend
		})
   </script>
</html>