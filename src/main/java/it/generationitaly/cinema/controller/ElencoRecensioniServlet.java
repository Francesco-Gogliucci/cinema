package it.generationitaly.cinema.controller;

import java.io.IOException;
import java.util.List;

import it.generationitaly.cinema.entity.Recensione;
import it.generationitaly.cinema.repository.impl.RecensioneRepositoryImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/elencoRecensioniServlet")
public class ElencoRecensioniServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	RecensioneRepositoryImpl recensioneRepository = new RecensioneRepositoryImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Recensione> elencoRecensioni = recensioneRepository.findAll();

		boolean home = (boolean) request.getAttribute("home");

		if (home) {
			request.setAttribute("elencoRecensioni", elencoRecensioni);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("home.jsp");
			requestDispatcher.include(request, response);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
