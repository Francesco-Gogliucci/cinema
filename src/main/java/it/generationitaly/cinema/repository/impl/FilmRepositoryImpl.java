package it.generationitaly.cinema.repository.impl;

import it.generationitaly.cinema.enity.Film;
import it.generationitaly.cinema.repository.FilmRepository;

public class FilmRepositoryImpl extends JpaRepository<Film, Long> implements FilmRepository {
	public FilmRepositoryImpl() {
		super(Film.class);
	}
}
