package it.generationitaly.cinema.controller;

import java.io.IOException;
import java.util.List;

import it.generationitaly.cinema.entity.Preferiti;
import it.generationitaly.cinema.entity.Utente;
import it.generationitaly.cinema.repository.PreferitiRepository;
import it.generationitaly.cinema.repository.UtenteRepository;
import it.generationitaly.cinema.repository.impl.PreferitiRepositoryImpl;
import it.generationitaly.cinema.repository.impl.UtenteRepositoryImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class PreferitiUtenteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UtenteRepository utenteRepository = new UtenteRepositoryImpl();
	private PreferitiRepository preferitiRepository = new PreferitiRepositoryImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		Utente utente = (Utente) session.getAttribute("utente");

		if (session.getAttribute("username") != null) {
			Long utenteId = utente.getId();
			List<Preferiti> preferiti = preferitiRepository.findPreferitiByUtenteId(utenteId);

			request.setAttribute("preferiti", preferiti);
			request.getRequestDispatcher("mostraPreferiti.jsp").forward(request, response);
		} else {
			response.sendRedirect("login.jsp");
			return;
		}
	}
}