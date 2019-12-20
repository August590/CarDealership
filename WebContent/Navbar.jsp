<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	    <link rel="stylesheet" href="styles\styles.css">
</head>
<body>
	<header>
	      <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
	        <a class="navbar-brand" href="index.jsp">Yes sell cars</a>
	        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
	          <span class="navbar-toggler-icon"></span>
	        </button>
	        <div class="collapse navbar-collapse" id="navbarCollapse">
	          <ul class="navbar-nav mr-auto">
	            <li class="nav-item active">
	            	<!-- <form action="inventoryServlet" method="post">
	            	 <label for="Home" class= "Ast Trust">H </label>
	            	</form> -->
	            	<form action="index.jsp">
	            		<button class="btn btn-default button" type="submit">Home</button>
	            	</form>
	              <!-- <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a> -->
	            </li>
	            <li class="nav-item">
		            <form>
		              <button class="btn btn-default button" formaction="inventoryServlet">Inventory</button>
		              </form>
	            </li>
	            <li class="nav-item">
	              <form>
		              <button class="btn btn-default button" formaction="detailsShowServlet">Report</button>
		              </form>
	            </li>
	          </ul>
	        </div>
	      </nav>
	    </header>
</body>
</html>