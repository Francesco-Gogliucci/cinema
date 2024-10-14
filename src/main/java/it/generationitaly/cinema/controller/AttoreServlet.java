package it.generationitaly.cinema.controller;

import java.io.IOException;
import java.util.List;

import it.generationitaly.cinema.entity.Attore;
import it.generationitaly.cinema.entity.Film;
import it.generationitaly.cinema.repository.impl.AttoreRepositoryImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/dettagliAttore")
public class AttoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AttoreRepositoryImpl attoreRepository = new AttoreRepositoryImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		long id = Long.parseLong(request.getParameter("id"));
		
		Attore attore = attoreRepository.findById(id);
		
		// aggiunta listFilmByAttore
		List<Film> listFilmByAttore = attoreRepository.findListFilmByAttore(id);
		
		request.setAttribute("attore", attore);
		request.setAttribute("listaFilmAttore", listFilmByAttore);
		// inserire la pagina jsp corretta per la visualizzazione dei dettagli di un
		// attore
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("attore.jps");
		requestDispatcher.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// metodo post
	}

}
