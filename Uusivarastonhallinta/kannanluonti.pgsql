-- kommentti

CREATE SEQUENCE public.varastopaikka_varastopaikka_id_seq;

CREATE TABLE public.varastopaikka (
                varastopaikka_id INTEGER NOT NULL DEFAULT nextval('public.varastopaikka_varastopaikka_id_seq'),
                varastopaikan_ni VARCHAR(30) NOT NULL,
                kp_tilinumero VARCHAR(20) NOT NULL,
                CONSTRAINT varastopaikka_pk PRIMARY KEY (varastopaikka_id)
);


ALTER SEQUENCE public.varastopaikka_varastopaikka_id_seq OWNED BY public.varastopaikka.varastopaikka_id;

CREATE SEQUENCE public.hyllypaikka_hyllypaikka_id_seq;

CREATE TABLE public.hyllypaikka (
                hyllypaikka_id INTEGER NOT NULL DEFAULT nextval('public.hyllypaikka_hyllypaikka_id_seq'),
                varastopaikka_id INTEGER NOT NULL,
                hyllynumero VARCHAR(3) NOT NULL,
                vali VARCHAR(3) NOT NULL,
                taso VARCHAR(3) NOT NULL,
                CONSTRAINT hyllypaikka_pk PRIMARY KEY (hyllypaikka_id)
);


ALTER SEQUENCE public.hyllypaikka_hyllypaikka_id_seq OWNED BY public.hyllypaikka.hyllypaikka_id;

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

CREATE SEQUENCE public.varastotapahtuma_tapahtumaid_seq;

CREATE TABLE public.varastotapahtuma (
                tapahtumaid INTEGER NOT NULL DEFAULT nextval('public.varastotapahtuma_tapahtumaid_seq'),
                asiakasnumero INTEGER NOT NULL,
                yksilointikoodi INTEGER NOT NULL,
                maara REAL NOT NULL,
                yksikko VARCHAR(4) DEFAULT 'kpl' NOT NULL,
                lahdevarasto_id INTEGER NOT NULL,
                kohdevarasto_id INTEGER NOT NULL,
                hyllypaikka_id INTEGER NOT NULL,
                paivamaara DATE NOT NULL,
                CONSTRAINT varastotapahtuma_pk PRIMARY KEY (tapahtumaid)
);


ALTER SEQUENCE public.varastotapahtuma_tapahtumaid_seq OWNED BY public.varastotapahtuma.tapahtumaid;

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

ALTER TABLE public.hyllypaikka ADD CONSTRAINT varastopaikka_hyllypaikka_fk
FOREIGN KEY (varastopaikka_id)
REFERENCES public.varastopaikka (varastopaikka_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.varastotapahtuma ADD CONSTRAINT varastopaikka_varastotapahtuma_fk
FOREIGN KEY (lahdevarasto_id)
REFERENCES public.varastopaikka (varastopaikka_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.varastotapahtuma ADD CONSTRAINT varastopaikka_varastotapahtuma_fk1
FOREIGN KEY (kohdevarasto_id)
REFERENCES public.varastopaikka (varastopaikka_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.varastotapahtuma ADD CONSTRAINT hyllypaikka_varastotapahtuma_fk
FOREIGN KEY (hyllypaikka_id)
REFERENCES public.hyllypaikka (hyllypaikka_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.tuote ADD CONSTRAINT tuoteryhma_tuote_fk
FOREIGN KEY (tuoteryhma)
REFERENCES public.tuoteryhma (tuoteryhma)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.varastotapahtuma ADD CONSTRAINT tuote_varastotapahtuma_fk
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

ALTER TABLE public.varastotapahtuma ADD CONSTRAINT asiakas_varastotapahtuma_fk
FOREIGN KEY (asiakasnumero)
REFERENCES public.asiakas (asiakasnumero)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;