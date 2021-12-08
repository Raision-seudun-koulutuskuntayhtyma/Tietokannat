INSERT INTO Vuokraus.dbo.asiakas (yritys,laskutusosoite,postinumero,postitoimipaikka) VALUES
	 (N'Raseko',N'Purokatu 1',N'21200',N'Raisio'),
	 (N'Mähönen Oy',N'Kuormakatu 2',N'21200',N'Raisio'),
	 (N'Autoliike Petos & Vilppi Ky',N'Keskuskatu 22',N'23100',N'Mynämäki'),
	 (N'Huttu ja keitto Ay',N'Puoskarinkatu 2 A 11',N'20100',N'Turku');INSERT INTO Vuokraus.dbo.tuote (tuoteryhma,nimike,merkki,Malli,paivavuokra) VALUES
	 (N'Sähkötyökalut',N'Akkuporakone',N'Bosch',N'GX120',8.0),
	 (N'Nostimet',N'Henkilönostin',N'Dino',N'1200',60.0),
	 (N'Telineet',N'Taso',N'Protools',N'100 x 300',3.0),
	 (N'Sähkötyökalut',N'Poravasara',N'Kangoo',N'Bx100',12.0),
	 (N'Sähkötyökalut',N'Akkuporakone',N'Makita',N'DC24-7',10.0);INSERT INTO Vuokraus.dbo.tuoteryhma (tuoteryhma) VALUES
	 (N'Nostimet'),
	 (N'Sähkötyökalut'),
	 (N'Telineet');INSERT INTO Vuokraus.dbo.vuokraus (asiakasnumero,yksilointikoodi,alkamispaiva,paattymispaiva) VALUES
	 (1,2,'2021-09-15 00:00:00.0','2021-09-22 00:00:00.0'),
	 (2,1,'2021-09-16 00:00:00.0','2021-09-17 00:00:00.0'),
	 (1,3,'2021-09-29 00:00:00.0','2021-10-05 00:00:00.0'),
	 (4,2,'2021-09-27 00:00:00.0','2021-09-29 00:00:00.0'),
	 (1,4,'2021-09-15 00:00:00.0','2021-09-25 00:00:00.0'),
	 (1,1,'2021-08-10 00:00:00.0','2021-08-20 00:00:00.0'),
	 (1,5,'2021-09-10 00:00:00.0','2021-09-15 00:00:00.0'),
	 (2,3,'2021-09-30 00:00:00.0','2021-10-06 00:00:00.0');INSERT INTO Vuokraus.dbo.yhteyshenkilo (yhteystyyppi,etunimi,sukunimi,puhelin,sahkoposti,asiakasnumero) VALUES
	 (N'Laskutus',N'Mikko',N'Karilainen',N'044 705 7473',N'mikko.karilainen@raseko.fi',1),
	 (N'Toimitus',N'Mika',N'Hakala',N'077 705 7420',N'mika.hakala@raseko.fi',1);INSERT INTO Vuokraus.dbo.yhteystyyppi (yhteystyyppi) VALUES
	 (N'Laskutus'),
	 (N'Toimitus');