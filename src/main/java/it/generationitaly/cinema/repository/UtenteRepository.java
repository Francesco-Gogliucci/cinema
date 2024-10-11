package it.generationitaly.cinema.repository;

import it.generationitaly.cinema.entity.Utente;

public interface UtenteRepository extends JpaRepository<Utente, Long> {

	boolean existsByUsername(String username);
}
