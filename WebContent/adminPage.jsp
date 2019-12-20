<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	<br>
 	<div class="container">
		<form action="addingToInvServlet" method="POST">
			<div class="form-group">
				<label for= "manufacturer"> Manufacturer</label>
				<!-- <input type="text" class="form-control" name="gradeOne" id="gradeOne" placeholder=" Grade One"> -->
				<input type="text" class="form-control" name="manufacturer" id="manufacturer" placeholder="Manufacturer">
			</div>
			<div class="form-group">
				<label for= "model"> Model</label>
				<!-- <input type="text" class="form-control" name="gradeOne" id="gradeOne" placeholder=" Grade One"> -->
				<input type="text" class="form-control" name="model" id="model" placeholder="Model">
			</div>
			<div class="form-group">
				<label for= "make"> Make</label>
				<!-- <input type="text" class="form-control" name="gradeOne" id="gradeOne" placeholder=" Grade One"> -->
				<input type="text" class="form-control" name="make" id="make" placeholder="Make">
			</div>
			<div class="form-group">
				<label for= "kilo"> Kilo</label>
				<!-- <input type="text" class="form-control" name="gradeOne" id="gradeOne" placeholder=" Grade One"> -->
				<input type="text" class="form-control" name="kilo" id="kilo" placeholder="Kilo">
			</div>
			<div class="form-group">
				<label for= "picture"> Manufacturer</label>
				<!-- <input type="text" class="form-control" name="gradeOne" id="gradeOne" placeholder=" Grade One"> -->
				<input type="text" class="form-control" name="picture" id="picture" placeholder="Picture">
			</div>
			<div class="form-group">
				<label for= "price"> Price</label>
				<!-- <input type="text" class="form-control" name="gradeOne" id="gradeOne" placeholder=" Grade One"> -->
				<input type="text" class="form-control" name="price" id="price" placeholder="Price">
			</div>
			<div class="form-group">
				<label for= "used"> Used</label>
				<!--<input type="checkbox" name="weekday" value="FRIDAY" id="weekday-fri" class="weekday"/> -->
				<input type="checkbox" class="form-control" name="used" value="true" id="used" placeholder="Used" style="margin-right: 100px; width: 20px;">
			</div>
			<!-- <button type="submit">add course</button> -->
			<button class="btn btn-primary" type="submit"> Add Car </button>
		</form>
	</div>
</body>
</html>