package it.generationitaly.cinema.controller;

import java.io.IOException;
import java.util.List;

import it.generationitaly.cinema.entity.Film;
import it.generationitaly.cinema.entity.Preferiti;
import it.generationitaly.cinema.entity.Utente;
import it.generationitaly.cinema.repository.PreferitiRepository;
import it.generationitaly.cinema.repository.impl.FilmRepositoryImpl;
import it.generationitaly.cinema.repository.impl.PreferitiRepositoryImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class PreferitiUtenteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private PreferitiRepository preferitiRepository = new PreferitiRepositoryImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
       
        Utente utente = (Utente) session.getAttribute("utente");

        if (utente != null) {
            Long utenteId = utente.getId();
           
            List<Preferiti> preferiti = preferitiRepository.findPreferitiByUtenteId(utenteId);

           
            request.setAttribute("preferiti", preferiti);
            // Inoltra la richiesta alla pagina utente.jsp
            request.getRequestDispatcher("utente.jsp").forward(request, response); // Modificata da mostraPreferiti.jsp a utente.jsp
        } else {
            // Se l'utente non è autenticato, reindirizza alla pagina di login
            response.sendRedirect("login.jsp");
            return;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        FilmRepositoryImpl filmRepository = new FilmRepositoryImpl();
        HttpSession session = request.getSession();
       
        Utente utente = (Utente) session.getAttribute("utente");

        if (utente != null) {
            long filmId = Long.parseLong(request.getParameter("filmId"));

            
            Film film = filmRepository.findById(filmId);

            Preferiti preferiti = new Preferiti();
            preferiti.setFilm(film);
            preferiti.setUtente(utente);

            preferitiRepository.save(preferiti);

         
            response.sendRedirect("utente.jsp"); // Modificata da preferiti.jsp a utente.jsp
        } else {
            // Se l'utente non è autenticato, reindirizza alla pagina di login
            response.sendRedirect("login.jsp");
            return;
        }
    }
}