CREATE SCHEMA cinema;
DROP SCHEMA cinema;
USE cinema;

CREATE TABLE attore (
    id BIGINT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    cognome VARCHAR(45) NOT NULL,
    data_nascita DATE NOT NULL,
    foto VARCHAR(3000) NOT NULL,
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

//inserimento di categorie

INSERT INTO categoria VALUES('1','Azione');

INSERT INTO categoria VALUES('2','Avventura');

INSERT INTO categoria VALUES('3','Drammatico');

INSERT INTO categoria VALUES('4','Commedia');

INSERT INTO categoria VALUES('5','Horror');

INSERT INTO categoria VALUES('6','Fantascienza');

INSERT INTO categoria VALUES('7','Fantasy');

INSERT INTO categoria VALUES('8','Thriller');

INSERT INTO categoria VALUES('9','Romantico');

INSERT INTO categoria VALUES('10','Animazione');

INSERT INTO categoria VALUES('11','Documentario');

INSERT INTO categoria VALUES('12','Musical');

// Inserimento di film
INSERT INTO film VALUES('1','Avengers: Endgame','Dopo che il terribile corso degli eventi messi in moto da Thanos ha spazzato via la metà dell''universo e dimezzato i ranghi degli Avengers, i sopravvissuti e i loro alleati devono riunirsi per l''assalto finale, cercando di ripristinare l''armonia.','https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQBdE2nHH1kK6m3ASymvaj4DNtsFBoNO7yXHbO-k9VYlQQLUx38','2019','182 Min','Marvel Studios, Walt Disney Pictures','356 milioni','1');

INSERT INTO film VALUES('2','Sherlock Holmes','Il detective Sherlock Holmes e il suo compagno Watson intraprendono una battaglia di ingegni con un un nemico che complotta contro il futuro dell''inghiterra.','https://m.media-amazon.com/images/M/MV5BMTg0NjEwNjUxM15BMl5BanBnXkFtZTcwMzk0MjQ5Mg@@._V1_FMjpg_UX1000_.jpg','2009','134 Min','Warner Bros.','90 milioni','1');

INSERT INTO film VALUES('3','Suicide Squad','Dopo la morte di Superman, l''agente governativa Amanda Waller decide di assemblare una squadra composta da pericolosi supercriminali affidando il comando al colonnello Rick Flag. Ben presto le loro capacità e la loro affinità verranno messe in discussione quando due pericolosi nemici arriveranno a Midway City.','https://m.media-amazon.com/images/M/MV5BMjM1OTMxNzUyM15BMl5BanBnXkFtZTgwNjYzMTIzOTE@._V1_.jpg','2016','123 min','Warner Bros.','175 milioni','1');

INSERT INTO film VALUES('4','La maledizione della prima luna','Caraibi, 1700. La figlia del governatore viene rapita dal malvagio pirata Barbossa. Will Turner amico d''infanzia della ragazza e segretamente innamorato di lei, si unisce a Jack Sparrow, un pirata vagabondo e per cui la parola strano suona eufemistica, per portare in salvo la fanciulla. Ma per riuscirci, dovranno affrontare misteriose e sinistre forze del male che risalgono addirittura a una maledizione azteca.','https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTsDrQyWYrNjEb2HYTyc6bPMMjb6qcJ-He07KMBPACBGwawzuCUKMM9-Jv-0ZkynyWJItfztA','2003','143 min','Walt Disney Pictures','140 milioni','1');

INSERT INTO film VALUES('1','Avengers: Endgame','Dopo che il terribile corso degli eventi messi in moto da Thanos ha spazzato via la metà dell''universo e dimezzato i ranghi degli Avengers, i sopravvissuti e i loro alleati devono riunirsi per l''assalto finale, cercando di ripristinare l''armonia.','https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQBdE2nHH1kK6m3ASymvaj4DNtsFBoNO7yXHbO-k9VYlQQLUx38','2019-04-24','182','Marvel Studios, Walt Disney Pictures','356','1');

INSERT INTO film VALUES('2','Sherlock Holmes','Il detective Sherlock Holmes e il suo compagno Watson intraprendono una battaglia di ingegni con un un nemico che complotta contro il futuro dell''inghiterra.','https://m.media-amazon.com/images/M/MV5BMTg0NjEwNjUxM15BMl5BanBnXkFtZTcwMzk0MjQ5Mg@@._V1_FMjpg_UX1000_.jpg','2009-12-25','134','Warner Bros.','90','1');

INSERT INTO film VALUES('5','Doctor Strange','Privato dell''uso delle mani da un incidente d''auto, il noto neurochirurgo Stephen Strange acquisisce potenti poteri magici in un luogo dove si combattono oscure forze decise a distruggere il mondo.','https://m.media-amazon.com/images/M/MV5BNjgwNzAzNjk1Nl5BMl5BanBnXkFtZTgwMzQ2NjI1OTE@._V1_.jpg','2016-10-26','115','Marvel Studios, Walt Disney Pictures','350.6','1');

INSERT INTO film VALUES('4','La maledizione della prima luna','Caraibi, 1700. La figlia del governatore viene rapita dal malvagio pirata Barbossa. Will Turner amico d''infanzia della ragazza e segretamente innamorato di lei, si unisce a Jack Sparrow, un pirata vagabondo e per cui la parola strano suona eufemistica, per portare in salvo la fanciulla. Ma per riuscirci, dovranno affrontare misteriose e sinistre forze del male che risalgono addirittura a una maledizione azteca.','https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTsDrQyWYrNjEb2HYTyc6bPMMjb6qcJ-He07KMBPACBGwawzuCUKMM9-Jv-0ZkynyWJItfztA','2003-08-27','143','Walt Disney Pictures','140','1');

INSERT INTO film VALUES('5','Doctor Strange','Privato dell''uso delle mani da un incidente d''auto, il noto neurochirurgo Stephen Strange acquisisce potenti poteri magici in un luogo dove si combattono oscure forze decise a distruggere il mondo.','https://m.media-amazon.com/images/M/MV5BNjgwNzAzNjk1Nl5BMl5BanBnXkFtZTgwMzQ2NjI1OTE@._V1_.jpg','2016','115 min','Marvel Studios, Walt Disney Pictures','350.6 milioni','1');

//inserimento di Attori
INSERT INTO attore 
VALUES
    ('1','Margot', 'Robbie', '1990-07-02','https://static2.amica.it/wp-content/uploads/2023/08/AMICARCS_20230804112136213_202d2c3412a893b2aed9156e58fb0f2f1-1-635x967.jpg', 'Margot Robbie è un attrice e produttrice australiana, conosciuta per i suoi ruoli in film come "The Wolf of Wall Street", "Suicide Squad" e "Tonya".'),
    
    ('2','Robert', 'Downey Jr.', '1965-04-04','https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Robert_Downey_Jr_2014_Comic_Con_%28cropped%29.jpg/1200px-Robert_Downey_Jr_2014_Comic_Con_%28cropped%29.jpg', 'Robert Downey Jr. è un attore e produttore americano, famoso per il suo ruolo di Iron Man nel Marvel Cinematic Universe e per film come "Sherlock Holmes" e "Chaplin".'),
    
    ('3','Johnny', 'Depp', '1963-06-09', 'https://upload.wikimedia.org/wikipedia/commons/2/21/Johnny_Depp_2020.jpg','Johnny Depp è un attore, produttore e musicista americano, noto per i suoi ruoli eclettici in film come "Pirati dei Caraibi", "Edward mani di forbice" e "La fabbrica di cioccolato".'),
    
    ('4','Benedict', 'Cumberbatch', '1976-07-19', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/BCumberbatch_Comic-Con_2019.jpg/220px-BCumberbatch_Comic-Con_2019.jpg', 'Benedict Cumberbatch è un attore britannico, riconosciuto per le sue interpretazioni in "Sherlock", "Doctor Strange" nel Marvel Cinematic Universe e "The Imitation Game".');

