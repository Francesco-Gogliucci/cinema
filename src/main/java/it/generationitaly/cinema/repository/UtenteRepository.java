package it.generationitaly.cinema.repository;
import it.generationitaly.cinema.entity.Film;
import it.generationitaly.cinema.entity.Utente;
import java.util.List;
public interface UtenteRepository extends JpaRepository<Utente, Long> {


	Utente findByUsername (String username);
	boolean existsByUsername(String username);
	public List<Film> findPreferitiByUtenteId(Long utenteId);
}
