<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="it.generationitaly.cinema.entity.*" %>
    <%@ page import="java.util.List"
		import="java.util.HashMap"
		import="java.util.ArrayList"
		import="java.util.Date"
		import="java.text.SimpleDateFormat"
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
<link rel="icon" type="image/x-icon" href="popcorn.png">
</head>
<body class="custom-bg">
<%@ include file="nav.jsp"%>
<!-- head novità -->
<section class="py-5 text-center container-fluid headline-background">
    <div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto">
        <h1 class="testo-titoli">NOVITA'</h1>
        <p class="testo-pargraph">Resta sempre aggiornato sulle ultime uscite e scopri sempre nuovi titoly grazie alla nostra community</p>
      </div>
    </div>
  </section>
  <!-- carosello coming soon -->
  <div class="row justify-content-evenly">
  <div class="col-12" >
  <div id="carouselExampleCaptions" class="carousel slide">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="co.png" style=""  class="d-block w-100"  alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>First slide label</h5>
        <p>Some representative placeholder content for the first slide.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="co.png" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>Second slide label</h5>
        <p>Some representative placeholder content for the second slide.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="co.png" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>Third slide label</h5>
        <p>Some representative placeholder content for the third slide.</p>
      </div>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
</div>
</div>
	<!-- Novità card film --> 
<div class="album py-5">
    <div class="container" style="padding-top: 20px">
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-3">

            <%
                List<Film> annoFilm = (List<Film>) request.getAttribute("filmAnno");

            	SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
            	String annoRiferimento = "2024";
				
                if (annoFilm != null && !annoFilm.isEmpty()) {
                    for (Film film : annoFilm) {
                 String annoFilmUscita = sdf.format(film.getDataUscita());
				if (annoFilmUscita.equals(annoRiferimento)) {
			%>
            <div class="col">
                <div class="card mb-3" 
                    style="border-color:transparent;
                        height: 90%; width:200px;
                        background-color: transparent;
                        margin-left: 15px;">
                    <a href="dettagliFilm?id=<%= film.getId()%>">
                        <img class="card-img-top" src="<%=film.getLocandina()%>" 
                            style="border-radius:15px; height: 100%; width:200px; object-fit: cover">
                    </a> 
                    <h6 class="card-title testo-paragraph">
                        <%=film.getTitolo()%>
                    </h6>
                </div>
            </div>
            <%
                     }
                    }
                } else {
                    System.out.println("Nessun film disponibile.");
                }
            %>

        </div>
    </div>
</div>
<%@ include file="footer.jsp"%>
<script src="https://getbootstrap.com/docs/5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>