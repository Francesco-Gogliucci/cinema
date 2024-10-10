CREATE SCHEMA cinema;
DROP SCHEMA cinema;
USE cinema;

CREATE TABLE attore (
    id BIGINT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    cognome VARCHAR(45) NOT NULL,
    data_nascita DATE NOT NULL,
    biografia VARCHAR(3000) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE utente (
    id BIGINT NOT NULL AUTO_INCREMENT,
    email VARCHAR(45) NOT NULL UNIQUE,
    username VARCHAR(45) NOT NULL,
    password VARCHAR(45) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE categoria (
    id BIGINT NOT NULL AUTO_INCREMENT,
    genere VARCHAR(45) NOT NULL,
    foto VARCHAR(3000) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE(genere)
);

CREATE TABLE film (
    id BIGINT NOT NULL AUTO_INCREMENT,
    titolo VARCHAR(45) NOT NULL,
    trama VARCHAR(3000) NOT NULL,
    locandina VARCHAR(3000) NOT NULL,
    data_uscita DATE NOT NULL,
    durata INT NOT NULL,
    casa_produzione VARCHAR(45) NOT NULL,
    budget_produzione INT,
    categoria_id BIGINT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (categoria_id)
        REFERENCES categoria (id)
);

CREATE TABLE preferiti (
	id BIGINT NOT NULL AUTO_INCREMENT,
    film_id BIGINT NOT NULL,
    utente_id BIGINT NOT NULL,
   -- serietv_id BIGINT,
   PRIMARY KEY (id),
    FOREIGN KEY (film_id)
        REFERENCES film (id),
    -- FOREIGN KEY (serietv_id)
        -- REFERENCES serietv (id),
        FOREIGN KEY (utente_id)
        REFERENCES utente(id),
        UNIQUE(film_id, utente_id)
);

CREATE TABLE recensione (
    id BIGINT NOT NULL AUTO_INCREMENT,
    recensione VARCHAR(3000),
    utente_id BIGINT NOT NULL,
    film_id BIGINT NOT NULL,
   -- serietv_id BIGINT,
    PRIMARY KEY (id),
    FOREIGN KEY (utente_id)
        REFERENCES utente (id),
    FOREIGN KEY (film_id)
        REFERENCES film (id),
        UNIQUE (film_id, utente_id)
    -- FOREIGN KEY (serietv_id)
       -- REFERENCES serietv (id)
);
/*
DROP TABLE serietv;
CREATE TABLE serietv (
    id BIGINT NOT NULL AUTO_INCREMENT,
    stagioni INT NOT NULL,
    episodi INT NOT NULL,
    titolo VARCHAR(45) NOT NULL,
    trama VARCHAR(450) NOT NULL,
    locandina VARCHAR(3000) NOT NULL,
    data_uscita DATE NOT NULL,
    produzione_id BIGINT NOT NULL,
    categoria_id BIGINT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (categoria_id)
        REFERENCES categoria (id),
    FOREIGN KEY (produzione_id)
        REFERENCES produzione (id)
);
*/

CREATE TABLE film_attore (
   id BIGINT NOT NULL AUTO_INCREMENT,
   film_id BIGINT NOT NULL,
   attore_id BIGINT NOT NULL,
   PRIMARY KEY (id),
    FOREIGN KEY (film_id)
        REFERENCES film (id),
    FOREIGN KEY (attore_id)
        REFERENCES attore (id),
        UNIQUE(film_id, attore_id)
);

