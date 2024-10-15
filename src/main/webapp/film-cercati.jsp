<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List"
		import="java.util.HashMap"
		import="java.util.ArrayList"
		import="it.generationitaly.cinema.entity.Film"
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
	 
			<% List<Film> films = (List<Film>) request.getAttribute("filmCategoria");
			 	for(Film film : films){
			 	
			 %>
	  			 <div class="col">
					 <div class="card " 
						 style="border-color:transparent;
							height: 90%; width:200px;
							background-color: transparent;
							margin-left: 15px;
						}">
					 <img class="card-img-top" src="<%= film.getLocandina()%>"style="border-radius:15px; height: 100%; width:200px; object-fit: cover">
	 			<h6 class="card-title testo-pargraph"><%= film.getTitolo()%></h6>
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