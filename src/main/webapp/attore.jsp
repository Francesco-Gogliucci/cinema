<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="it.generationitaly.cinema.entity.*" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="https://getbootstrap.com/docs/5.3/assets/js/color-modes.js"></script>
    <link rel="stylesheet" href="style.css">
    <title>Attore</title>
</head>

<body class="custom-bg">
    <%@ include file="nav.jsp"%>

    
    <div class="container text-center">
        <div class="row">
           
            <div class="col-md-4">
                <!-- Card attore -->
                <div class="card card-attore" style="border-color:transparent; background-color: transparent; padding-top: 20px;">
                    <% Attore attore = (Attore) request.getAttribute("attore"); %>
                    <img src="<%= attore.getFoto() %>" height="550" width="358" style="border-radius:15px" class="card-img-top" alt="Foto attore">
                    <div class="card-body">
                        <p class="card-text" style="object-fit: cover"><%= attore.getBiografia() %></p>
                    </div>
                </div>
            </div> 

            <!-- Colonna film -->
            <div class="col-md-8" style="padding-top: 20px">
                <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                    <!-- Poster dei film -->
                    <% 
                        List<Film> posterFilm = attore.getFilm();
                        for (Film film : posterFilm) { 
                    %>
                        <div class="col">
                            <div class="card-locandina card" style="border-color:transparent; height: 100%; width:200px; background-color: transparent;">
                                <img class="card-img-top" src="<%= film.getLocandina() %>" style="border-radius:15px; height: 100%; width:200px; object-fit: cover" alt="Poster film">
                                <h6 class="card-title"><%= film.getTitolo() %></h6>
                            </div>
                        </div>
                    <% 
                        } 
                    %>
                </div>
            </div> <!-- chiusura colonna film -->
        </div>
    </div>

    <script src="https://getbootstrap.com/docs/5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
