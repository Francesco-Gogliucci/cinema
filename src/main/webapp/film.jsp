<%@page import="it.generationitaly.cinema.repository.impl.PreferitiRepositoryImpl"%>
<%@page import="it.generationitaly.cinema.repository.impl.RecensioneRepositoryImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="it.generationitaly.cinema.entity.*" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Film</title>
<link rel="stylesheet" href="style.css">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css" rel="stylesheet">
</head>
<body class="custom-bg">
<%@ include file="nav.jsp"%>

<div class="container text-center">
<div class="row">

  <!-- Dettagli del film -->
  <div class="col-md-4">
    <div class="card card-attore" style="border-color:transparent; background-color: transparent; padding-top: 100px;">
      <% 
        Film film = (Film) request.getAttribute("film"); 
        // Aggiunto controllo nullità per evitare errori
        if (film != null) { 
      %>
         <img src="<%= film.getLocandina() %>" height="550" width="358" style="border-radius:15px" class="card-img-top" alt="locandina del film">
         <div class="card-body"></div>
      <% 
        } else { 
      %>
         <p style="color: white;">Film non trovato.</p>
      <% } %>
    </div>
  </div>

  <!-- Dettagli del film -->
  <% if (film != null) { %> <!-- Aggiunto controllo nullità qui -->
  <div style="margin-left: 20px; max-width: 500px; padding-top: 100px;">
      <span style="font-size: 40px; opacity: 0.5; color: white;">DETTAGLI</span>
      <h1 style="color: white;">"<%= film.getTitolo() %>"</h1>
      <div>
        <p style="color: white;"><%= film.getTrama() %></p>
      </div>
      <br>
      <div>
        <span style="font-size: 20px; opacity: 0.5; color: white;">Durata:</span>
        <p style="font-size: 15px; opacity: 0.5; color: white;"><%= film.getDurata() %> minuti</p>
        <span style="font-size: 20px; opacity: 0.5; color: white;">Data di uscita:</span>
        <p style="font-size: 15px; opacity: 0.5; color: white;"><%= film.getDataUscita() %></p>
        <span style="font-size: 20px; opacity: 0.5; color: white;">Genere:</span>
        <p style="font-size: 15px; opacity: 0.5; color: white;"><%= film.getCategoria().getGenere() %></p>
      </div>
    </div>
  <% } %> <!-- Fine controllo nullità -->

</div>

<!-- Sezione CAST -->
<br>
<span style="font-size: 40px; opacity: 0.5; color: white;">CAST</span>
<br><br><br>
<div class="row">
  <% 
    if (film != null) { // Aggiunto controllo nullità anche per il cast
      List<Attore> elencoAttori = film.getAttori();
      for (Attore attore : elencoAttori) { 
  %>
      <div class="col-lg-4">
        <img src="<%= attore.getFoto() %>" class="bd-placeholder-img rounded-circle" width="140" height="140" alt="<%= attore.getNome() %> <%= attore.getCognome() %>">
        <h2 class="fw-normal" style="font-size: 20px; opacity: 0.5; color: white"><%= attore.getNome() %> <%= attore.getCognome() %></h2>
        <p style="font-size: 15px; opacity: 0.5; color: white">Ruolo principale</p>
        <p><a class="btn btn-giallo" href="dettagliAttore?id=<%= attore.getId()%>">Vedi attore</a></p>
      </div>
  <% 
      } 
    } 
  %>
</div>

<!-- Sezione recensioni -->
<br><br>
<div class="row" style="padding-left: 200px;">
  <div class="col-lg-4">
    <% if (session.getAttribute("username") == null) { %>
      <p style="font-size: 15px; color: white"><a href="./login.jsp" class="btn btn-giallo"<i class="bi bi-box-arrow-in-right"></i>> Accedi per aggiungere una recensione</a></p>
    <% } else {
    	Utente utente = (Utente) session.getAttribute("utente");
    	Long utenteId = utente.getId(); // Recuperiamo l'utente
    	RecensioneRepositoryImpl recensioniRepository = new RecensioneRepositoryImpl();
    	List<Recensione> recensioni = recensioniRepository .findRecensioneByUtenteId(utenteId);
    	boolean recensito = false;
    	for(Recensione r : recensioni) {
    	    if(r.getFilm().getId().equals(film.getId())) {
    	        recensito = true;
    	        break;
    	    }
    	}
    	%>
    	<% if(recensito == false) { %>
      <div class="border rounded" style="background-color: rgb(101, 131, 161); border: none;">
        <div class="p-4" style="background-color: transparent;">
          <h5 class="mb-3" style="color: white;">Lascia una recensione</h5>          
          <form action="recensione" method="post">
            <input type="hidden" name="filmId" value="<%= film.getId() %>">
            <textarea class="form-control mb-3" name="testoRecensione" rows="3" placeholder="La tua recensione" required style="background-color: transparent; color: white; border: 1px solid yellow;"></textarea>
            <div class="form-floating mb-3">
              <button type="submit" class="btn btn-giallo" style="color: black;">INVIA RECENSIONE</button>
            </div>
          </form>
          <% }else{%>
          	<p>Film gia recensito</p>
          <%}%>
        </div>
      </div>
    <% } %>
  </div>
</div>

<!-- Sezione Preferiti -->
<div class="row" style="padding-left: 200px;">
  <div class="col-lg-4">
  <% if (session.getAttribute("username") == null) { %>
              <p style="font-size: 15px; color: white"> <a href="./login.jsp" class="btn btn-giallo"<i class="bi bi-box-arrow-in-right"></i>>Accedi per aggiungere il film ai preferiti</a></p>
            <% } else { 
            	//verifica se il film è gia nei preferiti dell'utente
            	Utente utente = (Utente) session.getAttribute("utente");
            	Long utenteId = utente.getId(); // Recuperiamo l'utente
            	PreferitiRepositoryImpl preferitiRepository = new PreferitiRepositoryImpl();
            	List<Preferiti> preferiti = preferitiRepository.findPreferitiByUtenteId(utenteId);
            	boolean preferito = false;
            	for(Preferiti p : preferiti) {
            	    if(p.getFilm().getId().equals(film.getId())) {
            	        preferito = true;
            	        break;
            	    }
            	}
            %>
    	   <% if(preferito == false) { %>
    	<form action="preferiti" method="post">
    	   <input type="hidden" name="idUtente" value="<%=utente.getId()%>">
    	   <input type="hidden" name="filmId" value="<%=film.getId()%>">
    	       <img alt="fiml gia nei preferiti" src="star.png" style="width:100px">
    	   <% } else { %>
    	       <button type="submit" class="btn btn-giallo"><img alt="fiml gia nei preferiti" src="star white.png" style="width:100px"></button>
    	   <% } %>
    	</form>
    <% } %>
  </div>
</div>
</body>
</html>