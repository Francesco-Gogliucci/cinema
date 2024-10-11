package it.generationitaly.cinema.repository.impl;

import it.generationitaly.cinema.entity.Preferiti;
import it.generationitaly.cinema.repository.PreferitiRepository;

public class PreferitiRepositoryImpl extends JpaRepositoryImpl<Preferiti, Long> implements PreferitiRepository {
	public PreferitiRepositoryImpl() {
		super(Preferiti.class);
	}
}
