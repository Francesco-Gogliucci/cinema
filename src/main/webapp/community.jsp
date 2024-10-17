<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="it.generationitaly.cinema.entity.*"%>
<%@ page import="java.util.List" import="java.util.HashMap"
	import="java.util.ArrayList" import="java.util.Set"
	import="java.util.stream.Collectors"%>
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
			<div class="col text-start"
				style="border-bottom: 4px solid rgb(101, 131, 161); color: rgb(101, 131, 161);">
				<h3>La nostra community</h3>
				<p>Film lovers and friends</p>
			</div>
		</div>
	</div>
	<div class="container" style="padding-top: 40px">
		<div class="row row-cols-1 row-cols-sm-2 row-cols-md-6 g-3">
			<%
			// Controllo se l'attributo recensioni è nullo per evitare un NullPointerException
			List<Recensione> recensioni = (List<Recensione>) request.getAttribute("elencoRecensioni");
			Set<Utente> utenti = null;
			if (recensioni != null && !recensioni.isEmpty()) {
				// Usa uno stream per ottenere un Set di utenti unici
				utenti = recensioni.stream()
					.map(Recensione::getUtente)
					.collect(Collectors.toSet());

				// Ciclo sugli utenti per mostrare i dati
				for (Utente utente : utenti) {
			%>
			<div class="col">
				<img src="user-286.png" class="bd-placeholder-img rounded-circle"
					width="150" height="150" alt="">

				<h2 class="fw-normal"
					style="font-size: 20px; opacity: 0.5; color: white">
					<%=(utente.getUsername() != null ? utente.getUsername() : "Utente sconosciuto")%>
				</h2>
				<p>
					<a class="btn btn-giallo"
						href="utenteServlet?id=<%=utente.getId()%>">Vedi utente</a>
				</p>
			</div>
			<%
			} // Fine ciclo sugli utenti
			} else {
			%>
			<div class="col-lg-12">
				<p class="text-white">Nessuna recensione disponibile.</p>
			</div>
			<%
			}
			%>
		</div>
	</div>

	<div class="container text-end" style="padding-top: 40px;">
		<div class="row row-cols-md-2 g-3">
			<div class="col"></div>
			<div class="col"
				style="border-bottom: 4px solid rgb(101, 131, 161); color: rgb(101, 131, 161);">
				<h3>Scopri i film tramite le recensioni della nostra community</h3>
			</div>
		</div>
	</div>

	<div class="container ml-5" style="padding-top: 40px;">
    <div class="row">
        <% 
        
        if (recensioni != null) {

            int i = 0;

            for (Recensione recensione : recensioni) {
                if (i >= 6)
                    break;
        %>

        <!-- Colonna recensione -->
        <div class="col-md-8 ml-3 mt-3">
            <h4 style="color:white;font-style: italic"><%= recensione.getUtente().getUsername() %></h4>
            <div style="border-top: 4px solid rgb(101, 131, 161); color: rgb(101, 131, 161);">
                <h5 style="color: white"><%= recensione.getFilm().getTitolo() %></h5>
                <p style="color: rgb(101, 131, 161);">
                    <%= recensione.getRecensione() %>
                </p>
            </div>
        </div>

        <!-- Colonna locandina del film -->
        <div class="col-md-4 text-center mt-3">
            <a href="dettagliFilm?id=<%= recensione.getFilm().getId() %>">
                <div class="card"
                    style="border-color: transparent; 
                    height: 310px; 
                    width: 210px; 
                    margin-left: 15px; 
                    border-bottom:#1A2D3F;
                    background: linear-gradient(180deg, rgba(68, 119, 165, 0) 10%, #1A2D3F 100%), url(<%= recensione.getFilm().getLocandina() %>); 
                    background-size: cover; 
                    background-position: center; 
                    border-radius: 15px;
                    position: relative;
                    box-shadow: 0 2px 4px rgba(0, 0, 0, 1);">
                    
                    <h6 class="card-title testo-paragraph text-bottom"
                        style="position: absolute; bottom: 0; width: 100%; text-align: center; text-transform: uppercase; font-weight: bold; padding-bottom: 8px; color: white;">
                        <%= recensione.getFilm().getTitolo() %>
                    </h6>
                </div>
            </a>
        </div>

        <% 
            i++;
            } 
        } 
        %>
    </div>
</div>
<div class="mb-3"></div>
<!-- parte dei preferiti utenti -->
<div class = "container ml-5 mb-5">
	<% 
	Set <Film> filmPreferiti = null;
	int i = 5 ;
	for(Utente utente: utenti){%>
	if(i>5)break;
	<div class="row" style="border-top: 4px solid rgb(101, 131, 161); ">
			<div class = "col" style="color: rgb(101, 131, 161);">
				<h3>I preferiti di</h3>
				<h4 style="color:white;font-style: italic"><%= utente.getUsername()%></h4>
			</div>
		
		
	<% 
		List<Preferiti> utentiFilm = utente.getPreferiti();
		filmPreferiti = utentiFilm.stream()
									.map(Preferiti::getFilm)
									.collect(Collectors.toSet());
		
		for(Film preferiti : filmPreferiti){
	
	%>
		
		
	  			 
					 <div class=" col card mb-3" 
						 style="border-color:transparent;
							height: 90%; width:100px;
							background-color: transparent;
							margin-left: 15px;">
					<a href="dettagliFilm?id=<%= preferiti.getId()%>">
					<img class="card-img-top" src="<%=preferiti.getLocandina()%>"style="border-radius:15px; height: 100%; width:200px; object-fit: cover">
					</a> 
	 		
			 </div>
		
		
	<%
			i++;
		}
	}
	%>
</div>
</div>
	<%@ include file="footer.jsp"%>
</body>
</html>