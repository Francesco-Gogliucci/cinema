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
<link rel="stylesheet" href="style.css">
</head>


<body class="custom-bg">
<%@ include file="nav.jsp"%>
<!-- head novità -->
<section class="py-5 text-center container-fluid headline-background">
    <div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto">
        <h1 class="testo-titoli">COMMUNITY</h1>
        <p class="testo-pargraph">Resta sempre aggiornato sulle ultime uscite e scopri sempre nuovi titoli grazie alla nostra community</p>
      </div>
    </div>
  </section>
	 
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
					 <div class="card mb-3" 
						 style="border-color:transparent;
							height: 90%; width:200px;
							background-color: transparent;
							margin-left: 15px;
							padding-bottom: 20px;
							border-radius:20px;">
					<a href="dettagliFilm?id=<%= film.getId()%>"><img class="card-img-top" src="<%=film.getLocandina()%>"style="border-radius:15px; height: 280px; width:200px; object-fit: cover"></a> 
	 			<h6 class="card-title testo-pargraph"><%=film.getTitolo()%></h6>
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
							margin-left: 15px;
							padding: 20">
					 <a href="dettagliFilm?id=<%= film.getId()%>"><img class="card-img-top" src="<%= film.getLocandina()%>"style="border-radius:15px; height: 100%; width:200px; object-fit: cover"></a>
	 			<h6 class="card-title testo-pargraph"><%= film.getTitolo()%></h6>
			 </div>
	 	 </div>
	
			 <%}
			}
			if(request.getAttribute("attori")!=null){	%>
			</div>
	<div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 ml-5 g-3">
	
	<% List<Attore> attoreRicerca = (List<Attore>)request.getAttribute("attori");
			 	for(Attore attore : attoreRicerca){%>
      <div class="col ml-5">
        <a href="dettagliAttore?id=<%= attore.getId()%>"><img src="<%= attore.getFoto() %>" class="rounded-circle mb-1 hover-shadow" style="width: 150px; height: 150px; object-fit: cover; border-radius: 50%; box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.5);"></a>
        <h2 class="fw-normal" style="font-size: 20px; opacity: 0.5; color: white"><%= attore.getNome() %> <%= attore.getCognome() %></h2>
      </div>
  <% 
		}
      }else{
    	  %> </div><% 
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


		<!-- Categoria bottone-->

	<div class="container text-end mb-5" style="padding-top: 20px;">
	<div class ="row row-cols-md-2 g-3">
	    <a href="elencoCategoria"><button class="btn-chiaro">Scopri i film tramite le categorie</button>
	    </a>
	</div>
	</div>

	
	<%@ include file="footer.jsp"%>

</body>
</html>