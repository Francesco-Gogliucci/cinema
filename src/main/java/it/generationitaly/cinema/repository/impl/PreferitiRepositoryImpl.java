package it.generationitaly.cinema.repository.impl;

import java.util.List;
import it.generationitaly.cinema.entity.Preferiti;

import it.generationitaly.cinema.repository.PreferitiRepository;
import it.generationitaly.cinema.entity.Utente;
import it.generationitaly.cinema.repository.UtenteRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;

public class PreferitiRepositoryImpl extends JpaRepositoryImpl<Preferiti, Long> implements PreferitiRepository {
	public PreferitiRepositoryImpl() {
		super(Preferiti.class);
	}

	public List<Preferiti> findPreferitiByUtenteId(Long utenteId) {
		EntityManager em = null;
		EntityTransaction tx = null;
		List<Preferiti> preferiti = null;

		try {
			em = emf.createEntityManager();
			tx = em.getTransaction();
			tx.begin();

			TypedQuery<Preferiti> query = em.createQuery("SELECT p FROM Preferiti p WHERE p.utente.id = :utenteId",
					Preferiti.class);
			query.setParameter("utenteId", utenteId);

			preferiti = query.getResultList();
			tx.commit();
		} catch (Exception e) {
			System.err.println(e.getMessage());
			if (tx != null && tx.isActive())
				tx.rollback();
		} finally {
			if (em != null)
				em.close();
		}

		return preferiti;
	}

}
