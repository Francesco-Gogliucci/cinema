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
INSERT INTO film VALUES('1','Avengers: Endgame','Dopo che il terribile corso degli eventi messi in moto da Thanos ha spazzato via la metà dell''universo e dimezzato i ranghi degli Avengers,
 i sopravvissuti e i loro alleati devono riunirsi per l''assalto finale, cercando di ripristinare l''armonia.','https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQBdE2nHH1kK6m3ASymvaj4DNtsFBoNO7yXHbO-k9VYlQQLUx38','2019-04-24','182','Marvel Studios, Walt Disney Pictures','356','1');
INSERT INTO film VALUES('2','Sherlock Holmes','Il detective Sherlock Holmes e 
il suo compagno Watson intraprendono una battaglia di ingegni con un un nemico che complotta contro il futuro dell''inghiterra.','https://m.media-amazon.com/images/M/MV5BMTg0NjEwNjUxM15BMl5BanBnXkFtZTcwMzk0MjQ5Mg@@._V1_FMjpg_UX1000_.jpg','2009-12-25','134','Warner Bros.','90','1');
INSERT INTO film VALUES('3','Suicide Squad','Dopo la morte di Superman, l''agente governativa Amanda Waller decide di assemblare una squadra composta da pericolosi supercriminali affidando il comando al colonnello Rick Flag. Ben presto le loro capacità e la loro affinità verranno messe in discussione quando due pericolosi nemici arriveranno a Midway City.','https://m.media-amazon.com/images/M/MV5BMjM1OTMxNzUyM15BMl5BanBnXkFtZTgwNjYzMTIzOTE@._V1_.jpg','2016-08-13','123','Warner Bros.','175','1');
INSERT INTO film VALUES('4','La maledizione della prima luna','Caraibi, 1700. La figlia del governatore viene rapita dal malvagio pirata Barbossa. Will Turner amico d''infanzia della ragazza e segretamente innamorato di lei, si unisce a Jack Sparrow, un pirata vagabondo e per cui la parola strano suona eufemistica, per portare in salvo la fanciulla. Ma per riuscirci, dovranno affrontare misteriose e sinistre forze del male che risalgono addirittura a una maledizione azteca.','https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTsDrQyWYrNjEb2HYTyc6bPMMjb6qcJ-He07KMBPACBGwawzuCUKMM9-Jv-0ZkynyWJItfztA','2003-08-27','143','Walt Disney Pictures','140','1');
INSERT INTO film VALUES('5','Doctor Strange','Privato dell''uso delle mani da un incidente d''auto, il noto neurochirurgo Stephen Strange acquisisce potenti poteri magici in un luogo dove si combattono oscure forze decise a distruggere il mondo.','https://m.media-amazon.com/images/M/MV5BNjgwNzAzNjk1Nl5BMl5BanBnXkFtZTgwMzQ2NjI1OTE@._V1_.jpg','2016-10-26','115','Marvel Studios, Walt Disney Pictures','350.6','1');
INSERT INTO film VALUES('6','Deadpool & Wolverine','Mentre si sta riprendendo dopo essere stato gravemente ferito, Wolverine ha la sfortuna di incontrare quel chiacchierone di Deadpool. I due, uno con più entusiasmo dell''altro, si alleano per sconfiggere un nemico comune.','https://pad.mymovies.it/filmclub/2022/10/021/locandinapg1.jpg','2024-07-24','127','Marvel Studios','200','1');
INSERT INTO film VALUES('7','Bullet Train','Ladybug è un agente di una misteriosa organizzazione, che gli affida incarichi oltre i confini della legalità. Non si considera un assassino: è solo colpa della sfortuna se la gente finisce per morire durante le sue imprese. Questa volta avrebbe un incarico facile facile: rubare una valigetta sullo Shinkansen, il "treno-proiettile" ad altissima velocità che collega Tokyo e Kyoto.','https://pad.mymovies.it/filmclub/2021/12/034/locandinapg1.jpg','2022-08-22','127','Sony Pictures','239.3','1');
INSERT INTO film VALUES('8','Pirati dei Caraibi - La maledizione del forziere fantasma','Sparrow stavolta si trova ad affrontare un nuovo intrigo a carattere soprannaturale: il capitano ha infatti un debito d''onore con Davey Jones, padrone degli oceani e comandante dello spettrale veliero l''Olandese Volante e per lui si profila un destino di dannazione ed eterna schiavitù nell''altro mondo, se non riuscirà a scrollarsi di dosso questo pericoloso avversario. I guai di Jack coinvolgeranno ancora una volta Will ed Elizabeth e comprometteranno il matrimonio tra i due.','https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQec56pHDHp3QcsVmP9ZsI6fSw0HJHKiqf98fcnpYiUaXPDmm08e0z4wH4756P-qleyJme4iQ','2006-09-13','150','Walt Disney Pictures','225','1');
INSERT INTO film VALUES('9','Pirati dei Caraibi - Ai confini del mondo','Will Turner, Elizabeth Swann e il capitan Barbossa si alleano per liberare il capitano Jack Sparrow imprigionato negli abissi. Nel frattempo, l''Olandese Volante del capitano Davy Jones, controllato dalla Compagnia delle Indie Orientali, semina il terrore per i Sette Mari. Dopo essersi confrontato con il pirata cinese Sao Feng, il gruppo di pirati si spingerà oltre i confini della Terra per partecipare alla gigantesca battaglia finale per il controllo dei mari.','https://static.wikia.nocookie.net/piratideicaraibi/images/8/8d/Pirates_of_the_Caribbean_3_Poster.jpg/revision/latest/scale-to-width-down/431?cb=20180708113934&path-prefix=it','2007-05-23','168','Walt Disney Pictures','300','1');
INSERT INTO film VALUES('10','Joker: Folie à Deux','Il comico fallito Arthur Fleck incontra l''amore della sua vita, Harley Quinn, mentre è detenuto all''Arkham State Hospital. A seguito del suo rilascio, i due si imbarcano in una disavventura romantica.','https://www.warnerbros.it/wp-content/uploads/2024/04/Joker-Folie-a-Deux_Poster-Italia-2.jpg','2024-10-02','138',' DC Studios','200','1');
INSERT INTO film VALUES('11','Barbie','Vivere a Barbie Land significa essere perfetti in un luogo perfetto. A meno che tu non stia attraversando una crisi esistenziale. Oppure tu sia un Ken.','https://pad.mymovies.it/filmclub/2018/01/274/locandinapg1.jpg','2023-07-21','114','Mattel','140','4');
INSERT INTO film VALUES('12','The Wolf of Wall Street','L''audace e temerario broker di Wall Street Jordan Belfort accumula una fortuna grazie al suo atteggiamento spregiudicato e alle droghe, attirando l''attenzione dell''FBI.','https://pad.mymovies.it/filmclub/2010/07/050/locandina.jpg','2014-01-23','180','Appian Way Productions','100','3');
INSERT INTO film VALUES('13','Tonya','Tonya Harding è una pattinatrice artistica su ghiaccio che, nonostante le difficoltà, riesce ad affermarsi a livello internazionale. La sua vita però nel 1994 è segnata dall''aggressione alla rivale Nancy Kerrigan, dando vita a uno degli scandali più assurdi e tragici della storia del pattinaggio e dei giochi olimpici.','https://m.media-amazon.com/images/M/MV5BMjI5MDY1NjYzMl5BMl5BanBnXkFtZTgwNjIzNDAxNDM@._V1_.jpg','2018-03-22','121','LuckyChap Entertainment','11','3');
INSERT INTO film VALUES('14','Amsterdam','Negli anni ’30 un uomo viene trovato morto e tre amici finiscono per diventare dei sospettati. Nel cercare le prove in loro difesa, i tre scoprono uno dei complotti più scandalosi della storia americana.','https://pad.mymovies.it/filmclub/2020/02/099/locandinapg1.jpg','2022-10-07','134','Regency Enterprises','80','4');
INSERT INTO film VALUES('15','C''era una volta a... Hollywood','Rick Dalton, un attore televisivo, e Cliff Booth, la sua controfigura, intraprendono una personalissima odissea per affermarsi nell''industria cinematografica nella Los Angeles del 1969, segnata dagli omicidi di Charles Manson.','https://pad.mymovies.it/filmclub/2018/06/020/locandina.jpg','2019-07-26','161','Columbia Pictures','96','4');
INSERT INTO film VALUES('16','Beetlejuice Beetlejuice','Beetlejuice è tornato! Dopo un''inaspettata tragedia familiare, tre generazioni della famiglia Deetz tornano a casa a Winter River. Ancora perseguitata da Beetlejuice, la vita di Lydia viene sconvolta quando la figlia adolescente e ribelle, Astrid, scopre il misterioso modellino della città in soffitta e il portale per l''Aldilà viene accidentalmente aperto. Con i problemi che stanno nascendo in entrambi i regni, è solo questione di tempo prima che qualcuno pronunci tre volte il nome di Beetlejuice e il demone dispettoso torni nuovamente per scatenare il suo caos.','https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRxcGxVcnHVXE0Y2INQHPGeu4skJe5CcklmcbYifSjJ3vt38EBdojWFbjtC5PONVOKi8AZx3A','2024-09-05','104',' Warner Bros. Pictures','99','4');
INSERT INTO film VALUES('17','Never Let Go - A un Passo dal Male','Never Let Go - A un Passo dal Male, il film diretto da Alexandre Aja, racconta la storia di una madre (Halle Berry) che vive in una casa isolata nel bosco con i suoi due figli gemelli (Percy Daggs IV e Anthony B. Jenkins).
Sono convinti di essere circondati da spiriti maligni e che la casa sia l''unico luogo dove sono al sicuro. Quando devono allontanarsi, ognuno di loro indossa una lunga corda che lo tiene sempre legato alla casa. In questo modo i demoni del bosco non possono far loro del male.
Ma quando uno dei bambini inizia a dubitare dell''esistenza degli spiriti, la sua corda si spezza mettendo in pericolo la sua vita e quella di tutta la famiglia. Inizia allora una terrificante lotta per la sopravvivenza...','https://mr.comingsoon.it/imgdb/locandine/235x336/65776.jpg','2024-09-26','101','21 Laps Entertainment, Lionsgate Films','120','5');
INSERT INTO film VALUES('18','Inside Out 2','Il film torna nella mente dell''adolescente Riley proprio quando il quartier generale viene improvvisamente demolito per far posto a qualcosa di completamente inaspettato: nuove Emozioni! Gioia, Tristezza, Rabbia, Paura e Disgusto, che a detta di tutti gestiscono da tempo un''attività di successo, non sanno come comportarsi quando arriva Ansia. E sembra che non sia sola.','https://mr.comingsoon.it/imgdb/locandine/235x336/62287.jpg','2024-06-19','100','Pixar Animation Studios, Walt Disney Pictures','200','10');
INSERT INTO film VALUES('19','Inside Out','Riley ha undici anni e una vita felice. Divisa tra l''amica e due genitori adorabili cresce assieme alle sue emozioni che la consigliano, la incoraggiano, la contengono, la spazientiscono, la intristiscono, la infastidiscono. Dentro la sua testa e dietro ai pulsanti della console emozionale governa Joy, sempre positiva e intraprendente, si spazientisce Anger, sempre pronto alla rissa, si turba Fear, sempre impaurito e impedito, si immalinconisce Sadness, sempre triste e sfiduciata, arriccia il naso Disgust, sempre disgustata e svogliata. Trasferiti dal Minnesota a San Francisco, Riley e genitori provano ad adattarsi alla nuova vita. Il debutto a scuola e il camion del trasloco perduto nel Texas, mettono però a dura prova le loro emozioni. A peggiorare le cose ci pensano Sadness e Joy, la prima ostinata a partecipare ai cambiamenti emotivi di Riley, la seconda risoluta a garantirle un''imperturbabile felicità. Ma la vita non è mai così semplice.','https://mr.comingsoon.it/imgdb/locandine/235x336/50653.jpg','2015-09-16','94','Pixar Animation Studios, Walt Disney Pictures','175','10');
INSERT INTO film VALUES('20','Speak No Evil - Non parlare con gli sconosciuti','Una vacanza da sogno si trasforma in un incubo quando una coppia americana e la figlia trascorrono il fine settimana nell''idilliaca tenuta di campagna di una famiglia britannica.','https://mr.comingsoon.it/imgdb/locandine/235x336/63717.jpg','2024-09-11','110','Blumhouse Productions, Universal Pictures','150','5');
INSERT INTO film VALUES('21','Dune - Parte Uno','Dune narra la storia di Paul Atreides, un giovane brillante e talentuoso, nato con un grande destino che va ben oltre la sua comprensione, che dovrà viaggiare verso il pianeta più pericoloso dell''universo per assicurare un futuro alla sua famiglia e alla sua gente. Mentre forze maligne si fronteggiano in un conflitto per assicurarsi il controllo esclusivo della più preziosa risorsa esistente sul pianeta - una materia prima capace di sbloccare il più grande potenziale dell''umanità - solo coloro che vinceranno le proprie paure riusciranno a sopravvivere.','https://www.tvtime.com/_next/image?url=https%3A%2F%2Fartworks.thetvdb.com%2Fbanners%2Fv4%2Fmovie%2F6187%2Fposters%2F616324c9ecd2c.jpg&w=256&q=75','2021-09-16','155','Legendary Entertainment','165','6');
INSERT INTO film VALUES('22','Dune - Parte Due','Segui il mitico viaggio di Paul Atreides mentre si unisce a Chani e ai Fremen mentre è sul sentiero di guerra per vendicarsi dei cospiratori che hanno distrutto la sua famiglia. Di fronte a una scelta tra l''amore della sua vita e il destino dell''universo conosciuto, Paul si sforza di prevenire un terribile futuro che solo lui può prevedere.','https://mr.comingsoon.it/imgdb/locandine/235x336/61473.jpg','2024-02-28','166','Legendary Entertainment','190','6');
INSERT INTO film VALUES('23','Alien: Romulus','Alien: Romulus, film diretto da Fede Alvarez, è il nono capitolo del franchise horror sci-fi, iniziato nel 1979 con l''Alien di Ridley Scott. Il film riporta alle origini il franchise di Alien: rovistando nelle profondità di una stazione spaziale abbandonata, un gruppo di giovani colonizzatori dello spazio si trova faccia a faccia con la forma di vita più terrificante dell''universo...','https://mr.comingsoon.it/imgdb/locandine/235x336/63277.jpg','2024-08-14','119','20th Century Studios, Hulu','90','6');
INSERT INTO film VALUES('24','Furiosa: A Mad Max Saga','Mentre il mondo va in rovina, la giovane Furiosa viene strappata dal Luogo Verde delle Molte Madri, e cade nelle mani di una grande Orda di Motociclisti guidata dal Signore della Guerra Dementus. Attraversando le Terre Desolate, si imbattono nella Cittadella presieduta da Immortan Joe. Mentre i due tiranni si battono per il predominio, Furiosa deve sopravvivere a molte prove e mettere insieme i mezzi per trovare la strada di casa.','https://mr.comingsoon.it/imgdb/locandine/235x336/59737.jpg','2024-05-23','148','Kennedy Miller Mitchell, Warner Bros.','168','1');
INSERT INTO film VALUES('25','Challengers','Tashi, una giocatrice di tennis diventata allenatrice, ha trasformato suo marito Art da un mediocre giocatore a un campione del grand slam. Per risollevargli il morale dopo una scia di partite perse, lo porta a giocare a un evento “Challenger” – uno dei tornei di livelli più bassi nel tour pro – dove si ritrova ad affrontare quello che una volta era un giocatore promettente e ora è totalmente esaurito: Patrick, suo ex migliore amico ed ex fidanzato di Tashi.','https://mr.comingsoon.it/imgdb/locandine/235x336/61787.jpg','2024-04-24','131','Metro-Goldwyn-Mayer, Pascal Pictures','55','9');
INSERT INTO film VALUES('26','The Apprentice: Alle origini di Trump','The Apprentice: Alle origini di Trump, il film diretto da Ali Abbasi, segue l''ascesa del giovane Donald Trump (Sebastian Stan).
Siamo a New York tra gli anni Settanta e Ottanta e Trump è un ambizioso imprenditore. Inizia in quegli anni la costruzione del suo impero immobiliare e ad aiutarlo c''è la figura centrale di Roy Cohn (Jeremy Strong), un avvocato newyorkese noto per aver lavorato con Joseph McCarthy durante la seconda "Paura Rossa", periodo dell''anticomunismo negli Stati Uniti a cavallo degli anni Cinquanta. Cohn diventa il suo mentore e grazie a lui vengono poste le fondamenta per la nascita di una dinastia americana fatta di potere, corruzione e inganno.
Il film è centrato sul rapporto tra Cohn e Trump, all''epoca in cui il suo ingresso alla Casa Bianca è ancora molto lontano.','https://pad.mymovies.it/filmclub/2024/04/110/locandinapg2.jpg','2024-10-17','120','Gidden Media, Kinematics, Profile Pictures','80','3');
INSERT INTO film VALUES('27','Vermiglio','Vermiglio, il film diretto da Maura Delpero, si svolge in un piccolo paese di montagna di nome Vermiglio che si trova in Trentino.
Siamo nel 1944, Lucia, Ada e Livia sono tre sorelle adolescenti inseparabili, figlie di un eccentrico insegnante. Quando in paese arriva Pietro, un soldato siciliano, Lucia si innamora di lui e rimane incinta. I due sono costretti a sposarsi.
Gli equilibri della famiglia cambiano, Livia è la preferita e Ada si sente trascurata. Tutti sentono la mancanza di Lucia quando nel 1945, finita la guerra, parte con Pietro e suo figlio per la Sicilia. Ma una volta arrivata scopre nel peggiore dei modi che suo marito era già sposato. Sua moglie, scoperto il matrimonio con Lucia, si vendica sparandogli.
La giovane vedova e il suo bambino devono ricostruirsi una vita rimettendo insieme i pezzi del passato del marito.','https://mr.comingsoon.it/imgdb/locandine/235x336/65900.jpg','2024-09-19','119','Cinedora, Charades, Versus','80','3');
INSERT INTO film VALUES('28','Oppenheimer','La storia del ruolo di J. Robert Oppenheimer, i quali studi condussero alle scoperte legate alla bomba atomica, con il conseguente utilizzo durante le stragi di Hiroshima e Nagasaki durante la Seconda Guerra Mondiale.','https://mr.comingsoon.it/imgdb/locandine/235x336/61803.jpg','2023-08-23','180','Atlas Entertainment, Universal Pictures','100','3');
INSERT INTO film VALUES('29','C''è ancora domani','È primavera e tutta la famiglia è in fermento per l''imminente fidanzamento dell''amata primogenita Marcella, che, dal canto suo, spera solo di sposarsi in fretta con un bravo ragazzo di ceto borghese, Giulio, e liberarsi finalmente di quella famiglia imbarazzante.','https://www.tvtime.com/_next/image?url=https%3A%2F%2Fartworks.thetvdb.com%2Fbanners%2Fv4%2Fmovie%2F350238%2Fposters%2F651601821042c.jpg&w=256&q=75','2023-10-26','118','Wildside, Vision Distribution','8','3');
INSERT INTO film VALUES('30','Killers of the Flower Moon','All’inizio del XX secolo, la scoperta del petrolio trasformò l’esistenza degli Osage che diventarono da un giorno all’altro immensamente ricchi. L’improvviso benessere di questi nativi americani attirò l’interesse dei bianchi che iniziarono a manipolare, estorcere e sottrarre con l’inganno i beni degli Osage fino a ricorrere all’omicidio. Una storia d’amore e tradimenti, delitti e misteri in un intrigo avvincente per la scoperta della verità.','https://mr.comingsoon.it/imgdb/locandine/235x336/58030.jpg','2023-10-19','206','Apple Studios, Imperative Entertainment','200','3');
INSERT INTO film VALUES('31','Spider-Man: Across the Spider-Verse','Dopo essersi riunito con Gwen Stacy, l''amichevole Spider-Man di Brooklyn Miles Morales viene catapultato nelle pieghe del multiverso, dove incontra la squadra di Spider-Eroi incaricata di proteggerne l''esistenza. Ma quando i protettori del multiverso si dimostrano intransigenti sul modo migliore per affrontare una nuova e temibile minaccia, Miles si ritrova solo contro gli altri Spider-Eroi a difendere il suo punto di vista. Tutto, pur di salvare la persona che ama di più al mondo.','https://www.tvtime.com/_next/image?url=https%3A%2F%2Fartworks.thetvdb.com%2Fbanners%2Fv4%2Fmovie%2F132814%2Fposters%2F64970a82669f4.jpg&w=256&q=75','2023-06-01','140','Sony Pictures Entertainment','200','10');
INSERT INTO film VALUES('32','Il Ragazzo e l''Airone','Spinto dal desiderio di rivedere sua madre, Mahito, un ragazzo di 12 anni, si avventura in un regno abitato dai vivi e dai morti. un luogo fantastico dove la morte finisce e la vita trova un nuovo inizio.','https://www.tvtime.com/_next/image?url=https%3A%2F%2Fartworks.thetvdb.com%2Fbanners%2Fv4%2Fmovie%2F295917%2Fposters%2F6592117309ef9.jpg&w=256&q=75','2024-01-24','125','Studio Ghibli','100','10');
INSERT INTO film VALUES('33','Il castello errante di Howl','Sophie ha diciotto anni e ogni giorno lavora instancabilmente nel negozio di cappelli del suo defunto padre. Un giorno, durante una rara escursione in città, per caso incontra il Mago Howl. Howl è ardito e bello, ma come tutti i maghi un po''smidollato. La Strega della Spazzatura, equivocando la natura del loro rapporto, getta una maledizione su Sophie, trasformandola in una novantenne rugosa. Sophie va via di casa e girovaga in una distesa desolata dove per caso entra nel castello mobile di Howl. Nascondendo la sua identità, diventa la donna delle pulizie. La vecchia petulante Sophie rimette a posto la casa, con molto piů brio di quanto ne avesse in origine. Cosa farà Sophie e cosa capiterà tra lei e Howl?','https://www.tvtime.com/_next/image?url=https%3A%2F%2Fartworks.thetvdb.com%2Fbanners%2Fv4%2Fmovie%2F573%2Fposters%2F6447a14d06caa.jpg&w=256&q=75','2005-09-09','119','Studio Ghibli','2.4','10');
INSERT INTO film VALUES('34','La città incantata','La piccola Chihiro non sopporta l''idea di traslocare e di perdere i propri amici, ma non può far niente per impedirlo. Proprio quando la famiglia è in viaggio verso la nuova casa, il padre imbocca una strada sterrata che termina davanti a un tunnel misterioso. I genitori sceglieranno di attraversarlo nonostante le rimostranze di Chihiro, per giungere a un parco dei divertimenti abbandonato, almeno apparentemente.','https://www.tvtime.com/_next/image?url=https%3A%2F%2Fartworks.thetvdb.com%2Fbanners%2Fv4%2Fmovie%2F276%2Fposters%2F6427ecce632ff.jpg&w=256&q=75','2003-04-18','122','Studio Ghibli','19','10');
INSERT INTO film VALUES('35','Principessa Mononoke','In seguito allo scontro con un animale posseduto da un demone il principe Ashitaka viene contaminato da una maledizione mortale. Si mette dunque in viaggio per scoprirne l''origine e chiedere una cura al grande Dio Bestia, l''unico in grado di guarirlo. Arrivato nelle regioni da cui proveniva la bestia scopre una guerra tra uomini e una forma primitiva di animali della foresta, giganti, senzienti e aiutati da quella che chiamano la Principessa Spettro, una ragazza cresciuta dai lupi che ha rinnegato gli uomini. Dall''altra parte gli uomini, capitanati da Lady Eboshi che gestisce con amore, giustizia e pietà il suo villaggio di fabbri, vogliono lavorare la montagna e abbattere gli alberi per poter estrarre il ferro (fonte di ricchezza). In mezzo un gruppo di monaci cerca di fomentare gli uomini ad uccidere il Dio Bestia e rubarne la testa perchè, si dice, fornisca l''eterna giovinezza.','https://www.tvtime.com/_next/image?url=https%3A%2F%2Fartworks.thetvdb.com%2Fbanners%2Fv4%2Fmovie%2F791%2Fposters%2F64479af734c5b.jpg&w=256&q=75','2000-03-19','134','Studio Ghibli','19','10');
INSERT INTO film VALUES('36','Il Signore degli Anelli: La Compagnia dell''Anello','Bilbo Baggins ha deciso di celebrare il suo centoundicesimo compleanno in maniera molto particolare; alla fine della festa, abbandona parenti, amici, conoscenti e il suo affezionato nipote Frodo, cui lascia ogni cosa. Lo stregone Gandalf insiste perché lo hobbit lasci a Frodo anche il suo anello magico, su cui intende tenere un occhio vigile e fare alcune ricerche, perché potrebbe celare un mistero più inquietante di quanto non sembri. E così è; quello di Bilbo è l''Unico Anello, l''Anello per domarli, il cuore del potere del malefico Signore Oscuro Sauron, che sta tornando a tessere le sue trame di conquista e distruzione. Per impedirgli di vedere realizzato il suo sanguinoso disegno, l''anello dovrà essere distrutto, cosa possibile soltanto nella fornace di Monte Fato, dove Sauron, secoli prima, lo forgiò.','https://mr.comingsoon.it/imgdb/locandine/235x336/1029.jpg','2002-01-18','178','New Line Cinema, The Saul Zaentz Company','93','7');
INSERT INTO film VALUES('37','Il Signore degli Anelli - Le Due Torri','La Compagnia dell''Anello è divisa, e ogni speranza è riposta ora in Frodo e Sam, che stanno tentando di attraversare non visti i confini di Mordor, tallonati dall''infido Gollum: Aragorn, Gimli e Legolas sono invece sulle tracce di Merry e Pipino, rapiti dagli Uruk-Hai di Saruman e in grave pericolo di vita. Attraverso alterne vicende, raggiungeranno la terra di Rohan e aiuteranno il Re Theoden nella sua guerra contro il traditore Saruman...','https://mr.comingsoon.it/imgdb/locandine/235x336/1031.jpg','2003-01-16','179','New Line Cinema, The Saul Zaentz Company','94','7');
INSERT INTO film VALUES('38','Il Signore degli Anelli - Il Ritorno del Re','Mentre Frodo e Sam, accompagnati da Gollum, proseguono il loro viaggio verso Monte Fato per distruggere l''anello, il resto della compagnia corre in soccorso di Rohan e Gondor, impegnati nella battaglia dei Campi del Pellenor.','https://img.frasicelebri.it/images/thumb_movie-il-signore-degli-anelli-il-ritorno-del-re.233x330_q95_box-0,0,350,518.jpg','2004-01-22','201','New Line Cinema, The Saul Zaentz Company','94','7');
INSERT INTO film VALUES('39','Lo Hobbit: Un viaggio inaspettato','Gandalf riunisce tredici nani e convince l''hobbit Bilbo Baggins ad aggregarsi al gruppo e lasciare la tranquillità del suo villaggio. La compagnia intraprende un viaggio nella Terra di Mezzo, riportando i nani nell''antico regno.','https://www.tvtime.com/_next/image?url=https%3A%2F%2Fartworks.thetvdb.com%2Fbanners%2Fv4%2Fmovie%2F138%2Fposters%2F6625653e4a430.jpg&w=256&q=75','2012-12-13','166','Metro-Goldwyn-Mayer, New Line Cinema','180','7');
INSERT INTO film VALUES('40','Lo Hobbit: La desolazione di Smaug','Bilbo Baggins e la compagnia devono sfidare Smaug, il drago dormiente della Montagna Solitaria che fa la guardia al tesoro dei nani.','https://mr.comingsoon.it/imgdb/locandine/235x336/49245.jpg','2013-12-12','161','Metro-Goldwyn-Mayer, New Line Cinema','200','7');
INSERT INTO film VALUES('41','Lo Hobbit: La Battaglia delle Cinque Armate','Il drago Smaug, infuriato per il tentativo di uccisione da parte del nano Thorin Scudodiquercia, attacca Pontelagolungo. Il governatore della città tenta di fuggire portando con sè tutto l''oro possibile. Nel frattempo Bard riesce a scappare dalla prigione dove era stato rinchiuso e con l''aiuto del figlio Bain, combatte contro l''invasore.','https://www.tvtime.com/_next/image?url=https%3A%2F%2Fartworks.thetvdb.com%2Fbanners%2Fv4%2Fmovie%2F30%2Fposters%2F662e95d616e6f.jpg&w=256&q=75','2014-09-17','144','Metro-Goldwyn-Mayer, New Line Cinema','300','7');
INSERT INTO film VALUES('42','Green Book','Nel 1962, dopo la chiusura di uno dei migliori club di New York in cui lavorava, il buttafuori italoamericano Tony Lip deve a tutti i costi trovare un lavoro per mantenere la sua famiglia. Accetta di lavorare per il pianista afroamericano Don Shirley e decide di seguirlo in tour nel sud degli Stati Uniti. Nonostante le differenze e gli iniziali contrasti, tra i due si instaurerà una forte amicizia.','https://www.tvtime.com/_next/image?url=https%3A%2F%2Fartworks.thetvdb.com%2Fbanners%2Fv4%2Fmovie%2F32%2Fposters%2F64fc1c37d8a21.jpg&w=256&q=75','2019-01-31','130','DreamWorks, Participant Media','23','3');
INSERT INTO film VALUES('43','La promessa dell''assassino','Il misterioso e ruvido Nikolai è legato ad una delle più note famiglie criminali di Londra. Nikolai gestisce la sua vita in maniera attenta e metodica; tutto questo viene però sconvolto quando sulla strada di Nikolai appare Anna, un''ostetrica che vuole indagare sulla mistero che circonda una sua paziente, una prostituta morta durante il parto. Nel corso delle sue ricerche Anna scopre accidentalmente delle prove compromettenti per la famiglia cui Nikolai è legato. L’incontro con Anna scatenerà una serie di delitti, menzogne e ricompense, con Nikolai a fare da perno a tutti gli avvenimenti.','https://mr.comingsoon.it/imgdb/locandine/235x336/872.jpg','2007-12-14','100','Serendipity Point Films, BBC Films','50','3');
INSERT INTO film VALUES('44','The Dead Don''t Hurt - I morti non soffrono','The Dead Don''t Hurt - I morti non soffrono, il film diretto da Viggo Mortensen, si svolge negli Stati Uniti nel 1860, un anno prima dell''inizio della Guerra Civile.
Vivienne Le Coudy (Vicky Krieps) è una donna franco-canadese che si guadagna da vivere vendendo fiori a San Francisco. Quando incontra il falegname danese Holger Olsen (Viggo Mortensen), i due si innamorano ma lei si rifiuta di sposarlo, rimanendo fedele alla sua natura indipendente. Decidono però di andare a vivere insieme a Elk Flats, nel Nevada.
La vita scorre tranquilla, tra lavoro e altre occupazioni quotidiane, fino a quando Holger decide di partire a combattere per l''Unione nella Guerra Civile. La coppia deve separarsi e Vivienne si trova a dover provvedere a se stessa in un clima ostile e corrotto a causa dei crescenti conflitti.
È una donna sola, bersaglio preferito di uomini avidi e potenti, ma la sua forza e la sua determinazione la aiutano a difendersi...','https://m.media-amazon.com/images/M/MV5BZjc1OTM5ZDAtNDBiYS00M2VkLTk0ODUtZGQ1Nzk1NGYwODVhXkEyXkFqcGc@._V1_.jpg','2024-10-24','129','Talipot Studio, Recorded Picture Company','20','3');
INSERT INTO film VALUES('45','A Dangerous Method','Alla vigilia della Prima Guerra Mondiale, Zurigo e Vienna sono lo scenario di una torbida storia di avvincenti scoperte in nuovi territori della sessualità e dell''intelletto. Ispirato a fatti realmente accaduti, A Dangerous Method getta lo sguardo sulla turbolenta relazione fra il giovane psichiatra Carl Gustav Jung, il suo mentore Sigmund Freud e Sabina Spielrein, la bella e tormentata giovane donna che viene a interporsi tra loro. Nell''intreccio è coinvolto anche Otto Gross, un paziente incline alla depravazione e determinato a spingersi ben oltre i confini della morale comune. In questa esplorazione della sensualità, l''ambizione e l''inganno preparano la scena per il momento cruciale in cui Jung, Freud e Sabina si incontrano e si separano, cambiando per sempre il corso del pensiero moderno.','https://mr.comingsoon.it/imgdb/locandine/235x336/47971.jpg','2011-09-30','93','Lago Film','14','3');
INSERT INTO film VALUES('46','A History of Violence','Tom vive e lavora in una piccola cittadina, ma un giorno uccide due rapinatori per legittima difesa. L''opinione pubblica ne fa una specie di eroe nazionale, ma alcune peersone cominciano a pensare che l''uomo sia un loro collega scomparso anni prima.','https://www.tvtime.com/_next/image?url=https%3A%2F%2Fartworks.thetvdb.com%2Fbanners%2Fv4%2Fmovie%2F2267%2Fposters%2F657c752d169b7.jpg&w=256&q=75','2005-12-16','95','New Line Productions','32','3');
INSERT INTO film VALUES('47','Inception','Dom Cobb possiede una qualifica speciale: è in grado di inserirsi nei sogni altrui per prelevare i segreti nascosti nel più profondo del subconscio. Viene contattato da Saito, un potentissimo industriale giapponese.','https://www.tvtime.com/_next/image?url=https%3A%2F%2Fartworks.thetvdb.com%2Fbanners%2Fmovies%2F113%2Fposters%2F2195447.jpg&w=256&q=75','2010-09-24','148','Syncopy, Warner Bros. Pictures','160','6');
INSERT INTO film VALUES('48','A Quiet Place II','La famiglia Abbott affronta i terrori del mondo esterno. Costretti ad avventurarsi nell''ignoto, i membri della famiglia si rendono conto che le creature che cacciano dal suono non sono le uniche minacce che si nascondono oltre il sentiero di sabbia.','https://www.tvtime.com/_next/image?url=https%3A%2F%2Fartworks.thetvdb.com%2Fbanners%2Fv4%2Fmovie%2F40102%2Fposters%2F614e4f221aea4.jpg&w=256&q=75','2021-06-24','96','Paramount Pictures, Platinum Dunes','61','5');
INSERT INTO film VALUES('49','A Quiet Place - Un posto tranquillo','Tagliata fuori dal resto del mondo, una famiglia unita vive nella costante paura di emettere qualsiasi suono che possa attirare terrificanti creature aliene.','https://mr.comingsoon.it/imgdb/locandine/235x336/54526.jpg','2018-04-05','90','Platinum Dunes, Sunday Night','17','5');
INSERT INTO film VALUES('50','Dunkirk','L''esercito inglese, impegnato a liberare le truppe alleate dalla Francia occupata dai nazisti, resta intrappolato sulla spiaggia con le spalle al mare e devone affrontare una situazione impossibile mentre il nemico avanza.','https://www.tvtime.com/_next/image?url=https%3A%2F%2Fartworks.thetvdb.com%2Fbanners%2Fmovies%2F424%2Fposters%2F424.jpg&w=256&q=75','2017-08-31','106','Syncopy, Warner Bros.','150','3');
INSERT INTO film VALUES('51','Pulp Fiction','I destini di un killer con la passione per gli hamburger, della sua compagna e di un pugile in declino s''intrecciano in questa cruenta pellicola di Quentin Tarantino.','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCqzGSUVlP74iyuFujryxWBYV6yqGirkn7BFHIJXEMzS4gNI-Z2wEKZsW6dLYA9B77BgyPdg','1994-12-16','153','A Band Apart, Jersey Films, Miramax Films','8','8');
INSERT INTO film VALUES('52','Sophia!','Documentario racconta Sophia Loren come mai prima, mettendo insieme con passione e cura archivi straordinari che mostrano un ritratto inedito dell’attrice nata a Roma. Un viaggio alla scoperta del mito di un’attrice unica, e della sua vita, narrata da lei stessa in prima persona, attraverso materiali di repertorio, foto rarissime, filmati inediti, interviste radiofoniche e televisive, italiane ed internazionali.','https://movieplayer.net-cdn.it/t/images/2022/09/01/sophia_jpg_320x0_crop_q85.jpg','2022-09-20','100','Rai Documentari','2','11');
INSERT INTO film VALUES('53','La La Land','Un musicista jazz e un''aspirante attrice si innamorano mentre sono entrambi impegnati a inseguire le proprie ambizioni e i propri sogni, ma le cose cambiano non appena cominciano a raggiungere il successo.','https://www.tvtime.com/_next/image?url=https%3A%2F%2Fartworks.thetvdb.com%2Fbanners%2Fv4%2Fmovie%2F139%2Fposters%2F637096fb47a60.jpg&w=256&q=75','2017-01-26','128','Black Label Media, Gilbert Films','30','12');
INSERT INTO film VALUES('54','Pearl','Bloccata nell’isolata fattoria di famiglia, Pearl deve prendersi cura del padre malato sotto lo sguardo amaro e dispotico di una madre molto religiosa. Pearl desidera intensamente una vita eccitante come quella vista nei film. L''ambizione della donna sfocia presto nella pazzia, portandola a compiere crimini orribili, proprio mentre tenta una carriera nel mondo dello spettacolo.','https://www.tvtime.com/_next/image?url=https%3A%2F%2Fartworks.thetvdb.com%2Fbanners%2Fv4%2Fmovie%2F338580%2Fposters%2F648db34c42636.jpg&w=256&q=75','2023-09-07','102','A24, Bron Creative, Little Lamb','1','5');
INSERT INTO film VALUES('55','Soul','Joe, direttore di una banda musicale delle scuole medie, sogna di suonare all''Half Note, un prestigioso locale di New York. Dopo 20 anni di tentativi, finalmente riesce a ottenere una serata. Tuttavia, un colpo di scena rovina i suoi piani.','https://mr.comingsoon.it/imgdb/locandine/235x336/57992.jpg','2024-04-11','100','Pixar Animation Studios, Walt Disney Pictures','150','10');
INSERT INTO film VALUES('56','Jojo Rabbit','Durante la Seconda Guerra Mondiale, un ragazzino tedesco scopre che sua madre nasconde una giovane ebrea nella loro soffitta. Aiutato dal suo unico amico immaginario Adolf Hitler, Jojo deve fare i conti con il proprio cieco ed infantile nazionalismo.','https://mr.comingsoon.it/imgdb/locandine/235x336/56867.jpg','2020-01-16','108','Fox Searchlight Pictures','14','4');
INSERT INTO film VALUES('57','10 cose che odio di te','Bianca e Katarina sono due ragazze il cui padre (ostetrico che ha visto troppe gravidanze indesiderate passare sotto i suoi occhi) impedisce loro di uscire con i coetanei. Se questo alla rude Kat non dispiace per nulla, pesa invece molto a Bianca. Soprattutto quando arriva in città Cameron James che si innamora di lei immediatamente ricambiato. Considerato che ora il padre ha imposto un nuovo vincolo (Bianca potrà uscire con un ragazzo solo dopo che Kat lo avrà fatto) bisogna mettere in atto un piano perché qualcuno sia disposto a corteggiarla e perché lei ceda.','https://m.media-amazon.com/images/I/61X06P2ekEL._AC_UF1000,1000_QL80_.jpg','1999-08-27','98','Touchstone Pictures','13','9');
INSERT INTO film VALUES('58','Titanic','Rose ha diciassette anni, una madre egoista, un fidanzato facoltoso e una vita pianificata. Imbarcata sul Titanic e insoddisfatta della propria subalternità al futuro sposo incontra Jack, romantico disegnatore della terza classe che ha vinto a poker un biglietto per l''America. Contro le convenzioni e il destino, che chiederà il conto in una notte senza luna, Rose e Jack si innamorano, spiegando il loro spirito come i motori del più grande transatlantico del mondo. Lanciato nella sua prima traversata oceanica il Titanic è colpito al cuore da un iceberg, ''affondando' 'millecinquecento persone e il futuro dei due giovani amanti. Ottantaquattro anni dopo l''ultracentenaria Rose, scampata al naufragio e sopravvissuta a Jack, racconterà a un gruppo di scienziati la meraviglia di un amore interclassista e la stupidità di un mondo diviso in classi. Un mondo che il Titanic inabisserà in un oceano nero il 15 aprile del 1912.','https://www.tvtime.com/_next/image?url=https%3A%2F%2Fartworks.thetvdb.com%2Fbanners%2Fv4%2Fmovie%2F231%2Fposters%2F642d748b22859.jpg&w=256&q=75','1998-01-16','195','Lightstorm Entertainment','200','9');
INSERT INTO film VALUES('59','Megalopolis','Cesar, un architetto di New York, ha un piano utopistico per ricostruire la città, totalmente distrutta da una catastrofe, in un modo del tutto nuovo e innovativo. Il suo sogno, però, è ostacolato dal sindaco di NYC, Frank Cicero, corrotto e conservatore. La figlia di questi, Julia, che cerca di emanciparsi dalla situazione di privilegio e oppressione in cui è nata, si ritrova presto fra due fuochi in quanto affezionata al padre ma innamorata del progettista.','https://www.multisalacorso.com/wp-content/uploads/2024/10/MEGALOPOLIS_1080x1920_9x16.jpg','2024-10-16','138','American Zoetrope','120','6');
INSERT INTO film VALUES('60','Uncharted','Nathan Drake e il suo compagno di avventure Sully si lanciano in una pericolosa ricerca per trovare il più grande tesoro perduto, mentre seguono anche gli indizi che potrebbero portare al fratello di Nathan, scomparso da tempo.','https://mr.comingsoon.it/imgdb/locandine/235x336/50817.jpg','2022-02-17','116','Sony Computer Entertainment America','120','2');

//inserimento di Attori
INSERT INTO attore 
VALUES
    ('1','Margot', 'Robbie', '1990-07-02','https://static2.amica.it/wp-content/uploads/2023/08/AMICARCS_20230804112136213_202d2c3412a893b2aed9156e58fb0f2f1-1-635x967.jpg', 'Margot Robbie è un attrice e produttrice australiana, conosciuta per i suoi ruoli in film come "The Wolf of Wall Street", "Suicide Squad" e "Tonya".'),
    
    ('2','Robert', 'Downey Jr.', '1965-04-04','https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Robert_Downey_Jr_2014_Comic_Con_%28cropped%29.jpg/1200px-Robert_Downey_Jr_2014_Comic_Con_%28cropped%29.jpg', 'Robert Downey Jr. è un attore e produttore americano, famoso per il suo ruolo di Iron Man nel Marvel Cinematic Universe e per film come "Sherlock Holmes" e "Chaplin".'),
    
    ('3','Johnny', 'Depp', '1963-06-09', 'https://upload.wikimedia.org/wikipedia/commons/2/21/Johnny_Depp_2020.jpg','Johnny Depp è un attore, produttore e musicista americano, noto per i suoi ruoli eclettici in film come "Pirati dei Caraibi", "Edward mani di forbice" e "La fabbrica di cioccolato".'),
    
    ('4','Benedict', 'Cumberbatch', '1976-07-19', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/BCumberbatch_Comic-Con_2019.jpg/220px-BCumberbatch_Comic-Con_2019.jpg', 'Benedict Cumberbatch è un attore britannico, riconosciuto per le sue interpretazioni in "Sherlock", "Doctor Strange" nel Marvel Cinematic Universe e "The Imitation Game".');

// relazione attore film
INSERT INTO film_attore VALUES('1','3','1'); 
INSERT INTO film_attore VALUES('2','11','1'); 
INSERT INTO film_attore VALUES('3','12','1'); 
INSERT INTO film_attore VALUES('4','13','1'); 
INSERT INTO film_attore VALUES('5','14','1'); 
INSERT INTO film_attore VALUES('6','15','1'); 
INSERT INTO film_attore VALUES('7','1','2');
INSERT INTO film_attore VALUES('8','2','2');
INSERT INTO film_attore VALUES('9','4','3');
INSERT INTO film_attore VALUES('10','8','3');
INSERT INTO film_attore VALUES('11','9','3');
INSERT INTO film_attore VALUES('12','1','4');
INSERT INTO film_attore VALUES('13','5','4');
INSERT INTO film_attore VALUES('14','28','2'); 
INSERT INTO film_attore VALUES('14','28','2'); 
////