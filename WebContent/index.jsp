<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">	
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    <meta name="description" content="">
	    <meta name="author" content="">
	     <link rel="canonical" href="https://getbootstrap.com/docs/4.0/examples/carousel/">
	    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	    
	  	<link rel="stylesheet" href="D:\JavaTraining\claim-workspace\CarDealership\WebContent\styles\styles.css">
	  
	  	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	  </head>
	  <body>
	
	   
	     <jsp:include page="Navbar.jsp"/> 
	 
	
	    <main role="main">
	
	      <div id="myCarousel" class="carousel slide" data-ride="carousel" style="width:100%">
	        <ol class="carousel-indicators">
	          <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
	          <li data-target="#myCarousel" data-slide-to="1"></li>
	          <li data-target="#myCarousel" data-slide-to="2"></li>
	        </ol>
	        <div class="carousel-inner">
	          <div class="carousel-item active">
	            <img class="d-block w-100" src="https://cdn.motor1.com/images/mgl/AEjJP/s1/2019-mazda-cx-5-signature-driving-notes.jpg"  alt="First slide" height=100%>
	            <div class="container">
	              <div class="carousel-caption text-left">
	                
	              </div>
	            </div>
	          </div>
	          <div class="carousel-item">
	            <img class="d-block w-100"src="https://cdn.cnn.com/cnnnext/dam/assets/191121212606-tesla-cybertruck-exlarge-169.jpg" alt="Second slide" height=100%>
	            <div class="container">
	              <div class="carousel-caption">
	                
	              </div>
	            </div>
	          </div>
	          <div class="carousel-item">
	            <img class="d-block w-100" src="https://www.cstatic-images.com/car-pictures/xl/usc80jes162a021001.png" alt="Third slide" height=100%>
	            <div class="container">
	              <div class="carousel-caption text-right">
	                
	              </div>
	            </div>
	          </div>
	        </div>
	        <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
	          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	          <span class="sr-only">Previous</span>
	        </a>
	        <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
	          <span class="carousel-control-next-icon" aria-hidden="true"></span>
	          <span class="sr-only">Next</span>
	        </a>
	      </div>
	

	
	
	      <!-- FOOTER -->
	      <footer class="container">
	        <p class="float-right"><a href="#">Back to top</a></p>
	        <p>&copy; 2017-2018 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
	      </footer>
	    </main>
	
	  
	  </body>
</html>