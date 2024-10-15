package it.generationitaly.cinema.repository;

import java.util.List;

import it.generationitaly.cinema.entity.Recensione;

public interface RecensioneRepository extends JpaRepository<Recensione, Long> {

	public List<Recensione> findRecensioneByFilmId(Long filmId);

}
