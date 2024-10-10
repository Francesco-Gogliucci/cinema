package it.generationitaly.cinema.repository.impl;

import it.generationitaly.cinema.entity.Recensione;
import it.generationitaly.cinema.repository.RecensioneRepository;

public class RecensioneRepositoryImpl extends JpaRepositoryImpl<Recensione, Long> implements RecensioneRepository {

	public RecensioneRepositoryImpl() {
		super(Recensione.class);
	}

}
