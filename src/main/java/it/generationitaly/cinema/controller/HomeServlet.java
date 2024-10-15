package it.generationitaly.cinema.controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HomeServlet
 */
@WebServlet("/homeServlet")
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("home", true);

		RequestDispatcher dispatcherFilm = request.getRequestDispatcher("elencoFilm");
		// include i dati ricavati da questa servlet
		dispatcherFilm.include(request, response);
		
		RequestDispatcher dispatcherCategoria = request.getRequestDispatcher("elencoCategoria");
		dispatcherCategoria.include(request, response);

		RequestDispatcher dispatcherRecensioni = request.getRequestDispatcher("elencoRecensioni");
		dispatcherRecensioni.forward(request, response);

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
