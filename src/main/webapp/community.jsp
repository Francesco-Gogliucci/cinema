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
<title>Insert title here</title>
</head>
<body class="custom-bg">
<%@ include file="nav.jsp"%>
<div class="container mt-5" style="padding-top: 40px;">
  <div class="row g-3">
    <div class="col text-start" style="border-bottom: 4px solid rgb(101, 131, 161); color: rgb(101, 131, 161);">
      <h3>La nostra community</h3>
      <p>Film lovers and friends</p>
    </div>
    <div class="row" style="padding-left: 100px;">
      <div class="col-lg-2">
    <img src="user-286.png" class="bd-placeholder-img rounded-circle" width="150" height="150" alt="">
    <h2 class="fw-normal" style="font-size: 20px; opacity: 0.5; color: white">Mario900</h2>
    <p><a class="btn btn-giallo" href="#">Vedi utente</a></p>
</div>
     <div class="col-lg-2">
    <img src="user-286.png" class="bd-placeholder-img rounded-circle" width="150" height="150" alt="">
    <h2 class="fw-normal" style="font-size: 20px; opacity: 0.5; color: white">Andrea80</h2>
    <p><a class="btn btn-giallo" href="#">Vedi utente</a></p>
</div>
<div class="col-lg-2">
    <img src="user-286.png" class="bd-placeholder-img rounded-circle" width="150" height="150" alt="">
    <h2 class="fw-normal" style="font-size: 20px; opacity: 0.5; color: white">Marco980</h2>
    <p><a class="btn btn-giallo" href="#">Vedi utente</a></p>
</div>
 <div class="col-lg-2">
    <img src="user-286.png" class="bd-placeholder-img rounded-circle" width="150" height="150" alt="">
    <h2 class="fw-normal" style="font-size: 20px; opacity: 0.5; color: white">Mario900</h2>
    <p><a class="btn btn-giallo" href="#">Vedi utente</a></p>
</div>
     <div class="col-lg-2">
    <img src="user-286.png" class="bd-placeholder-img rounded-circle" width="150" height="150" alt="">
    <h2 class="fw-normal" style="font-size: 20px; opacity: 0.5; color: white">Andrea80</h2>
    <p><a class="btn btn-giallo" href="#">Vedi utente</a></p>
</div>
<div class="col-lg-2">
    <img src="user-286.png" class="bd-placeholder-img rounded-circle" width="150" height="150" alt="">
    <h2 class="fw-normal" style="font-size: 20px; opacity: 0.5; color: white">Marco980</h2>
    <p><a class="btn btn-giallo" href="#">Vedi utente</a></p>
</div>
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