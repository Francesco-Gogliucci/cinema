package it.generationitaly.cinema.controller;

import java.io.IOException;

import it.generationitaly.cinema.entity.Recensione;
import it.generationitaly.cinema.repository.impl.FilmRepositoryImpl;
import it.generationitaly.cinema.repository.impl.RecensioneRepositoryImpl;
import it.generationitaly.cinema.repository.impl.UtenteRepositoryImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RecensioneServlet
 */
@WebServlet("/RecensioneServlet")
public class RecensioneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// metodo get
	}

	private UtenteRepositoryImpl utenteRepository = new UtenteRepositoryImpl();
	private FilmRepositoryImpl filmRepository = new FilmRepositoryImpl();
	private RecensioneRepositoryImpl recensioneRepository = new RecensioneRepositoryImpl();

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// salvataggio di una recensione

		String contenuto = request.getParameter("contenuto");
		long idFilm = Long.parseLong(request.getParameter("idFilm"));
		long idUtente = Long.parseLong(request.getParameter("idUtente"));

		Recensione recensione = new Recensione();
		recensione.setFilm(filmRepository.findById(idFilm));
		recensione.setUtente(utenteRepository.findById(idUtente));
		recensione.setRecensione(contenuto);

		recensioneRepository.save(recensione);

	}

}
