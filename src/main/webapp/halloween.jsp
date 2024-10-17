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
<title>Halloween</title>
<link rel="stylesheet" href="style.css">
<link rel="icon" type="image/x-icon" href="popcorn.png">
</head>
<body class="custom-bg">
<%@ include file="nav.jsp"%>
<section class="container-fluid headline-background2">
  </section>
<div class="container mt-5" style="padding-top: 40px;">
  <div class="row g-3">
    <div class="col text-start" style="border-bottom: 4px solid rgb(101, 131, 161); color: rgb(101, 131, 161);">
      <h3>Ciack & Chills: è Halloween!</h3>
      <p>Sintonizzati per un divertimento da brividi! Stiamo preparando un'atmosfera spaventosa con una raccolta di film.</p>
    </div>
  </div>
    </div>
    <div class="album py-5">
    <div class="container mt-5" style="padding-top: 20px">
        <div class ="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-3">
           
            <% if(request.getAttribute("filmCategoria") != null) {
                List<Film> filmCategoria = (List<Film>) request.getAttribute("filmCategoria");
                for(Film film : filmCategoria) {
                    String categoria = film.getCategoria().getGenere(); 
                    if(categoria.equalsIgnoreCase("Horror")) {  
            %>
            <div class="col">
                <div class="card" 
                    style="border-color:transparent;
                    height: 90%; width:200px;
                    background-color: transparent;
                    margin-left: 15px;">
                    <a href="dettagliFilm?id=<%= film.getId() %>">
                        <img class="card-img-top" src="<%= film.getLocandina() %>" style="border-radius:15px; height: 100%; width:200px; object-fit: cover">
                    </a>
                    <h6 class="card-title testo-pargraph"><%= film.getTitolo() %></h6>
                </div>
            </div>
            <% 
                    } 
                } 
            } 
            %>
        </div>
    </div>
</div>


    <%@ include file="footer.jsp"%>
</body>
</html>