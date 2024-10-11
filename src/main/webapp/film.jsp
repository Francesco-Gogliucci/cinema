<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
</head>
<body class="custom-bg">
<%@ include file="nav.jsp"%>

<div id="carouselExample" class="carousel slide">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="scale.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="foto2.jpg" class="d-block w-100" alt="...">
    </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
<br>
<span style="font-size: 40px; opacity: 0.5; color: white;">DETTAGLI</span>
<h1 style="color: white;">Avengers: Endgame</h1>
<div>
  <p style="color: white;">
    L'epica conclusione della Saga dell'Infinito, fenomeno acclamato dalla critica di tutto il mondo,
    in una drammatica resa dei conti che vede gli Avengers contro il cattivo più potente dell'universo, 
    Thanos. Dopo che eventi devastanti hanno spazzato via metà della popolazione mondiale e hanno disperso i loro ranghi,
    gli eroi rimasti lottano per andare avanti, 
    ma dovranno farlo insieme se vorranno ripristinare l'ordine e l'armonia nell'universo e salvare i propri cari. 
  </p>
</div>
<br>
<div >
<span style="font-size: 20px; opacity: 0.5; color: white;">Durata:</span>
<p style="font-size: 15px; opacity: 0.5; color: white;">3h 5min</p>
<span style="font-size: 20px; opacity: 0.5; color: white;">Data di uscita:</span>
<p style="font-size: 15px; opacity: 0.5; color: white;">2019</p>
<span style="font-size: 20px; opacity: 0.5; color: white;">Genere:</span>
<p style="font-size: 15px; opacity: 0.5; color: white;">Azione</p>
</div>
<br>
 <div class="row">
      <div class="col-lg-4">
    <img src="robert.png" class="bd-placeholder-img rounded-circle" width="140" height="140" alt="Robert Downey Jr.">
    <h2 class="fw-normal" style="font-size: 20px; opacity: 0.5; color: white">Robert Downey Jr.</h2>
    <p style="font-size: 15px; opacity: 0.5; color: white">Iron Man</p>
    <p><a class="btn btn-giallo" href="#">Vedi attore</a></p>
</div>
     <div class="col-lg-4">
    <img src="benedict.png" class="bd-placeholder-img rounded-circle" width="140" height="140" alt="Robert Downey Jr.">
    <h2 class="fw-normal" style="font-size: 20px; opacity: 0.5; color: white">Benedict Cumberbatch</h2>
    <p style="font-size: 15px; opacity: 0.5; color: white">Doctor Strange</p>
    <p><a class="btn btn-giallo" href="#">Vedi attore</a></p>
</div>>
</body>
</html>