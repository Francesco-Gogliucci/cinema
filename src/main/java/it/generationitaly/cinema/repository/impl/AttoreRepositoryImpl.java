package it.generationitaly.cinema.repository.impl;

import it.generationitaly.cinema.entity.Attore;
import it.generationitaly.cinema.repository.AttoreRepository;

public class AttoreRepositoryImpl extends JpaRepositoryImpl<Attore, Long> implements AttoreRepository {
	public AttoreRepositoryImpl() {
		super(Attore.class);
	}
}
