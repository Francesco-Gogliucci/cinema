package it.generationitaly.cinema.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import it.generationitaly.cinema.entity.Categoria;
import it.generationitaly.cinema.repository.CategoriaRepository;
import it.generationitaly.cinema.repository.impl.CategoriaRepositoryImpl;

@WebServlet("/elencocategoria")
public class ElencoCategoriaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private CategoriaRepository categoriaRepository = new CategoriaRepositoryImpl();
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		List<Categoria> categorie = categoriaRepository.findAll();
		
		request.setAttribute("categorie", categorie);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("home.jsp");
		requestDispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
