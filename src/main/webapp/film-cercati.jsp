<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List"
		import="java.util.HashMap"
		import="java.util.ArrayList"
		import="it.generationitaly.cinema.entity.*"
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
	 <div class="container mt-5" style="padding-top: 20px">
		 <div class ="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-3">
		 <!-- se i film vengono dalla richiesta per categorie -->
		 <%if(request.getAttribute("filmCategoria")!=null){
		 
		 List<Film> filmCategoria = (List<Film>) request.getAttribute("filmCategoria");
			 	for(Film film : filmCategoria){
			 	
			 %>
	  			 <div class="col">
					 <div class="card " 
						 style="border-color:transparent;
							height: 90%; width:200px;
							background-color: transparent;
							margin-left: 15px;
						}">
						<a href="dettagliFilm?id=<%= film.getId()%>">
					 <img class="card-img-top" src="<%= film.getLocandina()%>"style="border-radius:15px; height: 100%; width:200px; object-fit: cover"></a>
	 			<h6 class="card-title testo-pargraph"><%= film.getTitolo()%></h6>
			 </div>
	 	 </div>

			<!-- se i film vengono dalla ricerca-->
			<% }
		 }
			if(request.getAttribute("filmTitolo")!=null){
			
			
			List<Film> filmRicerca = (List<Film>)request.getAttribute("filmTitolo");
			 	for(Film film : filmRicerca){
			 	
			 	
			 %>
	  			 <div class="col">
					 <div class="card " 
						 style="border-color:transparent;
							height: 90%; width:200px;
							background-color: transparent;
							margin-left: 15px;">
					 <a href="dettagliFilm?id=<%= film.getId()%>"><img class="card-img-top" src="<%= film.getLocandina()%>"style="border-radius:15px; height: 100%; width:200px; object-fit: cover"></a>
	 			<h6 class="card-title testo-pargraph"><%= film.getTitolo()%></h6>
			 </div>
	 	 </div>
	
			 <%}
			}
			if(request.getAttribute("attori")!=null){	%>
	<div class="row">
	
	<% List<Attore> attoreRicerca = (List<Attore>)request.getAttribute("attori");
			 	for(Attore attore : attoreRicerca){%>
      <div class="col-lg-4">
        <img src="<%= attore.getFoto() %>" class="bd-placeholder-img rounded-circle" width="140" height="140" alt="<%= attore.getNome() %> <%= attore.getCognome() %>">
        <h2 class="fw-normal" style="font-size: 20px; opacity: 0.5; color: white"><%= attore.getNome() %> <%= attore.getCognome() %></h2>
        <p><a class="btn btn-giallo" href="dettagliAttore?id=<%= attore.getId()%>">Vedi attore</a></p>
      </div>
  <% 
		}
      } 
		 if((request.getAttribute("attori")==null)&&(request.getAttribute("filmTitolo")==null)&&(request.getAttribute("filmCategoria")==null)){%>
			<div class="container text-center">
				<h2 style="color:white">La tua ricerca non ha risultati</h2>
				<!-- aggiungere una nuova barra di ricerca  -->
			</div>
			<% 
		}
  %>
</div>
			
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