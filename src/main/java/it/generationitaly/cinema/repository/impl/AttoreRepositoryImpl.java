package it.generationitaly.cinema.repository.impl;

import java.util.List;

import it.generationitaly.cinema.entity.Attore;
import it.generationitaly.cinema.entity.Film;
import it.generationitaly.cinema.repository.AttoreRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;

public class AttoreRepositoryImpl extends JpaRepositoryImpl<Attore, Long> implements AttoreRepository {
	public AttoreRepositoryImpl() {
		super(Attore.class);
	}

	@Override
	public List<Film> findListFilmByAttore(long id) {
		List<Film> listAttoreFilm = null;
		EntityManager em = null;
		EntityTransaction tx = null;
		try {
			em = emf.createEntityManager();
			tx = em.getTransaction();
			tx.begin();
			TypedQuery<Film> query = em.createQuery("SELECT f FROM FilmAttore fa JOIN fa.film f JOIN fa.attore a WHERE a.id = :id", Film.class);
			query.setParameter("id", id);
			listAttoreFilm = query.getResultList();
			tx.commit();
		} catch (Exception e) {
			System.err.println(e.getMessage());
			if (tx != null && tx.isActive())
				tx.rollback();
		} finally {
			if (em != null)
				em.close();
		}
		return listAttoreFilm;
	}
}
