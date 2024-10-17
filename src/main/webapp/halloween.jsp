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
<script type="text/javascript">
	document.addEventListener('DOMContentLoaded', function() {
	    const ghostContainer = document.querySelector('.ghost-container');
	    const batContainer = document.querySelector('.bat-container');
	
	    function createGhost() {
	        const ghost = document.createElement('img');
	        ghost.src = 'img-ref/ghost.png'; // Immagine del fantasma
	        ghost.classList.add('ghost');
	        ghost.style.left = Math.random() * 100 + 'vw'; // Posizione casuale orizzontale
	        ghost.style.animationDelay = Math.random() * 2 + 's'; // Ritardo casuale nell'animazione
	        ghostContainer.appendChild(ghost);
	
	        setTimeout(() => {
	            ghost.remove(); // Rimuovi il fantasma dopo che è uscito dallo schermo
	        }, 6000); // Durata dell'animazione più un po' di margine
	    }
	
	    function createBat() {
	        const bat = document.createElement('img');
	        bat.src = 'img-ref/bat.png'; // Immagine del pipistrello
	        bat.classList.add('bat');
	        bat.style.left = Math.random() * 100 + 'vw';
	        bat.style.animationDelay = Math.random() * 3 + 's'; 
	        batContainer.appendChild(bat);
	
	        setTimeout(() => {
	            bat.remove();
	        }, 6000); // Durata dell'animazione per il pipistrello
	    }
	
	    // Genera fantasmi e pipistrelli ogni tot secondi
	    setInterval(createGhost, 1500); // Ogni 2 secondi appare un fantasma
	    setInterval(createBat, 1500);   // Ogni 1.5 secondi appare un pipistrello
	});
</script>
<link rel="icon" type="image/x-icon" href="popcorn.png">
</head>
<body class="halloween-background">
<%@ include file="nav.jsp"%>
<section class="container-fluid headline-background2">
  </section>
<div class="container mt-5" style="padding-top: 40px;">
  <div class="row g-3">
    </div>
    <div class="row justify-content-evenly" style="padding-top: 50px">
  <div class="col-11" >
  <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
     <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="3" aria-label="Slide 4"></button>
  </div>
  <div class="carousel-inner">
  <div class="carousel-item active">
      <a href="dettagliFilm?id=62"><img src="carosellohalloweenbanner.png" class="d-block w-100" alt="..."></a>
      </div>
    <div class="carousel-item">
      <a href="dettagliFilm?id=61"><img src="carosellohalloween1.png" class="d-block w-100"  alt="..."></a>
      <div class="carousel-caption d-none d-md-block">
        <h1 style="text-transform: uppercase;">Terrifier 3:<span style="text-transform: lowercase;"> il nuovo violentissimo slasher con Art il Clown</span></h1>
      </div>
    </div>
    <div class="carousel-item">
      <a href="dettagliFilm?id=67"><img src="carosellohalloween2.png" class="d-block w-100" alt="..."></a>
      <div class="carousel-caption d-none d-md-block">
        <h1 style="text-transform: uppercase;">It:<span style="text-transform: lowercase;"> L'adattamento dell'omonimo romanzo di Stephen King</span></h1>
      </div>
    </div>
    <div class="carousel-item">
      <a href="dettagliFilm?id=68"><img src="carosellohalloween3.png" class="d-block w-100" alt="..."></a>
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
            <% 
                    } 
                } 
            } 
            %>
        </div>
    </div>
</div>


    
    <%@ include file="footer.jsp"%>
    <script src="https://getbootstrap.com/docs/5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
   
    <div class="ghost-container" ></div>
    <div class="bat-container" ></div>
</body>
</html>