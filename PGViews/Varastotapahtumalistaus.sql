--Kysely, joka näyttää tuotteiden, varastopaikkojen, asiakkaiden ja hyllyjen nimet selkokielisinä
-- Kysely on varastolistaus-näkymän luontia varten

SELECT public.varastotapahtuma.tapahtumaid,
    public.varastotapahtuma.paivamaara,
    public.varastotapahtuma.yksilointikoodi,
    public.tuote.nimike,
    public.tuote.merkki,
    public.tuote.malli,
    public.varastotapahtuma.maara, 
    public.varastotapahtuma.yksikko,
    public.varastotapahtuma.lahdevarasto_id,
    public.varastopaikka.varastopaikan_ni AS varastosta,
    public.varastotapahtuma.kohdevarasto_id,
    -- Varastopaikka-taulua käytetään toista kertaa -> alias vp ks. liitosehdot
    vp.varastopaikan_ni AS varastoon,
    public.hyllypaikka.hyllynumero || public.hyllypaikka.vali || public.hyllypaikka.taso AS sijainti,
    public.varastotapahtuma.asiakasnumero,
    public.asiakas.yritys
    
FROM 
-- Liitosehdot kaikkien käyteetyjen taulujen välillä:
public.tuote INNER JOIN public.varastotapahtuma
ON public.tuote.yksilointikoodi = public.varastotapahtuma.yksilointikoodi
INNER JOIN public.varastopaikka 
ON public.varastotapahtuma.lahdevarasto_id = public.varastopaikka.varastopaikka_id
-- Sisäliitos tehdään varastopaikka-taulun aliakseen vp
INNER JOIN public.varastopaikka AS vp ON public.varastotapahtuma.kohdevarasto_id = vp.varastopaikka_id
INNER JOIN public.asiakas ON public.varastotapahtuma.asiakasnumero = public.asiakas.asiakasnumero
INNER JOIN public.hyllypaikka ON public.varastotapahtuma.hyllypaikka_id = public.hyllypaikka.hyllypaikka_id