package it.generationitaly.cinema.entity;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;

@Entity
@Table(name = "utente")
public class Utente {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false)
	private Long id;

	@Column(name = "email", length = 45, nullable = false, unique = true)
	private String email;

	@Column(name = "nome", length = 45, nullable = false)
	private String nome;

	@Column(name = "cognome", length = 45, nullable = false)
	private String cognome;

	@Temporal(TemporalType.DATE)
	@Column(name = "data_nascita", nullable = false)
	private Date dataNascita;

	@Column(name = "username", length = 45, nullable = false)
	private String username;

	@Column(name = "password", length = 45, nullable = false)
	private String password;
	

	public Utente() {
	}

	public Utente(String username) {
		this.username = username;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCognome() {
		return cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}

	public Date getDataNascita() {
		return dataNascita;
	}

	public void setDataNascita(Date dataNascita) {
		this.dataNascita = dataNascita;
	}

	@Override
	public String toString() {
		return "Utente [id=" + id + ", email=" + email + ", username=" + username + "]";
	}
}