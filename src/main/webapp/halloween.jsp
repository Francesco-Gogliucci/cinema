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
    <div class="row justify-content-evenly" style="padding-top: 50px">
  <div class="col-11" >
  <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <a href="dettagliFilm?id=61"><img src="carrosellohalloween1.png" class="d-block w-100"  alt="..."></a>
      <div class="carousel-caption d-none d-md-block">
        <h1 style="text-transform: uppercase;">Terrifier 3:<span style="text-transform: lowercase;"> il nuovo violentissimo slasher con Art il Clown</span></h1>
      </div>
    </div>
    <div class="carousel-item">
      <a href="dettagliFilm?id=62"><img src="carosellohalloween2.png" class="d-block w-100" alt="..."></a>
      <div class="carousel-caption d-none d-md-block">
        <h1 style="text-transform: uppercase;">It:<span style="text-transform: lowercase;"> L'adattamento dell'omonimo romanzo di Stephen King</span></h1>
      </div>
    </div>
    <div class="carousel-item">
      <a href="dettagliFilm?id=63"><img src="carosellohalloween3.png" class="d-block w-100" alt="..."></a>
      <div class="carousel-caption d-none d-md-block">
        <h1 style="text-transform: uppercase;">The nun: <span style="text-transform: lowercase;">Una giovane suora e un prete partono alla volta della Romania per scoprire i segreti di un luogo sacro infestato da uno spirito maligno.</span></h1>
      </div>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
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