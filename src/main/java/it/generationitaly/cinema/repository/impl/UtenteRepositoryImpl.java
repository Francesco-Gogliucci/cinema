package it.generationitaly.cinema.repository.impl;

import it.generationitaly.cinema.entity.Utente;
import it.generationitaly.cinema.repository.UtenteRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;

public class UtenteRepositoryImpl extends JpaRepositoryImpl<Utente, Long> implements UtenteRepository {
	public UtenteRepositoryImpl() {
		super(Utente.class);
	}
	
	  @Override
	    public boolean existsByUsername(String username) {
	        EntityManager em = null;
	        EntityTransaction tx = null;
	        try {
	            em = emf.createEntityManager();
	            tx = em.getTransaction();
	            tx.begin();
	            TypedQuery<Long> query = em.createQuery("SELECT COUNT(u) FROM Utente u WHERE u.username = :username", Long.class);
	            query.setParameter("username", username);
	            Long count = query.getSingleResult();
	            tx.commit();
	            return count > 0; 
	        } catch (Exception e) {
	            System.err.println(e.getMessage());
	            if (tx != null && tx.isActive())
	                tx.rollback();
	            return false; 
	        } finally {
	            if (em != null)
	                em.close();
	        }
	    }
	}


