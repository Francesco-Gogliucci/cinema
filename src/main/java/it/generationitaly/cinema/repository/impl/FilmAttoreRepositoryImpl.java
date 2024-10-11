package it.generationitaly.cinema.repository.impl;

import it.generationitaly.cinema.entity.FilmAttore;
import it.generationitaly.cinema.repository.FilmAttoreRepository;

public class FilmAttoreRepositoryImpl extends JpaRepositoryImpl<FilmAttore, Long> implements FilmAttoreRepository {
	
	public FilmAttoreRepositoryImpl() {
		super(FilmAttore.class);
	}
}
