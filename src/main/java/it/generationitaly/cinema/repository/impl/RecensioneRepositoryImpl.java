package it.generationitaly.cinema.repository.impl;

import java.util.List;

import it.generationitaly.cinema.entity.Recensione;
import it.generationitaly.cinema.repository.RecensioneRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

public class RecensioneRepositoryImpl extends JpaRepositoryImpl<Recensione, Long> implements RecensioneRepository {

	public RecensioneRepositoryImpl() {
		super(Recensione.class);
	}

	@Override
	public List<Recensione> findRecensioneByFilmId(Long filmId) {
		List<Recensione> recensioni = null;
		String jpql = "SELECT r FROM Recensione r JOIN r.film f WHERE f.id = :filmId";
		EntityManager em = null;
		try {
			em = emf.createEntityManager();
			TypedQuery<Recensione> query = em.createQuery(jpql, Recensione.class);
			query.setParameter("filmId", filmId);
			recensioni = query.getResultList();
		} catch (Exception e) {
			System.err.println(e.getMessage());
		} finally {
			if (em != null) {
				em.close();
			}
		}
		return recensioni;
	}

}
