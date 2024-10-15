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

@WebServlet("/elencoRecensioni")
public class ElencoRecensioniServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private RecensioneRepositoryImpl recensioneRepository = new RecensioneRepositoryImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Start ELENCO RECENSIONI");
		List<Recensione> elencoRecensioni = recensioneRepository.findAll();

		Boolean home = (Boolean) request.getAttribute("home");

		request.setAttribute("elencoRecensioni", elencoRecensioni);

		if (home != null && home) {
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("home.jsp");
			System.out.println("FORWARD");
			requestDispatcher.forward(request, response);
		} else {
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("recensioni.jsp");
			requestDispatcher.forward(request, response);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}
}
