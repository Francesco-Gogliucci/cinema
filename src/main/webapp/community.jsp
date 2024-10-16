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
     
      <% 
        // Controllo se l'attributo recensioni è nullo per evitare un NullPointerException
        List<Recensione> recensioni = (List <Recensione>) request.getAttribute("elencoRecensioni"); 
        if (recensioni != null) {
          for (Recensione recensione : recensioni) {
      %> 
        <div class="col-lg-2">
          <img src="user-286.png" class="bd-placeholder-img rounded-circle" width="150" height="150" alt="">
          <h2 class="fw-normal" style="font-size: 20px; opacity: 0.5; color: white"><%= recensione.getUtente().getUsername() %></h2>
          <p><a class="btn btn-giallo" href="utenteServlet?id=<%= recensione.getUtente().getId()%>">Vedi utente</a></p>
        </div>
      <% 
          } 
        } else { 
      %>
        <div class="col-lg-12">
          <p class="text-white">Nessuna recensione disponibile.</p>
        </div>
      <% 
        } 
      %>

    <div class="container text-end" style="padding-top: 40px;">
      <div class="row row-cols-md-2 g-3">
        <div class="col"></div>
        <div class="col" style="border-bottom: 4px solid rgb(101, 131, 161); color:rgb(101, 131, 161);">
          <h3>Scopri i film tramite le recensioni della nostra community</h3>
        </div>  
      </div>
    </div>

    <!-- inizio div recensioni -->
    <div class="container text-cetered" style="padding-top: 40px;">
    
      <% 
        // Assicurarsi che recensioni non sia null prima di iterare di nuovo
        if (recensioni != null) {
          for (Recensione recensione : recensioni) {
      %>
          <div class ="row row-cols-md-2 g-3">
            <div class="col" style="color:rgb(101, 131, 161); width: 200px; padding-left:20px">
              <h5><%= recensione.getUtente().getUsername() %></h5>
            </div >
            <div class="col" style="border-top: 4px solid rgb(101, 131, 161); color:rgb(101, 131, 161); ">
              <h5 style="color:white"><%= recensione.getFilm().getTitolo() %></h5>
              <p><%= recensione.getRecensione() %></p>
            </div>
          </div >
      <% 
          }
        }
      %>
    </div>
    
    <%@ include file="footer.jsp"%>
</body>
</html>