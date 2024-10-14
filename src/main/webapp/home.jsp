<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="it.generationitaly.cinema.entity.*" %>
<%@ page import="java.util.List"
		import="java.util.HashMap"
		import="java.util.ArrayList"
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<link rel="stylesheet" href="style.css">
</head>
<body class="custom-bg">
<%@ include file="nav.jsp"%>

<section class="py-5 text-center container-fluid headline-background">
    <div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto">
        <h1 class="testo-titoli">CINEMA</h1>
        <p class="testo-pargraph">Resta sempre aggiornato sulle ultime uscite e scopri sempre nuovi titoly grazie alla nostra community</p>
      </div>
    </div>
  </section>
	 
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
					 <div class="card mb-3" 
						 style="border-color:transparent;
							height: 90%; width:200px;
							background-color: transparent;
							margin-left: 15px;
						}">
					<a href="./film.jsp"><img class="card-img-top" src="<%= url%>"style="border-radius:15px; height: 100%; width:200px; object-fit: cover"></a> 
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

	<div class="container" style="padding-top: 40px">
	<div class ="row row-cols-1 row-cols-sm-2 row-cols-md-6 g-3">	
		<div class="col"></div>
			<% List<String> categorie = new ArrayList <String>();
				categorie.add("Azione");
				categorie.add("Avventura");
				categorie.add("Commedia");
				categorie.add("Horror");
				categorie.add("Fantascienza");
				categorie.add("Fantasy");
				categorie.add("Thriller");
				categorie.add("Romantico");
				categorie.add("Animazione");
				categorie.add("Documentario");
				categorie.add("Musical");
				
				for(String categoria : categorie){%>
			<div class="col">
				<a href="./film-cercati.jsp"><button class="btn-chiaro" style="background-color: rgb(101, 131, 161);
	    border-radius: 20px;
	    color: white;
	    padding: 5px 20px;
	    font-size: 14px;
	    border: none;"><%=categoria%></button></a>
			</div>
			<% }
			%>
		
			</div>
			<div class="col"></div>
	</div>
	
	<!--  recensioni utente -->
	<div class="container text-end" style="padding-top: 40px;">
	<div class ="row row-cols-md-2 g-3">
	<div class="col" ></div>
	  <div class="col" style="border-bottom: 4px solid rgb(101, 131, 161); color:rgb(101, 131, 161);">
	    <h3>Scopri i film tramite le recensioni della nostra community</h3>
	  </div>  
	</div>
	</div>
	<!-- inizio div recensioni -->
	<div class="container text-cetered" style="padding-top: 40px;">
	
	<% 
	        // Creazione di oggetti Utente
	        Utente utente1 = new Utente("Mario Rossi");
	        Utente utente2 = new Utente("Luisa Verdi");
	        Utente utente3 = new Utente("Giulia Bianchi");
	        Utente utente4 = new Utente("Alessandro Neri");

	        // Creazione di oggetti Film
	        Film film1 = new Film("Inception");
	        Film film2 = new Film("The Matrix");
	        Film film3 = new Film("The Godfather");
	        Film film4 = new Film("Pulp Fiction");

	        // Creazione di oggetti Recensione
	        Recensione recensione1 = new Recensione("Film spettacolare, trama coinvolgente.", utente1, film1);
	        Recensione recensione2 = new Recensione("Un classico della fantascienza, da rivedere!", utente2, film2);
	        Recensione recensione3 = new Recensione("Uno dei migliori film di sempre.", utente3, film3);
	        Recensione recensione4 = new Recensione("Dialoghi e regia magistrali!", utente4, film4);

			//aggiunta recensioni a una lista, come ci arriveranno da una servelet
			List <Recensione> recensioni=new ArrayList<>();
				recensioni.add(recensione1);
				recensioni.add(recensione2);
				recensioni.add(recensione3);
				recensioni.add(recensione4);
				
			for(Recensione recensione:recensioni){%>
			
			<div class ="row row-cols-md-2 g-3">
			
				<div class="col" style="color:rgb(101, 131, 161); width: 200px; padding-left:20px">
	   				 <h5><%=recensione.getUtente().getUsername() %></h5>
	   			</div >
	   			<div class="col" style="border-top: 4px solid rgb(101, 131, 161); color:rgb(101, 131, 161); ">
	   			<h5 style="color:white"><%=recensione.getFilm().getTitolo()%></h5>
	   			<p><%=recensione.getRecensione()%></p>
	   			</div>
			</div >
		<%	}
	%>
	</div>
	
	<%@ include file="footer.jsp"%>
</body>
</html>