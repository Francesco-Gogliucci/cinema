<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List"
		import="java.util.HashMap"
		import="java.util.ArrayList"
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="custom-bg">
<%@ include file="nav.jsp"%>

	 
	<!-- Poster dei film --> 
<div class="album py-5">
	 <div class="container" style="padding-top: 20px">
		 <div class ="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-3">
	 <!-- codice temporaneo per pololare la pagina -->
	 
			 <% HashMap <String, String> films = new HashMap<>(); 
			 		films.put("https://a.ltrbxd.com/resized/film-poster/2/7/7/0/6/4/277064-barbie-0-1000-0-1500-crop.jpg?v=1b83dc7a71", "Barbie");
			 		films.put("https://a.ltrbxd.com/resized/film-poster/8/6/1/1/4/86114-the-wolf-of-wall-street-0-1000-0-1500-crop.jpg?v=9fd1891260","The wolf of Wall Street");
			 		films.put("https://a.ltrbxd.com/resized/sm/upload/hv/nn/05/ss/d20vOJpywFDoz7Dd4ChomGdP0fr-0-1000-0-1500-crop.jpg?v=836521d1aa","Tonya");
			 		films.put("https://a.ltrbxd.com/resized/film-poster/9/4/9/0/5/3/949053-its-whats-inside-0-1000-0-1500-crop.jpg?v=ea1abf3c49","It’s What’s Inside");
			 		films.put("https://a.ltrbxd.com/resized/film-poster/8/0/0/8/5/8/800858-joker-folie-a-deux-0-1000-0-1500-crop.jpg?v=a4bf0389e2","Joker: Folie à Deux");
			 		films.put("https://a.ltrbxd.com/resized/sm/upload/t0/3y/yr/rs/n3rm3gxguxzFDlygpROV7RHbELe-0-1000-0-1500-crop.jpg?v=67909d635e","Suicide Squad");
			 		films.put("https://a.ltrbxd.com/resized/film-poster/5/8/9/3/1/7/589317-amsterdam-0-1000-0-1500-crop.jpg?v=92e1cb7cab","Amsterdam");
			 		films.put("https://a.ltrbxd.com/resized/film-poster/3/9/7/8/5/9/397859-once-upon-a-time-in-hollywood-0-1000-0-1500-crop.jpg?v=f3e8612854","Unce Upon a Time in Hollywood");
			 
			 	
			 	for(String url : films.keySet()){
			 	
			 %>
	  			 <div class="col">
					 <div class="card " 
						 style="border-color:transparent;
							height: 90%; width:200px;
							background-color: transparent;
							margin-left: 15px;
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


		<!-- Categori, bottoni-->

	<div class="container text-end" style="padding-top: 20px;">
	<div class ="row row-cols-md-2 g-3">
	<div class="col" ></div>
	  <div class="col" style="border-bottom: 4px solid rgb(101, 131, 161); color:rgb(101, 131, 161);">
	    <h3>Scopri i film tramite le categorie</h3>
	  </div>  
	</div>
	</div>

	
	<%@ include file="footer.jsp"%>

</body>
</html>