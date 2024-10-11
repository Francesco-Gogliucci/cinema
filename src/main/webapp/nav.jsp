<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
     rel="stylesheet" 
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
    crossorigin="anonymous">
  </head>
 <nav class="navbar navbar-expand-lg" style="background-color: rgb(101, 131, 161);">
  	<div class="container-fluid">
	 <a class="navbar-brand" href="#">
      <img src="" alt="Bootstrap" width="100" height="39">
   	 </a>
 	<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		    <span class="navbar-toggler-icon"></span>
		    </button>
		    <div class="collapse navbar-collapse" id="navbarSupportedContent">
		     <ul class="navbar-nav me-auto mb-2 mb-lg-0">
		    <li class="nav-item">
		     <a class="nav-link active" aria-current="page" href="#">Novità</a>
		     </li>
		      <li class="nav-item">
		     <a class="nav-link" href="#">Film</a>
		     </li>
		     <li class="nav-item dropdown">
		      <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
		            Generi
		       </a>
		       <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">Azione</a></li>
            <li><a class="dropdown-item" href="#">Avventura</a></li>
            <li><a class="dropdown-item" href="#">Drammatico</a></li>
            <li><a class="dropdown-item" href="#">Commedia</a></li>
            <li><a class="dropdown-item" href="#">Horror</a></li>
            <li><a class="dropdown-item" href="#">Fantascienza</a></li>
            <li><a class="dropdown-item" href="#">Fantasy</a></li>
            <li><a class="dropdown-item" href="#">Thriller</a></li>
            <li><a class="dropdown-item" href="#">Romantico</a></li>
            <li><a class="dropdown-item" href="#">Animazione</a></li>
            <li><a class="dropdown-item" href="#">Documentario</a></li>
            <li><a class="dropdown-item" href="#">Musical</a></li>
          </ul>
		   </li>
			 </ul>
		     <form class="d-flex" role="search" style="margin-bottom: 5px;" >
            <input class="form-control me-2" type="search" placeholder="Cerca" aria-label="Search" style="border-radius: 20px;">
           <button class="btn btn-sm w-20 py-1" style="background-color: rgb(238, 226, 58); border-radius: 20px;" type="submit">Cerca</button>
           <button class="btn ms-3 me-2 " type="button" style="background-color: rgb(238, 226, 58); border-radius: 20px" >Accedi</button>
       <button class="btn" type="button" style="background-color: rgb(70, 70, 70); border-radius: 20px; color: white;">Registrati</button>
            </form>
		    </div>
		  </div>
		</nav>

  