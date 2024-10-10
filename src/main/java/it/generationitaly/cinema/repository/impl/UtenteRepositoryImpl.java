package it.generationitaly.cinema.repository.impl;

import it.generationitaly.cinema.entity.Utente;
import it.generationitaly.cinema.repository.UtenteRepository;

public class UtenteRepositoryImpl extends JpaRepositoryImpl<Utente, Long> implements UtenteRepository {
	public UtenteRepositoryImpl() {
		super(Utente.class);
	}
}
