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
    nome VARCHAR(45) NOT NULL,
    cognome VARCHAR(45) NOT NULL,
    data_nascita DATE NOT NULL,
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
    titolo VARCHAR(100) NOT NULL,
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

   
INSERT INTO attore VALUES ('1','Margot', 'Robbie', '1990-07-02','https://static2.amica.it/wp-content/uploads/2023/08/AMICARCS_20230804112136213_202d2c3412a893b2aed9156e58fb0f2f1-1-635x967.jpg', 'Margot Robbie è un''attrice e produttrice australiana, riconosciuta a livello internazionale per la sua versatilità e talento. 
Cresciuta a Dalby, nel Queensland, ha iniziato la sua carriera nel 2007 con un ruolo nella soap opera Neighbours, che le ha conferito notorietà in Australia. Il suo debutto cinematografico avviene nel 2013 con il film ""The Wolf of Wall Street"", in cui recita accanto a Leonardo DiCaprio, ricevendo ampi consensi dalla critica. 
Da allora, ha collezionato una serie di successi, tra cui ""Focus"" (2015), ""Suicide Squad"" (2016), dove interpreta Harley Quinn, e ""Tonya"" (2017), che le vale una nomination all''Oscar come miglior attrice.
Oltre alla recitazione, Robbie è anche una produttrice di successo, co-fondando la sua casa di produzione, LuckyChap Entertainment. Tra i suoi progetti recenti, spiccano Once Upon a Time in Hollywood (2019) di Quentin Tarantino e Barbie (2023), in cui interpreta il personaggio principale. 
Con una carriera in continua ascesa, Robbie è considerata una delle attrici più talentuose e influenti della sua generazione.');
    
INSERT INTO attore VALUES ('2','Robert', 'Downey Jr.', '1965-04-04','https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Robert_Downey_Jr_2014_Comic_Con_%28cropped%29.jpg/1200px-Robert_Downey_Jr_2014_Comic_Con_%28cropped%29.jpg','Robert Downey Jr. è un attore e produttore statunitense, noto per il suo carisma e le sue interpretazioni poliedriche. 
Cresciuto a New York in una famiglia di artisti, inizia a recitare in giovane età, facendo il suo debutto cinematografico con Pound (1970), un film diretto da suo padre, Robert Downey Sr. 
Negli anni ''80 e ''90, guadagna notorietà con ruoli in film come Less Than Zero (1987) e Chaplin (1992), per il quale riceve una nomination all''Oscar come miglior attore. Tuttavia, la sua carriera subisce un rallentamento a causa di problemi personali e dipendenze. Il suo grande ritorno avviene nel 2008, quando interpreta Tony Stark/Iron Man nell''Universo Cinematografico Marvel, 
un ruolo che lo consacra come uno dei più grandi attori di Hollywood e che riprende in vari film, tra cui The Avengers (2012) e Avengers: Endgame (2019). Downey Jr. è amato non solo per le sue capacità recitative, ma anche per il suo spirito ironico e il suo approccio alla vita. Oggi è considerato una delle stelle più brillanti di Hollywood, combinando talento, umorismo e una straordinaria capacità di reinventarsi.');
                        
INSERT INTO attore VALUES ('3','Johnny', 'Depp', '1963-06-09', 'https://upload.wikimedia.org/wikipedia/commons/2/21/Johnny_Depp_2020.jpg','Johnny Depp è un attore, produttore e musicista statunitense, noto per la sua versatilità e i ruoli iconici che ha interpretato nel corso della sua carriera. Nato a Owensboro, nel Kentucky, cresce in una famiglia modesta e si trasferisce in Florida durante l''infanzia. 
Inizia la sua carriera nel mondo dello spettacolo come musicista, ma la sua vera passione si rivela essere la recitazione. Depp ottiene il suo primo ruolo importante nella serie TV 21 Jump Street negli anni ''80, che lo rende un volto noto. Tuttavia, è il film Edward mani di forbice (1990), diretto da Tim Burton, a segnare la sua ascesa nel cinema. Da allora, collabora frequentemente con Burton, recitando in film come La sposa cadavere e Alice in Wonderland. 
Nel 2003, Depp raggiunge la fama mondiale interpretando il Capitano Jack Sparrow nella serie di film Pirati dei Caraibi, un ruolo che diventa iconico. La sua carriera è caratterizzata da una scelta eclettica di ruoli in film di genere diverso, come Donnie Brasco, Sweeney Todd e Il mistero della casa del tempo. Nonostante il successo professionale, la vita personale di Depp è stata segnata da alti e bassi, tra cui pubblicità per le sue relazioni e controversie legali. 
Tuttavia, continua a essere una figura di spicco nel panorama cinematografico, apprezzato per il suo talento e il suo impegno artistico.');
    
INSERT INTO attore VALUES  ('4','Benedict', 'Cumberbatch', '1976-07-19', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/BCumberbatch_Comic-Con_2019.jpg/220px-BCumberbatch_Comic-Con_2019.jpg', 'Cresciuto a Londra, ha frequentato la Harrow School e successivamente la Manchester University, dove ha studiato recitazione. Inizia la sua carriera teatrale con la Royal Shakespeare Company, guadagnando notorietà per il suo ruolo di Sherlock Holmes nella serie BBC "Sherlock". 
La sua performance gli vale riconoscimenti internazionali e una nomination agli Emmy. Cumberbatch ha brillato anche sul grande schermo, recitando in film come "The Imitation Game", per il quale riceve una nomination all''Oscar, e nel ruolo di Doctor Strange nell''universo Marvel. La sua carriera spazia tra ruoli drammatici e d''azione, e continua a consolidare la sua posizione come uno dei più rispettati attori della sua generazione. 
Oltre al cinema e al teatro, è noto per il suo impegno in cause benefiche e sociali.');

INSERT INTO attore VALUES ('5','Ryan','Gosling','1980-11-12','https://m.media-amazon.com/images/M/MV5BMTQzMjkwNTQ2OF5BMl5BanBnXkFtZTgwNTQ4MTQ4MTE@._V1_.jpg','Ryan Gosling è un attore e musicista canadese, noto per la sua versatilità e il suo carisma sullo schermo. Cresciuto a Cornwall, Ontario, ha iniziato la sua carriera nel mondo dello spettacolo da giovane, partecipando a programmi per bambini come ""Mickey Mouse Club"". Gosling ha guadagnato notorietà con ruoli in film come ""The Notebook"", 
che lo ha consacrato come un’icona romantica. La sua carriera è proseguita con successi in film come ""Drive"", ""La La Land"", e ""Blade Runner 2049"", dimostrando la sua capacità di affrontare una vasta gamma di generi, dal dramma all''azione. Oltre alla recitazione, è anche un musicista e ha collaborato con diverse band. Gosling è noto anche per il suo impegno in cause sociali e ambientali.');

INSERT INTO attore VALUES ('6','Leonardo','Di Caprio','1974-11-11','https://pad.mymovies.it/cinemanews/2023/186280/leo.jpg','Leonardo DiCaprio è un attore e produttore cinematografico statunitense, noto per le sue performance in una vasta gamma di film che spaziano dal dramma all''azione. Cresciuto a Los Angeles, DiCaprio inizia la sua carriera da bambino in pubblicità e serie TV, guadagnando attenzione per il suo ruolo in ""Growing Pains"". Il suo primo grande successo arriva con il film ""What''s Eating Gilbert Grape"" (1993), 
per il quale riceve la sua prima nomination all''Oscar. 
Tuttavia, la vera consacrazione avviene con "Titanic" (1997), diretto da James Cameron, che diventa un fenomeno culturale e lo catapulta nel firmamento di Hollywood. Da quel momento, DiCaprio collabora con registi di fama come Martin Scorsese, con cui realizza film acclamati come "Gangs of New York", "The Aviator", 
"The Departed" e "Wolf of Wall Street". Oltre alla sua carriera attoriale, DiCaprio è un appassionato ambientalista e fondatore della Leonardo DiCaprio Foundation, impegnata nella lotta contro i cambiamenti climatici e nella conservazione della biodiversità. La sua dedizione per l''ambiente si riflette anche nel suo lavoro cinematografico, con documentari come "Before the Flood". Nel 2016, dopo diverse nomination, DiCaprio vince finalmente l''Oscar come Miglior Attore per la sua performance in "The Revenant".
 Con una carriera che abbraccia più di due decenni e un impegno costante per le cause ambientaliste, DiCaprio è considerato uno dei più talentuosi e influenti attori della sua generazione.');

INSERT INTO attore VALUES ('7','Robert','De Niro','1943-08-17','https://image.tmdb.org/t/p/w500/cT8htcckIuyI1Lqwt1CvD02ynTh.jpg','Robert De Niro è un attore e produttore statunitense, considerato uno dei più grandi attori della sua generazione. Cresciuto a New York, ha iniziato a recitare fin da giovane, frequentando il Lee Strasberg Theatre Institute. De Niro ha guadagnato fama internazionale con il suo ruolo in "Mean Streets" di Martin Scorsese e ha continuato a lavorare con il regista in film iconici come "Taxi Driver", "Raging Bull" e "Goodfellas". La sua versatilità lo ha portato a interpretare una vasta gamma di personaggi, da gangster a ruoli drammatici e comici, come in "Meet the Parents". Vincitore di numerosi premi, tra cui due premi Oscar, De Niro è noto anche per il suo impegno nel cinema indipendente e per le sue iniziative filantropiche.');

INSERT INTO attore VALUES ('8','Christian', 'Bale','1974-01-30','https://www.ilpost.it/wp-content/uploads/2024/01/30/1706607890-christian-bale42.jpg','Christian Bale è un attore britannico celebre per la sua straordinaria capacità di trasformarsi fisicamente e psicologicamente per ogni ruolo. È diventato famoso con "American Psycho" e ha consolidato il suo successo interpretando Batman nella trilogia de "Il cavaliere oscuro" di Christopher Nolan. Oltre alla sua popolarità nei film di grande budget, ha vinto un Oscar per il suo ruolo in "The Fighter". Conosciuto per il suo perfezionismo, Bale ha affrontato ruoli in film come The Machinist, Vice e Ford v Ferrari, confermandosi tra gli attori più versatili e rispettati di Hollywood.');

INSERT INTO attore VALUES ('9','Michael', 'Keaton','1951-09-05','https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Michael_Keaton-63916_%28cropped%29.jpg/800px-Michael_Keaton-63916_%28cropped%29.jpg','Michael Keaton è un attore e produttore statunitense originario della Pennsylvania. Ha iniziato la sua carriera nel mondo della televisione, guadagnando notorietà negli anni ''80 con ruoli in sitcom e film. La sua interpretazione iconica del supereroe Batman nei film di Tim Burton, "Batman" e "Batman Returns", lo ha consacrato come uno dei volti più riconoscibili del cinema. Dopo una pausa nella carriera, Keaton ha fatto un ritorno trionfale con "Birdman", vincendo numerosi premi e riconoscimenti per la sua performance. Con una carriera che abbraccia diverse generazioni e generi, Keaton è considerato uno dei più talentuosi attori della sua generazione.');

INSERT INTO attore VALUES ('10','Winona', 'Ryder','1971-10-29','https://cdn.britannica.com/67/222467-050-37837EB5/Winona-Ryder-2018.jpg','Winona Ryder è un''attrice statunitense, originaria di Winona, Minnesota. Cresciuta in un ambiente artistico, ha debuttato nel cinema a metà degli anni ''80, guadagnando rapidamente notorietà per le sue performance in film come "Beetlejuice" e "Heathers". La sua carriera ha continuato a fiorire negli anni ''90 con ruoli memorabili in pellicole come ""L''età dell''innocenza"" e ""Piccole donne"". Nonostante alcune difficoltà personali e professionali, Ryder ha fatto un significativo ritorno nel mondo del cinema e della televisione, guadagnando riconoscimenti per il suo ruolo nella serie "Stranger Things". Con una carriera di oltre tre decenni, Winona Ryder è considerata un''icona della cultura pop e un''attrice versatile.');

INSERT INTO attore VALUES ('11','Jenna' , 'Ortega','2002-09-27','https://www.thewom.it/content/uploads/sites/3/2023/04/beauty-look-jenna-ortega.jpg','Jenna Ortega è un''attrice americana, nota per il suo talento e la sua versatilità. Ha iniziato la sua carriera da giovanissima, ottenendo ruoli in serie TV di successo come "Jane the Virgin" e "You". La sua interpretazione nel ruolo di Wednesday Addams nella serie "Wednesday" ha ricevuto ampi consensi, consolidandola come una delle giovani star più promettenti di Hollywood. Oltre alla recitazione, Jenna è anche una voce attiva su temi sociali e culturali, utilizzando la sua piattaforma per sensibilizzare su questioni importanti. Con un crescente seguito di fan e progetti futuri in cantiere, Jenna continua a lasciare il segno nell''industria cinematografica.');

INSERT INTO attore VALUES ('12','Halle' , 'Berry','1966-08-14','https://static.sky.it/editorialimages/56512576c88de826e944e29cbb319b078a827e12/skytg24/it/spettacolo/2020/08/19/halle-berry-video-costume/halle-berry-cover.jpg', 'Halle Berry è un''attrice e produttrice statunitense, famosa per la sua versatilità e il suo talento. Ha iniziato la sua carriera come modella e ha fatto il suo debutto nel mondo del cinema negli anni ''90. La Berry ha guadagnato riconoscimenti per ruoli in film come ""Monster''s Ball"", per il quale ha vinto un premio Oscar come miglior attrice, diventando la prima donna afroamericana a ricevere questo riconoscimento nella categoria principale. È conosciuta anche per i suoi ruoli in franchise di successo come ""X-Men"" e ""James Bond"". Con una carriera che abbraccia vari generi cinematografici, Halle Berry è considerata una delle attrici più influenti del suo tempo.');

INSERT INTO attore VALUES ('13','James'  'McAvoy','1979-04-21','https://ihorror.com/wp-content/uploads/2023/04/James-McAvoy-Horror-Movie.jpg','James McAvoy è un attore scozzese, ha iniziato la sua carriera nel teatro, guadagnando riconoscimenti per le sue performance in produzioni classiche. È salito alla ribalta con il film "Atonement," che ha messo in luce il suo talento drammatico. McAvoy è diventato famoso per la sua interpretazione di Charles Xavier nella serie "X-Men," dimostrando un’abilità unica nel bilanciare carisma e vulnerabilità. Ha continuato a stupire il pubblico in film come "Split" e "Glass," dove ha sfidato se stesso con ruoli complessi e sfaccettati. Con una carriera diversificata, continua a essere un attore molto rispettato a Hollywood.');

INSERT INTO attore VALUES ('14','Mackenzie' , 'Davis','1987-04-01','https://www.intrattenimento.eu/wp-content/uploads/2019/01/Mackenzie-Davis.jpg', 'Attrice canadese, Mackenzie Davis fa il suo esordio nel cinema nel 2012 con Smashed di James Ponsoldt, diventando un volto riconoscibile del cinema indipendente. Ottiene attenzione per il ruolo in What If (2013), che le vale una candidatura all''Academy of Canadian Cinema and Television Award come miglior attrice non protagonista. Dopo ruoli in film come Sopravvissuto - The Martian (2015) e Blade Runner 2049 (2017), è protagonista di Tully (2018) accanto a Charlize Theron. Per la televisione, è nota per Halt and Catch Fire e per il suo ruolo nell''episodio ""San Junipero"" di Black Mirror. Recentemente, ha recitato in Terminator - Destino oscuro e The Turning - La casa del male.');

INSERT INTO attore VALUES ('15','Aisling' ,'Franciosi','https://www.iodonna.it/wp-content/uploads/2019/02/ShootingStars2019_Portraits_020-1024x683.jpg','Nata a Dublino da padre italiano e madre irlandese, ha due fratelli maggiori e una sorella minore. Bilingue in inglese e italiano, si dedica al teatro fin da giovane, ottenendo il suo primo ruolo nella miniserie Quirke. È nota per il suo ruolo di Katie in The Fall - Caccia al serial killer, che le vale un premio come miglior attrice non protagonista. Ha esordito al cinema con Jimmy''s Hall e ha recitato nel corto Ambition. Nel 2018 interpreta Claire in The Nightingale, diretto da Jennifer Kent e presentato alla Mostra di Venezia.');

INSERT INTO attore VALUES ('16','Timothée', 'Chalamet','1995-12-27','https://media.vogue.mx/photos/61ae54524e8164be2c15aa6f/2:3/w_2560%2Cc_limit/GettyImages-1347362857.jpg', 'Di padre francese e madre statunitense, l''attore Timothée Hal Chalamet è cresciuto a New York, nel quartiere di Hell''s Kitchen, noto per la sua vicinanza a Broadway. Ha iniziato la sua carriera da bambino con spot pubblicitari e cortometraggi, prima di debuttare sul piccolo schermo in Law & Order e nel film Un Amore per Leah. Il grande debutto arriva nel 2011 con la commedia The Talls a Off-Broadway, seguito da ruoli in serie come Royal Pains e Homeland. L''esordio al cinema avviene nel 2014 con Men, 
Women & Children e nel film di Christopher Nolan Interstellar. La sua ascesa continua con ruoli significativi in Natale all''improvviso e, soprattutto, in Chiamami col tuo nome, che gli vale una nomination agli Oscar. Nel 2017, la sua fama si consolida anche con partecipazioni in Hostiles e Lady Bird. Chalamet è apprezzato dalla critica per la sua recitazione “irresistibile” e per la dedizione ai suoi ruoli, paragonato a leggende come James Dean.');

INSERT INTO attore VALUES ('17','Zendaya',null,'1996-09-01','https://media.vogue.es/photos/65ee46c4422db62534fce5ca/2:3/w_2560%2Cc_limit/GettyImages-2066795732.jpg','Zendaya Maree Stoermer Coleman è un’attrice e cantante statunitense, nota per il suo talento sia nella musica che nella recitazione. Ha guadagnato fama con la serie Disney Shake It Up e ha ottenuto riconoscimenti internazionali per il suo ruolo in Euphoria, dove interpreta Rue, una giovane con problemi di dipendenza. Nel 2021, ha brillato nel film Dune di Denis Villeneuve, interpretando Chani, un ruolo che ha messo in evidenza la sua versatilità. Oltre alla recitazione, Zendaya è una figura influente nella moda e sostiene iniziative per la diversità 
e l''inclusione nell''industria dell''intrattenimento.');

INSERT INTO attore VALUES ('18','Cillian', 'Murphy','1976-05-25','https://cdn.britannica.com/10/215010-050-A44F9280/Irish-actor-Cillian-Murphy-2017.jpg','Cillian Murphy è un attore irlandese originario di Douglas, Cork. Inizia la sua carriera musicale in una band prima di dedicarsi alla recitazione con la Corcadorca Theater Company. Il suo primo successo internazionale arriva con 28 giorni dopo di Danny Boyle, dove interpreta Jim, un giovane che si risveglia in una Londra post-apocalittica. La sua versatilità emerge in ruoli significativi come lo Spaventapasseri nella trilogia di Batman di Christopher Nolan e nel film Il vento che accarezza l''erba, che gli vale l''acclamazione della critica. Murphy ha partecipato a progetti importanti come Inception, Peaky Blinders, dove interpreta il carismatico Thomas Shelby,
 e Transcendence con Johnny Depp. Oltre alla recitazione, è noto per la sua natura riservata e il suo impegno verso il vegetarianismo. Sposato dal 2004 con l''artista Yvonne McGuinness, ha due figli e continua a essere uno dei volti più apprezzati del cinema contemporaneo.');

INSERT INTO attore VALUES ('19','Emily','Blunt','1983-02-23','https://forbes.it/wp-content/uploads/2024/08/GettyImages-2150896970-scaled.jpg','Emily Blunt è un''attrice britannica di grande successo, nota per la sua versatilità e talento. Ha iniziato la sua carriera nel teatro, guadagnando attenzione con il ruolo in "The Royal Family". Il suo debutto cinematografico arriva con "The Devil Wears Prada", dove recita accanto a Meryl Streep. Da allora, ha recitato in film di successo come ""A Quiet Place"", ""Edge of Tomorrow"" e ""Mary Poppins Returns"". Blunt ha ricevuto numerosi riconoscimenti per le sue performance, affermandosi come una delle attrici più apprezzate di Hollywood. È anche nota per il suo impegno in progetti a tema sociale e per la sua vita privata riservata.');

INSERT INTO attore VALUES ('20','Brad','Pitt','1963-12-18','https://movieplayer.net-cdn.it/t/images/2023/04/07/brad-pitt_jpg_1600x900_crop_q85.jpg','Brad Pitt è un attore e produttore statunitense, noto per le sue interpretazioni in film iconici e per la sua presenza carismatica sul grande schermo. Dopo aver conseguito una laurea in giornalismo e pubblicità, inizia la sua carriera recitando in serie TV come "Dallas" e "Growing Pains". Ottiene notorietà negli anni ''90 grazie a ruoli in film come ""Thelma & Louise"", "A River Runs Through It" e "Legends of the Fall". Pitt si afferma definitivamente con "Fight Club" e "Se7en", consolidando la sua reputazione di attore versatile. Ha collaborato con registi di prestigio, come Quentin Tarantino in "Inglourious Basterds" e "Once Upon a Time in Hollywood", e con David Fincher in "Fight Club". 
Oltre alla recitazione, Pitt è un produttore di successo, fondando la sua casa di produzione, Plan B Entertainment, che ha prodotto opere acclamate come "12 Years a Slave" e "Moonlight". Riconosciuto per il suo impegno sociale e filantropico, Pitt ha sostenuto diverse cause umanitarie e ambientali nel corso degli anni. Ha ricevuto numerosi premi, tra cui un Oscar come Miglior Attore non protagonista per "Once Upon a Time in Hollywood", confermando il suo status di icona nel mondo del cinema.');

INSERT INTO attore VALUES ('21','Joseph Gordon' , 'Levitt','1981-02-17','https://m.media-amazon.com/images/M/MV5BMTczNDUzMTg0M15BMl5BanBnXkFtZTcwNDg2NDQzNA@@._V1_.jpg','Joseph Gordon-Levitt è un attore, regista e produttore statunitense, noto per la sua versatilità e talento. Inizia la sua carriera da bambino nella serie televisiva ""3rd Rock from the Sun"", dove guadagna popolarità. Ha recitato in film come "Inception", "500 Days of Summer" e "The Dark Knight Rises", mostrando la sua capacità di interpretare ruoli complessi in diversi generi. Oltre alla recitazione, ha co-fondato la piattaforma online "HITRECORD", dedicata alla collaborazione creativa. Gordon-Levitt continua a essere una figura influente nel mondo del cinema e della cultura pop.');

INSERT INTO attore VALUES ('22','Tom','Hardy','1977-09-15','https://resizing.flixster.com/-XZAfHZM39UwaGJIFWKAE8fS0ak=/v3/t/assets/269411_v9_bd.jpg','Tom Hardy è un attore e produttore britannico, noto per la sua versatilità e per le sue performance intense. Ha esordito nel 2001 nella miniserie ""Band of Brothers"" e ha guadagnato notorietà con il film ""Bronson"" (2008), in cui interpreta il criminale Michael Peterson. La sua carriera ha continuato a decollare grazie a ruoli in film come ""Inception"" (2010), ""The Dark Knight Rises"" (2012), e "Mad Max: Fury Road" (2015), per il quale ha ricevuto ampi consensi dalla critica. Hardy è noto anche per le sue interpretazioni in "Venom" (2018) e nella serie "Taboo". 
Conosciuto per il suo approccio trasformativo ai personaggi, è considerato uno degli attori più talentuosi della sua generazione.');

INSERT INTO attore VALUES ('23','Keira', 'Knightley','1985-03-26','https://compass-media.vogue.it/photos/6602c7486a8e6adad555af4a/master/w_1600%2Cc_limit/Keira%2520Knightley%25203.jpg','Keira Knightley è un''attrice britannica, riconosciuta per la sua versatilità e il suo talento in vari generi cinematografici. Ha iniziato la carriera da giovane, guadagnando attenzione con il film "Pirati dei Caraibi: La maledizione della prima luna" (2003), dove ha interpretato Elizabeth Swann. La sua fama è esplosa con "Orgoglio e pregiudizio" (2005), che le è valso una nomination all''Oscar. Ha continuato a recitare in pellicole di successo come "Atonement" (2007), "Anna Karenina" (2012) e "The Imitation Game" (2014). Knightley è apprezzata anche per il suo impegno sociale, sostenendo cause come i diritti delle donne e la salute mentale.
 Con una carriera ricca di ruoli indimenticabili, è considerata una delle attrici più talentuose della sua generazione.');

INSERT INTO attore VALUES ('24','Viggo','Mortensen','1958-10-20','https://cdn.britannica.com/36/221836-050-E37532D9/Danish-American-actor-author-Viggo-Mortensen-2018.jpg','Viggo Mortensen è un attore, produttore e fotografo statunitense, noto per la sua versatilità e la sua intensità nelle interpretazioni. È cresciuto tra il Venezuela, gli Stati Uniti e la Danimarca, sviluppando una passione per le arti sin da giovane. Ha guadagnato notorietà mondiale grazie al suo ruolo di Aragorn nella trilogia de "Il Signore degli Anelli", diretta da Peter Jackson, che ha segnato un punto di svolta nella sua carriera. Mortensen ha recitato in una vasta gamma di film, tra cui "A History of Violence" (2005), "Eastern Promises" (2007) e "Captain Fantastic" (2016), dimostrando la sua capacità di interpretare personaggi complessi e sfumati. Oltre alla recitazione, è anche un artista e un fotografo, con mostre delle sue opere in tutto il mondo. Mortensen è noto per il suo impegno politico e sociale, affrontando temi importanti sia nei suoi film che nelle sue dichiarazioni pubbliche. Con una carriera che abbraccia oltre tre decenni, è considerato uno degli attori più rispettati di Hollywood.');


// inserimento recensioni

INSERT INTO recensione VALUES('1','Questo film va visto... a qualunque costo. A mio parere il migliore dei 23 del Marvel Cinematic Universe. Battere Avengers: Infinity War era un impresa più che ardua, ma Avengers: Endgame ci è riuscito.
Interpretazione indimenticabile (in particolare nel caso di Robert Downey Jr colonna sonora fantastica, missione epica, e naturalmente la più grande battagliona finalona della storia, rendono questo film una specie di capolavoro, facendo provare allo spettatore (soprattutto ai fan del MCU) una emozione e una carica incredibili. Personalmente, non ho mai provato una tale emozione e una tale carica in nessun film che io abbia già visto. E quando lo vedi in sala... SPETTACOLARE. Assolutamente spettacolare. 
Non si era mai visto un capitolo conclusivo tanto spettacolare, tanto amato, tanto proficuo e, soprattutto, tanto mastodontico, essendo la fine dei giochi di una saga composta da 21 film, prima di esso. Ci ha fatto ridere, piangere, commuovere, emozionare. L''ultima battaglia, un ultimo sacrificio, un ultima missione. Un ultimo ''Io sono Iron Man''. 
Il mio film preferito, di ogni genere e categoria, senza ombra di dubbio','2','1');

INSERT INTO recensione VALUES ('2','Finalmente qualcuno ha pensato bene di abbattere tutti i falsi stereotipi cinematografici precedenti su Sherlock Holmes e, guarda caso, è stato uno dei miei registi preferiti di sempre: Guy Ritchie. Questo film è come un giro sulle montagne russe: divertente e avvincente fin dal primo istante. E le dinamiche Holmes/Watson il vero cuore dell''intero film. La chimica fra i due protagonisti, Downey Jr. e Law, è stupefacente! Sebbene RDJ non abbia niente di Holmes a livello estetico, è riuscito con la sua interpretazione a far dimenticare completamente al pubblico quel dettaglio trascurabile, così lui e JL, sono ad oggi i migliori Holmes e Watson di sempre. Meno soddisfacenti i personaggi di contorno, Adler compresa, completamente stravolta dal racconto originale, ma a loro si fa davvero poco caso.   Critiche? Due, ma che non influiscono sulla piacevolezza del film: il cambio di "ritmo" della regia fra il "primo tempo" e il "secondo tempo" e il "cattivo" Blackwood dal quale ci si aspettava forse qualcosa in più. Ma in totale questo è il miglior Sherlock Holmes mai realizzato finora','2','2');

INSERT INTO recensione VALUES ('3',' Un film fuori dalle solite convenzioni.. incentrato dopo la morte di Superman, in cui invece di servirsi dell'' aiuto dei soliti eroi, si sono serviti dei famosi cattivi, che i tanto conosciuti eroi si sono affannati a combattere. 
I più celebri, nonchè i più pericolosi, sono stati tirati in ballo incentrando la storia non solo sulla missione che il gruppo doveva compiere, ma anche sulla vita privata che ognuno di questi criminali ha fuori dalla prigione. Come dice il titolo "squadra suicida", questi criminali devono riuscire a battere una forza sopra la loro portata, 
ma che con astuzia riescono a battere. Grazie a questo film ci rendiamo conto che i cosiddetti "cattivi" non sempre vengono sconfitti perche non hanno organizzato bene l'' attacco oppure perchè hanno trovato qualcosa più grande di loro... Qui anche i cattivi possono avere la loro dose di gloria, mostrando che anche se guidati da qualcun''altro possono fare qualcosa di buono anche loro. 
Qui la DC ci fa notare che anche i più temibili hanno qualcuno a cui tengono e che anche i più pazzi possono avere un cuore. ','3','3');

INSERT INTO recensione VALUES ('4','1° capitolo di una saga poi diventata un fenomeno planetario, questo La maledizione della prima luna (il titolo inglese significa invece La maledizione della Perla Nera), un film costato ben 140 milioni di dollari, riesce, dopo anni di oblio, a risollevare le sorti del genere piratesco, 
grazie ad una ottima regia e ad un''ottima e variegata squadra di attori, e soprattutto grazie ad uno straordinario apparato tecnico (gli effetti notturni in cui i pirati si rivelano per quello che realmente sono, degli inquietanti scheletri semoventi, sono eccezionali).
Lo script di Elliott e Rossio, derivato dalla ben nota attrazione disneyana, aggiunge poi quel pizzico di ironia e autoironia che non guasta mai, facendo del film un spasso continuo, pieno di gag e battute riuscite, ma anche pieno di azione ed effetti speciali. Tutto quello che ci si aspetta da un blockbuster hollywoodiano, insomma.
La storia non conta più di tanto, quello che conta sono i personaggi, tutti riusciti, a cominciare dallo Sparrow di Depp fino al Barbossa di Rush o al Gibbs di McNally, l''azione continua, i costumi e le fantasiose scenografie, la colonna sonora di grande impatto, la fotografia.
Sarà anche, insomma, solo un prodotto di puro intrattenimento, un semplice divertimento da luna park, ma non si prende mai sul serio e funziona.','4','4');

INSERT INTO recensione VALUES ('5','Veramente bello e ben riuscito, con un Johnny Depp perfetto, calato a pennello, con un Verbinski padrone della situazione e un cast davvero funzionale  econcreto a cominciare da un grande Rush. A mio avviso è il miglior film sulla pirateria anche se questa ha un taglio diverso, 
ironico, spiritoso, a tratti leggero ma mai sciocco, mescolato comunque a situazioni tipiche e a volte stereotipate come tesori, duelli, codici pirateschi ed immancabili arrembaggi (davvero belli!). Da ricordare gli effetti speciali delle trasformazioni notturne della ciurma ed i costumi, autentico pezzo forte non solo del film ma 
dell''intera saga. Belle anche le scene d''azione, frenetiche, veloci, credibili, grazie ad un montaggio ed una regia di alto livello. Nonostante una durata esagerata non annoia. Senza dubbio il migliore della saga, giunta in questi giorni al quarto episodio che ancora non ho visto','6','5');


INSERT INTO recensione VALUES ('6','Doctor Strange rappresenta una vera e propria novità nell''universo Marvel in quanto per la prima volta lo spettatore vi vede insita la componente magica resa manifesta dal regista Scott Derrickson, 
il quale non trova problemi a riguardo compiendo da dietro la cinepresa davvero un buon lavoro e gli attori che lui stesso ha diretto risultano all''altezza dei loro ruoli. Benedict Cumberbatch bravissimo nel gestire le sfumature del suo personaggio e Tilda Swinton oramai è una garanzia ed attribuisce 
al suo personaggio "l''antico" un giustissimo spessore. Il Doctor Strange approda al mondo mistico in seguito a un incidente verificatosi alle sue mani ma molto velocemente si ritrova  partecipe e protagonista di una minaccia apparentemente più grande di lui seppur sterile dato che il cattivo di turno Kaecilius è come se fosse trasparente risultando di conseguenza davvero poco incisivo. Il passaggio del doctor strange dal mondo reale a quello mistico è stato ideato molto bene ma è proprio nel suo adattamento a tale mondo che la vicenda perde man mano di intesità, svolgendosi sempre sul medesimo registro senza qualcosa che la sblocchi fino alla sua conclusione. Ciò che traspare in essa da un certo punto in poi è solo la bellissima effetistica alla Inception dando così più importanza alla forma che al contenuto. Il problema infatti è proprio nello svolgimento e nella sfruttare la componente magica e mistica, a questo riguardo ci si apettava un combattimento fra stregoni e non chimatemi scontro quello fra l''antico e Kaecilius che al massimo sarà durato tre minuti con chiacchere annesse, ed una dinamica consistente oltre che il profilo action. 
Sostanzialmente il film che era partito così bene, non decolla classificandosi come un buon prodotto che sicuramente poteva dare molto di più.','5','5');

INSERT INTO recensione VALUES ('7','Mi è piaciuto vedere come Deadpool e Wolverine, nonostante le loro nature complesse e oscure, riescano a trovare una sorta di redenzione. Sono diversi ma simili, e questa dualità, unita alla grande chimica tra i protagonisti, mi è piaciuta molto. 
Entrambi i personaggi hanno storie intricate e profonde che li rendono affascinanti 
Deadpool, con il suo umorismo tagliente e la capacità di rompere la quarta parete, si vede spesso come un anti-eroe piuttosto che un eroe tradizionale. Wolverine, con il suo passato tormentato e la lotta interna tra la bestia e l’uomo, rappresenta un viaggio di redenzione e scoperta di sé
Anche se non sempre sono considerati eroi e il loro passato li fa sentire sbagliati, le loro azioni dimostrano un forte senso di giustizia e protezione verso gli altri. Questo li rende personaggi importanti per il futuro Marvel. Con questo upgrade sono diventati dei veri eroi','2','6');
