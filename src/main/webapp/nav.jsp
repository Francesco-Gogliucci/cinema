<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>nav</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet" 
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
          crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
</head>
<nav class="navbar fixed-top navbar-expand-lg mb-5" style="background-color: rgb(101, 131, 161); box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);">
    <div class="container-fluid">
        <a class="navbar-brand" href="homeServlet">
            <img src="./img-ref/logo-popcorn.png" alt="Bootstrap" width="164.36" height="66">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="elencoRecensioni">Community</a>
                </li>
                <li class="nav-item">
                <!-- Inserito collegamento a fil.jsp -->
                    <a class="nav-link" href="ricercaFilmPerAnno?anno=2024">Novità</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="elencoCategoria">Generi</a>
                </li>
            </ul>

            <form class="d-flex" action="ricercaFilmEAttoreServlet" method="get" role="search" style="margin-bottom: 5px; padding-left: 300px;">
                <input class="form-control me-2" type="search" placeholder="Cerca" aria-label="Search" name="ricerca" style="border-radius: 20px;">
                <button class="btn btn-sm btn-giallo" type="submit">Cerca</button>
            </form>

            <% if (session.getAttribute("username") == null) { %>
                <a href="./login.jsp" class="btn btn-sm btn-giallo">Accedi</a>
                <a href="./registrazione.jsp" class="btn btn-sm btn-nero" type="button">Registrati</a>
            <% } else { %>
                <span class="fw-bold" style="color: white; padding-left: 20px;">
                    <%= session.getAttribute("username") %>
                </span>
                <form class="d-flex" action="logout" method="post">
                    <button class="btn btn-giallo" type="submit">LOGOUT</button>
                </form>
            <% } %>
        </div>
    </div>
</nav>
