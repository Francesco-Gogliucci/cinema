package it.generationitaly.cinema.controller;

import java.io.IOException;
import java.util.List;
import it.generationitaly.cinema.entity.Film;
import it.generationitaly.cinema.entity.Preferiti; // Importa la tua entità Preferiti
import it.generationitaly.cinema.entity.Utente;
import it.generationitaly.cinema.repository.PreferitiRepository; // Importa il repository Preferiti
import it.generationitaly.cinema.repository.UtenteRepository;
import it.generationitaly.cinema.repository.impl.PreferitiRepositoryImpl; // Importa la tua implementazione Preferiti
import it.generationitaly.cinema.repository.impl.UtenteRepositoryImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class PreferitiUtenteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private UtenteRepository utenteRepository = new UtenteRepositoryImpl();
    private PreferitiRepository preferitiRepository = new PreferitiRepositoryImpl(); // Crea l'istanza del repository Preferiti

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Recupera l'utente dalla sessione
        HttpSession session = request.getSession();
        Utente utente = (Utente) session.getAttribute("utente");
        
        // Se l'utente è loggato, recupera i preferiti
        if (utente != null) {
            Long utenteId = utente.getId();
            List<Preferiti> preferiti = preferitiRepository.findPreferitiByUtenteId(utenteId); // Usa preferitiRepository
            
            // Aggiungi la lista dei preferiti come attributo della richiesta
            request.setAttribute("preferiti", preferiti);
            
            // Inoltra alla pagina JSP che mostrerà i preferiti
            request.getRequestDispatcher("mostraPreferiti.jsp").forward(request, response);
        } else {
            // Se l'utente non è loggato, reindirizza alla pagina di login
            response.sendRedirect("login.jsp");
        }
    }
}