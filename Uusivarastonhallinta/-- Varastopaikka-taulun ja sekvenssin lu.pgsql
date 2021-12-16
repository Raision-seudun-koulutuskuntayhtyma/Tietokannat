-- Varastopaikka-taulun ja sekvenssin luominen
CREATE SEQUENCE public.varastopaikka_varastopaikka_id_seq;

CREATE TABLE public.varastopaikka (
                varastopaikka_id INTEGER NOT NULL DEFAULT nextval('public.varastopaikka_varastopaikka_id_seq'),
                varastopaikan_ni VARCHAR(30) NOT NULL,
                kp_tilinumero VARCHAR(20) NOT NULL,
                CONSTRAINT varastopaikka_pk PRIMARY KEY (varastopaikka_id)
);

ALTER SEQUENCE public.varastopaikka_varastopaikka_id_seq OWNED BY public.varastopaikka.varastopaikka_id;

-- Hyllypaikka-taulun luominen
CREATE SEQUENCE public.hyllypaikka_hyllypaikka_id_seq;
CREATE TABLE public.hyllypaikka (
                hyllypaikka_id INTEGER NOT NULL DEFAULT nextval(public.hyllypaikka_hyllypaikka_id_seq),
                varastopaikka_id INTEGER NOT NULL,
                hyllynumero VARCHAR(3) NOT NULL,
                vali VARCHAR(3) NOT NULL,
                taso VARCHAR(3) NOT NULL,
                CONSTRAINT hyllypaikka_pk PRIMARY KEY (hyllypaikka_id)
);
ALTER SEQUENCE public.hyllypaikka_hyllypaikka_id_seq OWNED BY public.hyllypaikka.hyllypaikka_id;

-- Varastotapahtuma-taulun ja sekvenssin luominen
CREATE SEQUENCE public.varastotapahtuma_tapahtumaid_seq;

CREATE TABLE public.varastotapahtuma (
                tapahtumaid INTEGER NOT NULL DEFAULT nextval('public.varastotapahtuma_tapahtumaid_seq'),
                asiakasnumero INTEGER NOT NULL,
                yksilointikoodi INTEGER NOT NULL,
                maara REAL NOT NULL,
                yksikko VARCHAR(4) DEFAULT kpl NOT NULL,
                lahdevarasto_id INTEGER NOT NULL,
                kohdevarasto_id INTEGER NOT NULL,
                hyllypaikka_id INTEGER NOT NULL,
                paivamaara DATE NOT NULL,
                CONSTRAINT varastotapahtuma_pk PRIMARY KEY (tapahtumaid)
);


ALTER SEQUENCE public.varastotapahtuma_tapahtumaid_seq OWNED BY public.varastotapahtuma.tapahtumaid;

-- Luodaan Hyllypaikka-tauluun viiteavain 
ALTER TABLE public.hyllypaikka ADD CONSTRAINT varastopaikka_hyllypaikka_fk
FOREIGN KEY (varastopaikka_id)
REFERENCES public.varastopaikka (varastopaikka_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

-- Luodaan Varastotapahtumatauluun viiteavaimet

-- Viitaukset Varastopaikka-tauluun:
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

-- Viitaukset Hyllypaikka-tauluun:
ALTER TABLE public.varastotapahtuma ADD CONSTRAINT hyllypaikka_varastotapahtuma_fk
FOREIGN KEY (hyllypaikka_id)
REFERENCES public.hyllypaikka (hyllypaikka_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

-- Viitaukset Tuote-tauluun:
ALTER TABLE public.varastotapahtuma ADD CONSTRAINT tuote_varastotapahtuma_fk
FOREIGN KEY (yksilointikoodi)
REFERENCES public.tuote (yksilointikoodi)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

-- Viitaukset Asiakas-tauluun:
ALTER TABLE public.varastotapahtuma ADD CONSTRAINT asiakas_varastotapahtuma_fk
FOREIGN KEY (asiakasnumero)
REFERENCES public.asiakas (asiakasnumero)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;