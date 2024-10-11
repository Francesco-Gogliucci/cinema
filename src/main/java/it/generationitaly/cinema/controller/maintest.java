package it.generationitaly.cinema.controller;

import it.generationitaly.cinema.repository.impl.AttoreRepositoryImpl;
import it.generationitaly.cinema.repository.impl.CategoriaRepositoryImpl;
import it.generationitaly.cinema.repository.impl.FilmAttoreRepositoryImpl;
import it.generationitaly.cinema.repository.impl.FilmRepositoryImpl;
import it.generationitaly.cinema.repository.impl.PreferitiRepositoryImpl;
import it.generationitaly.cinema.repository.impl.RecensioneRepositoryImpl;
import it.generationitaly.cinema.repository.impl.UtenteRepositoryImpl;

public class maintest {

	public static void main(String[] args) {
		AttoreRepositoryImpl attore = new AttoreRepositoryImpl();
		CategoriaRepositoryImpl categoria = new CategoriaRepositoryImpl();
		FilmAttoreRepositoryImpl filmAttore = new FilmAttoreRepositoryImpl();
		FilmRepositoryImpl film = new FilmRepositoryImpl();
		PreferitiRepositoryImpl preferiti = new PreferitiRepositoryImpl();
		RecensioneRepositoryImpl recensione = new RecensioneRepositoryImpl();
		UtenteRepositoryImpl utente = new UtenteRepositoryImpl();

		System.out.println("test");

	}

}
