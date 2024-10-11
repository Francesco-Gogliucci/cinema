package it.generationitaly.cinema.controller;

import java.io.IOException;

import it.generationitaly.cinema.entity.Attore;
import it.generationitaly.cinema.repository.impl.AttoreRepositoryImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AttoreServlet
 */
@WebServlet("/dettagliAttore")
public class AttoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AttoreRepositoryImpl attoreRepository = new AttoreRepositoryImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		long id = Long.parseLong(request.getParameter("id"));
		Attore attore = attoreRepository.findById(id);
		request.setAttribute("attore", attore);
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
