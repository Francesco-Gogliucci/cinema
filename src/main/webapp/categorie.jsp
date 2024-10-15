<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"
		import="java.util.HashMap"
		import="java.util.ArrayList"
		import="it.generationitaly.cinema.entity.Categoria"
 %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="style.css">
	</head>
	<body class="custom-bg">
		<%@ include file="nav.jsp"%>
		<div class="mt-4"></div>
		<div class="album py-5">
	 <div class="container" style="padding-top: 50px">
		 <div class ="row row-cols-3 row-cols-sm-3 row-cols-md-4 g-3">
	 <!-- codice temporaneo per pololare la pagina -->
	 
			 <%
	 			 List<Categoria> categorie = (List<Categoria>) request.getAttribute("elencoCategorie");
			 				 
	 			 	 List<String> url = new ArrayList<String>();
	 			 		url.add("https://a.ltrbxd.com/resized/film-poster/2/7/7/0/6/4/277064-barbie-0-1000-0-1500-crop.jpg?v=1b83dc7a71");
	 			 		url.add("https://a.ltrbxd.com/resized/film-poster/8/6/1/1/4/86114-the-wolf-of-wall-street-0-1000-0-1500-crop.jpg?v=9fd1891260");
	 			 		url.add("https://a.ltrbxd.com/resized/sm/upload/hv/nn/05/ss/d20vOJpywFDoz7Dd4ChomGdP0fr-0-1000-0-1500-crop.jpg?v=836521d1aa");
	 			 		url.add("https://a.ltrbxd.com/resized/film-poster/8/5/3/8/2/2/853822-pearl-0-1000-0-1500-crop.jpg?v=471dfc4a24");
	 			 		url.add("https://a.ltrbxd.com/resized/film-poster/8/8/0/0/5/0/880050-love-death-robots-three-robots-exit-strategies-0-1000-0-1500-crop.jpg?v=253fd8ca8f");
	 			 		url.add("https://a.ltrbxd.com/resized/sm/upload/t0/3y/yr/rs/n3rm3gxguxzFDlygpROV7RHbELe-0-1000-0-1500-crop.jpg?v=67909d635e");
	 			 		url.add("https://a.ltrbxd.com/resized/sm/upload/hl/jj/br/9g/Kd5OkBc6GyUa1tIpxYUHLpyE2t-0-1000-0-1500-crop.jpg?v=a2db0a150a");
	 			 		url.add("https://a.ltrbxd.com/resized/film-poster/4/3/8/5/1/1/438511-soul-0-1000-0-1500-crop.jpg?v=8d0b74f9a8");
	 			 		url.add("https://a.ltrbxd.com/resized/sm/upload/3t/vq/0u/m6/1tX9ZlgVvWjAQhMs1vAfsYpi7VK-0-1000-0-1500-crop.jpg?v=30bbb824e1");
	 			 		url.add("https://a.ltrbxd.com/resized/film-poster/9/2/1/6/3/9/921639-sophia--0-1000-0-1500-crop.jpg?v=de9e1003be");
	 			 		url.add("https://a.ltrbxd.com/resized/film-poster/2/4/0/3/4/4/240344-la-la-land-0-1000-0-1500-crop.jpg?v=053670ff84");
	 			 		url.add("https://a.ltrbxd.com/resized/film-poster/4/4/4/6/0/0/444600-jojo-rabbit-0-1000-0-1500-crop.jpg?v=a5ad083635");

	 			 		HashMap<String, Categoria> categorieImg = new HashMap<>();
	 			 		if (categorie != null && !categorie.isEmpty()) {
	 			 		     // Assicuriamoci che la dimensione sia coerente
	 			 		    for (int i = 0; i < categorie.size(); i++) {
	 			 		        categorieImg.put(url.get(i), categorie.get(i));
	 			 		    }
	 			 		} else {
	 			 		    // Logica per gestire il caso in cui la lista categorie sia vuota o null
	 			 		    System.out.println("La lista delle categorie è vuota o null.");
	 			 		}
	 			 		

	 			 		for (String urlCategoria : categorieImg.keySet()) {
	 			 %>
	  			 <div class="col">
	  			 <a href="ricercaPerCategoria?idCategoria=<%=categorieImg.get(urlCategoria).getId() %>">
					<div class="card" 
						style="border-color: transparent; 
						height: 310px; 
						width: 210px; 
						background-color: transparent; 
						margin-left: 15px; 
						border-bottom:#1A2D3F;
						background: linear-gradient(180deg, rgba(68, 119, 165, 0) 10%, #1A2D3F 100%), url(<%= urlCategoria%>); 
						background-size: cover; 
						background-position: center; 
						border-radius: 15px;
						position: relative;
						padding-bottom: -2px;
						box-shadow: 0 2px 4px rgba(0, 0, 0, 1);">
				
						<h6 class="card-title testo-paragraph text-bottom" 
							style="position: absolute; 
							bottom: 0; 
							width: 100%; 
							text-align: center; 
							text-transform: uppercase; 
							font-weight:bold;
							padding-bottom: 8px;
							margin-bottom: 10; 
							color: white;">
							<%= categorieImg.get(urlCategoria).getGenere()%>
						</h6>
					</div></a>
				</div>

	
			 <%
	 		}
		 %>
	
	 	</div>
	 </div>
</div>
		
	
		<%@ include file="footer.jsp"%>
	</body>
</html>