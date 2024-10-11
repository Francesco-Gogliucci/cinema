package it.generationitaly.cinema.controller;

import java.io.IOException;
import java.sql.Date;  // Usa java.sql.Date
import it.generationitaly.cinema.entity.Utente;
import it.generationitaly.cinema.repository.UtenteRepository;
import it.generationitaly.cinema.repository.impl.UtenteRepositoryImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private UtenteRepository utenteRepository = new UtenteRepositoryImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String nome = request.getParameter("nome");
        String cognome = request.getParameter("cognome");
        String dataNascitaStr = request.getParameter("dataNascita");
        
        
        Date dataNascita = Date.valueOf(dataNascitaStr);  // Converto la stringa in java.sql.Date
        
        Utente utente = new Utente();
        utente.setUsername(username);
        utente.setPassword(password);
        utente.setNome(nome);
        utente.setCognome(cognome);
        utente.setDataNascita(dataNascita);  

        
        if (utenteRepository.existsByUsername(username)) {
            request.setAttribute("errorMessage", "Username già in uso. Scegli un altro username.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        
        utenteRepository.save(utente);

        
        response.sendRedirect("login.jsp");
    }
}