package it.generationitaly.cinema.controller;

import java.io.IOException;
import java.util.List;

import it.generationitaly.cinema.entity.Attore;
import it.generationitaly.cinema.entity.Film;
import it.generationitaly.cinema.entity.Recensione;
import it.generationitaly.cinema.repository.impl.FilmAttoreRepositoryImpl;
import it.generationitaly.cinema.repository.impl.FilmRepositoryImpl;
import it.generationitaly.cinema.repository.impl.RecensioneRepositoryImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class FilmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private FilmRepositoryImpl filmRepository = new FilmRepositoryImpl();
	private FilmAttoreRepositoryImpl filmAttoreRepository = new FilmAttoreRepositoryImpl();
	private RecensioneRepositoryImpl recensioneRepository = new RecensioneRepositoryImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		long id = Long.parseLong(request.getParameter("id"));
		Film film = filmRepository.findById(id);
		request.setAttribute("film", film);

		List<Attore> attori = filmAttoreRepository.findAttoreByFilmId(id);
		request.setAttribute("attori", attori);

		List<Recensione> recensioni = recensioneRepository.findRecensioneByFilmId(id);
		request.setAttribute("recensioni", recensioni);

		// inserire la pagina jsp corretta per la visualizzazione dei dettagli di un
		// film
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("film.jsp");
		requestDispatcher.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// metodo post
	}

}
