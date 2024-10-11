<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="it.generationitaly.cinema.entity.*" %>
<%@ page import="java.util.List"
		import="java.util.HashMap"
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://getbootstrap.com/docs/5.3/assets/js/color-modes.js"></script>
<link rel="stylesheet" href="style.css">
<title>Attore</title>
<link>
<style type="text/css"></style>
</head>


<body class="custom-bg">
<%@ include file="nav.jsp"%>
<!-- class containere e riga -->
<div class="container text-center">
<div class="row">

  <!-- colonnalaterale attore -->
  <div class="col-md-4">
  
  <!-- card attore -->
	<div class="card card-attore"
	style="border-color:transparent;
	background-color: transparent;
	padding-top: 20px;
	">
	  <img src="https://static2.amica.it/wp-content/uploads/2023/08/AMICARCS_20230804112136213_202d2c3412a893b2aed9156e58fb0f2f1-1-635x967.jpg"  height="550" width="358" style="border-radius:15px" class="card-img-top" alt="...">
	  <div class="card-body">
	    <p class="card-text" style="object-fit: cover">Margot Robbie è un attrice e produttrice australiana, conosciuta per i suoi ruoli in film come "The Wolf of Wall Street", "Suicide Squad" e "Tonya</p>
	  </div>
	</div>
	</div> <!-- chiusura colonna 1-->
	 
<!-- colonna film -->
 <div class="col-md-8" style="padding-top: 20px">
	 <div class ="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
	 
	<!-- Poster dei film --> 
 <!-- codice temporaneo per pololare la pagina -->
 
 <% HashMap <String, String> films = new HashMap<>(); 
 		films.put("https://a.ltrbxd.com/resized/film-poster/2/7/7/0/6/4/277064-barbie-0-1000-0-1500-crop.jpg?v=1b83dc7a71", "Barbie");
 		films.put("https://a.ltrbxd.com/resized/film-poster/8/6/1/1/4/86114-the-wolf-of-wall-street-0-1000-0-1500-crop.jpg?v=9fd1891260","The wolf of Wall Street");
 		films.put("https://a.ltrbxd.com/resized/sm/upload/hv/nn/05/ss/d20vOJpywFDoz7Dd4ChomGdP0fr-0-1000-0-1500-crop.jpg?v=836521d1aa","Tonya");
 		films.put("https://a.ltrbxd.com/resized/sm/upload/t0/3y/yr/rs/n3rm3gxguxzFDlygpROV7RHbELe-0-1000-0-1500-crop.jpg?v=67909d635e","Suicide Squad");
 		films.put("https://a.ltrbxd.com/resized/film-poster/5/8/9/3/1/7/589317-amsterdam-0-1000-0-1500-crop.jpg?v=92e1cb7cab","Amsterdam");
 		films.put("https://a.ltrbxd.com/resized/film-poster/3/9/7/8/5/9/397859-once-upon-a-time-in-hollywood-0-1000-0-1500-crop.jpg?v=f3e8612854","Unce Upon a Time in Hollywood");
 
 	
 	for(String url : films.keySet()){
 	
 %>
   <div class="col">
 <div class="card-locandina card" 
 style="border-color:transparent;
	height: 100%; width:200px;
	background-color: transparent;
}">
 <img class="card-img-top" src="<%= url%>"style="border-radius:15px; height: 100%; width:200px; object-fit: cover">
 <h6 class="card-title"><%= films.get(url)%></h6>
 </div>
  </div>

 <%
 }
 %>

 </div>
 </div>

</div>


</div>

<script src="https://getbootstrap.com/docs/5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>