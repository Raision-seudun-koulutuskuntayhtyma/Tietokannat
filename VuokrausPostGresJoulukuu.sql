
CREATE TABLE public.tuoteryhma (
                tuoteryhma VARCHAR(20) NOT NULL,
                CONSTRAINT tuoteryhma_pk PRIMARY KEY (tuoteryhma)
);


CREATE SEQUENCE public.tuote_yksilointikoodi_seq;

CREATE TABLE public.tuote (
                yksilointikoodi INTEGER NOT NULL DEFAULT nextval('public.tuote_yksilointikoodi_seq'),
                tuoteryhma VARCHAR(20) NOT NULL,
                nimike VARCHAR(40) NOT NULL,
                merkki VARCHAR(20) NOT NULL,
                Malli VARCHAR(20) NOT NULL,
                paivavuokra REAL NOT NULL,
                CONSTRAINT tuote_pk PRIMARY KEY (yksilointikoodi)
);


ALTER SEQUENCE public.tuote_yksilointikoodi_seq OWNED BY public.tuote.yksilointikoodi;

CREATE TABLE public.yhteystyyppi (
                yhteystyyppi VARCHAR(20) NOT NULL,
                CONSTRAINT yhteystyyppi_pk PRIMARY KEY (yhteystyyppi)
);
COMMENT ON COLUMN public.yhteystyyppi.yhteystyyppi IS 'Taulu on luotu vain käyttöliittymää varten. Se estää käyttäjää syöttämästä Yhteyshenkilö-tauluun muita kuin ennalta määrättyjä arvoja.';


CREATE SEQUENCE public.asiakas_asiakasnumero_seq;

CREATE TABLE public.asiakas (
                asiakasnumero INTEGER NOT NULL DEFAULT nextval('public.asiakas_asiakasnumero_seq'),
                yritys VARCHAR(30) NOT NULL,
                laskutusosoite VARCHAR(30) NOT NULL,
                postinumero VARCHAR(10) NOT NULL,
                postitoimipaikka VARCHAR(30) NOT NULL,
                CONSTRAINT asiakas_pk PRIMARY KEY (asiakasnumero)
);
COMMENT ON COLUMN public.asiakas.laskutusosoite IS 'Yrityksen laskujan katu- tai PL-osoite';


ALTER SEQUENCE public.asiakas_asiakasnumero_seq OWNED BY public.asiakas.asiakasnumero;

CREATE SEQUENCE public.tuote_tapahtumaid_seq;

CREATE TABLE public.vuokraus (
                tapahtumaid INTEGER NOT NULL DEFAULT nextval('public.tuote_tapahtumaid_seq'),
                asiakasnumero INTEGER NOT NULL,
                yksilointikoodi INTEGER NOT NULL,
                alkamispaiva DATE NOT NULL,
                paattymispaiva DATE NOT NULL,
                CONSTRAINT vuokraus_pk PRIMARY KEY (tapahtumaid)
);
COMMENT ON COLUMN public.vuokraus.tapahtumaid IS 'Dummy id tulevia käyttötarkoituksia varten';


ALTER SEQUENCE public.tuote_tapahtumaid_seq OWNED BY public.vuokraus.tapahtumaid;

CREATE SEQUENCE public.yhteyshenkilo_yhteyshenkilo_id_seq;

CREATE TABLE public.yhteyshenkilo (
                yhteyshenkilo_id INTEGER NOT NULL DEFAULT nextval('public.yhteyshenkilo_yhteyshenkilo_id_seq'),
                yhteystyyppi VARCHAR(20) NOT NULL,
                etunimi VARCHAR(20) NOT NULL,
                sukunimi VARCHAR(30) NOT NULL,
                puhelin VARCHAR(15),
                sahkoposti VARCHAR(40) NOT NULL,
                asiakasnumero INTEGER NOT NULL,
                CONSTRAINT yhteyshenkilo_pk PRIMARY KEY (yhteyshenkilo_id)
);
COMMENT ON COLUMN public.yhteyshenkilo.yhteyshenkilo_id IS 'Dummy perusavain. Tulevaisuuden tarpeita varten';
COMMENT ON COLUMN public.yhteyshenkilo.yhteystyyppi IS 'Taulu on luotu vain käyttöliittymää varten. Se estää käyttäjää syöttämästä Yhteyshenkilö-tauluun muita kuin ennalta määrättyjä arvoja.';


ALTER SEQUENCE public.yhteyshenkilo_yhteyshenkilo_id_seq OWNED BY public.yhteyshenkilo.yhteyshenkilo_id;

ALTER TABLE public.tuote ADD CONSTRAINT tuoteryhma_tuote_fk
FOREIGN KEY (tuoteryhma)
REFERENCES public.tuoteryhma (tuoteryhma)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.vuokraus ADD CONSTRAINT tuote_vuokraus_fk
FOREIGN KEY (yksilointikoodi)
REFERENCES public.tuote (yksilointikoodi)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.yhteyshenkilo ADD CONSTRAINT yhteystyyppi_yhteyshenkilo_fk
FOREIGN KEY (yhteystyyppi)
REFERENCES public.yhteystyyppi (yhteystyyppi)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.yhteyshenkilo ADD CONSTRAINT asiakas_yhteyshenkilo_fk
FOREIGN KEY (asiakasnumero)
REFERENCES public.asiakas (asiakasnumero)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.vuokraus ADD CONSTRAINT asiakas_vuokraus_fk
FOREIGN KEY (asiakasnumero)
REFERENCES public.asiakas (asiakasnumero)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
