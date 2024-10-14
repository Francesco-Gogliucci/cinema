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
<title>utente</title>
</head>
<body class="custom-bg">
<%@ include file="nav.jsp"%>
<section class="py-5 text-center container headline-background">
    <div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto">
      </div>
    </div>
      <div class="col-lg-4">
    <img src="user-286.png" class="bd-placeholder-img rounded-circle" width="140" height="140" alt="">
    <h2 class="fw-normal" style="font-size: 20px; color:rgb(238, 226, 58);">User</h2>
</div>
  </section>
 
  <div class="album py-5">
  <h2 class="text-center mb-4; testo-titoli">Film Preferiti</h2>
	 <div class="container" style="padding-top: 20px">
		 <div class ="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-3">
	 <!-- codice temporaneo per pololare la pagina -->
	 
			 <% HashMap <String, String> films = new HashMap<>(); 
			 		films.put("https://a.ltrbxd.com/resized/film-poster/2/7/7/0/6/4/277064-barbie-0-1000-0-1500-crop.jpg?v=1b83dc7a71", "Barbie");
			 		films.put("https://a.ltrbxd.com/resized/film-poster/8/6/1/1/4/86114-the-wolf-of-wall-street-0-1000-0-1500-crop.jpg?v=9fd1891260","The wolf of Wall Street");
			 		films.put("https://a.ltrbxd.com/resized/sm/upload/hv/nn/05/ss/d20vOJpywFDoz7Dd4ChomGdP0fr-0-1000-0-1500-crop.jpg?v=836521d1aa","Tonya");
			 		films.put("https://a.ltrbxd.com/resized/film-poster/9/4/9/0/5/3/949053-its-whats-inside-0-1000-0-1500-crop.jpg?v=ea1abf3c49","It’s What’s Inside");
			 
			 	
			 	for(String url : films.keySet()){
			 	
			 %>
	  			 <div class="col">
					 <div class="card-locandina card" 
						 style="border-color:transparent;
							height: 100%; width:200px;
							background-color: transparent;
						}">
					 <img class="card-img-top" src="<%= url%>"style="border-radius:15px; height: 100%; width:200px; object-fit: cover">
	 			<h6 class="card-title testo-pargraph"><%= films.get(url)%></h6>
			 </div>
	 	 </div>
	
			 <%
	 		}
		 %>
	
	 	</div>
	 </div>
</div>
<div class="container" style="padding-top: 40px;">
  <div class="row g-3">
    <div class="col text-start" style="border-bottom: 4px solid rgb(101, 131, 161); color: rgb(101, 131, 161);">
      <h3>La nostra community</h3>
    </div>

    <div class="col"></div>
  </div>
</div>
<br>
<br>
 <div class="row" style="padding-left: 100px;">
      <div class="col-lg-2">
    <img src="user-286.png" class="bd-placeholder-img rounded-circle" width="100" height="100" alt="">
    <h2 class="fw-normal" style="font-size: 20px; opacity: 0.5; color: white">Mario900</h2>
    <p><a class="btn btn-giallo" href="#">Vedi utente</a></p>
</div>
     <div class="col-lg-2">
    <img src="user-286.png" class="bd-placeholder-img rounded-circle" width="100" height="100" alt="">
    <h2 class="fw-normal" style="font-size: 20px; opacity: 0.5; color: white">Andrea80</h2>
    <p><a class="btn btn-giallo" href="#">Vedi utente</a></p>
</div>
<div class="col-lg-2">
    <img src="user-286.png" class="bd-placeholder-img rounded-circle" width="100" height="100" alt="">
    <h2 class="fw-normal" style="font-size: 20px; opacity: 0.5; color: white">Marco980</h2>
    <p><a class="btn btn-giallo" href="#">Vedi utente</a></p>
</div>
</body>
</html>