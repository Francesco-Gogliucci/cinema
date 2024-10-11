package it.generationitaly.cinema.controller;

import java.util.List;

import it.generationitaly.cinema.entity.Categoria;
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
		/*
		 * System.out.println("----------ATTORE----------"); List<Attore> listattore =
		 * attore.findAll(); for (Attore attore2 : listattore) {
		 * System.out.println(attore2); }
		 */
		System.out.println("----------CATEGORIA----------");
		List<Categoria> listcategoria = categoria.findAll();
		for (Categoria categoria2 : listcategoria) {
			System.out.println(categoria2);
		}
		/*
		 * System.out.println("----------FILMATTORE----------"); List<FilmAttore>
		 * listFilmAttore = filmAttore.findAll(); for (FilmAttore filmAttore2 :
		 * listFilmAttore) { System.out.println(filmAttore2); }
		 * 
		 * System.out.println("----------FILM----------"); List<Film> listFilm =
		 * film.findAll(); for (Film film2 : listFilm) { System.out.println(film2); }
		 * 
		 * System.out.println("----------PREFERITI----------"); List<Preferiti>
		 * listPreferiti = preferiti.findAll(); for (Preferiti preferiti2 :
		 * listPreferiti) { System.out.println(preferiti2); }
		 * 
		 * System.out.println("----------RECENSIONE----------"); List<Recensione>
		 * listRecensione = recensione.findAll(); for (Recensione recensione2 :
		 * listRecensione) { System.out.println(recensione2); }
		 * 
		 * System.out.println("----------UTENTE----------"); List<Utente> listUtente =
		 * utente.findAll(); for (Utente utente2 : listUtente) {
		 * System.out.println(utente2); }
		 */
	}

}
