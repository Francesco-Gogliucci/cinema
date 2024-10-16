package it.generationitaly.cinema.controller;

import java.io.IOException;
import java.util.List;

import it.generationitaly.cinema.entity.Recensione;
import it.generationitaly.cinema.entity.Utente;
import it.generationitaly.cinema.repository.impl.RecensioneRepositoryImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/mostraRecensioniUtente")
public class MostraRecensioniUtenteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private RecensioneRepositoryImpl recensioneRepository = new RecensioneRepositoryImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		Utente utente = (Utente) session.getAttribute("utente");

		if (utente != null) {
			List<Recensione> recensioniUtente = utente.getRecensioni();
			request.setAttribute("recensioniUtente", recensioniUtente);

			RequestDispatcher dispatcher = request.getRequestDispatcher("utente.jsp");
			dispatcher.forward(request, response);
		} else {
			response.sendRedirect("login.jsp");
		}
	}
}