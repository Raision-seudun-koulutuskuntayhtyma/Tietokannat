
CREATE TABLE  "tyokalu" (
	"tyokalukoodi"	SERIAL,
	"nimike"	CHARACTER VARYING NOT NULL,
	"merkki"	CHARACTER VARYING NOT NULL,
	"malli"	CHARACTER VARYING NOT NULL,
	"paivavuokra"	REAL NOT NULL,
	CONSTRAINT tyokalu_pk PRIMARY KEY("tyokalukoodi")
);
CREATE TABLE "asiakas" (
	"asiakasnumero"	SERIAL PRIMARY KEY,
	"yrityksen_nimi"	CHARACTER VARYING NOT NULL CHECK("yrityksen_nimi" <> ''),
	"laskutusosoite"	CHARACTER VARYING NOT NULL,
	"postinumero"	CHARACTER VARYING NOT NULL,
	"postitoimipaikka"	CHARACTER VARYING NOT NULL,
	
);
INSERT INTO "tyokalu" ("tyokalukoodi","nimike","merkki","malli","paivavuokra") VALUES (1,'Akkuporakone','Bosch','RX 100',34);
INSERT INTO "tyokalu" ("tyokalukoodi","nimike","merkki","malli","paivavuokra") VALUES (2,'Rakennuslaser','Huapar','D903','12,50');
INSERT INTO "tyokalu" ("tyokalukoodi","nimike","merkki","malli","paivavuokra") VALUES (3,'Akkuporakone','AEG','BS12C2','9,50');
INSERT INTO "tyokalu" ("tyokalukoodi","nimike","merkki","malli","paivavuokra") VALUES (4,'Betonimylly','ABM','P135',32);
INSERT INTO "tyokalu" ("tyokalukoodi","nimike","merkki","malli","paivavuokra") VALUES (9,'Maaliruisku','Wagner','Control Pro 250 M',15);
INSERT INTO "asiakas" ("asiakasnumero","yrityksen_nimi","laskutusosoite","postinumero","postitoimipaikka") VALUES (1,'Mähönen Oy','Eeronkuja 3','21200','Raisio');
INSERT INTO "asiakas" ("asiakasnumero","yrityksen_nimi","laskutusosoite","postinumero","postitoimipaikka") VALUES (2,'Autoliike Petos & Vilppi','Kuormakatu 2','21200','Raisio');
INSERT INTO "asiakas" ("asiakasnumero","yrityksen_nimi","laskutusosoite","postinumero","postitoimipaikka") VALUES (3,'Susi & Sekunda Ky','Viertotie 5','23100','Mynämäki');
INSERT INTO "asiakas" ("asiakasnumero","yrityksen_nimi","laskutusosoite","postinumero","postitoimipaikka") VALUES (4,'Vuorio & Hömppä Oy','Kuusitie 8','20100','Turku');
INSERT INTO "asiakas" ("asiakasnumero","yrityksen_nimi","laskutusosoite","postinumero","postitoimipaikka") VALUES (5,'Tommi Turmiola Oy','Vahinkotie 2','00100','Helsinki');
INSERT INTO "asiakas" ("asiakasnumero","yrityksen_nimi","laskutusosoite","postinumero","postitoimipaikka") VALUES (6,'Suurtakala Oyj','Koulutie 22','00100','Helsinki');
COMMIT;
