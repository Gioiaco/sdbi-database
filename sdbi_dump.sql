--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4 (Postgres.app)
-- Dumped by pg_dump version 17.0

-- Started on 2025-03-27 12:06:04 CET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 222 (class 1259 OID 16478)
-- Name: biglietti; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.biglietti (
    id_biglietto integer NOT NULL,
    codice_pnr character varying NOT NULL,
    corsa_id integer NOT NULL,
    passegero_id integer NOT NULL,
    data_ora_acquisto timestamp without time zone NOT NULL,
    prezzo numeric NOT NULL,
    posto character varying NOT NULL
);


ALTER TABLE public.biglietti OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 24582)
-- Name: cambi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cambi (
    id_cambio integer NOT NULL,
    biglietto_id integer NOT NULL,
    ordine_cambio integer NOT NULL,
    corsa_partenza_id integer,
    corsa_arrivo_id integer,
    stazione_cambio_id integer NOT NULL,
    orario_arrivo_precedente timestamp without time zone NOT NULL,
    orario_partenza_successivo timestamp without time zone NOT NULL
);


ALTER TABLE public.cambi OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16445)
-- Name: corse; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.corse (
    id_corsa integer NOT NULL,
    tratta_id integer NOT NULL,
    treno_id integer NOT NULL,
    data_ora_partenza timestamp without time zone NOT NULL,
    data_ora_arrivo timestamp without time zone NOT NULL
);


ALTER TABLE public.corse OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16460)
-- Name: passeggeri; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.passeggeri (
    id_passeggero integer NOT NULL,
    nome character varying NOT NULL,
    cognome character varying NOT NULL,
    data_nascita date NOT NULL,
    email character varying NOT NULL
);


ALTER TABLE public.passeggeri OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16411)
-- Name: stazioni; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stazioni (
    id_stazione integer NOT NULL,
    nome_stazione character varying,
    citta character varying
);


ALTER TABLE public.stazioni OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16423)
-- Name: tratte; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tratte (
    id_tratta integer NOT NULL,
    stazione_partenza_id integer NOT NULL,
    stazione_di_arrivo_id integer NOT NULL,
    durata time with time zone NOT NULL
);


ALTER TABLE public.tratte OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16438)
-- Name: treni; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.treni (
    id_treno integer NOT NULL,
    nome_treno character varying NOT NULL,
    numero_carrozze integer NOT NULL
);


ALTER TABLE public.treni OWNER TO postgres;

--
-- TOC entry 3719 (class 0 OID 16478)
-- Dependencies: 222
-- Data for Name: biglietti; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.biglietti (id_biglietto, codice_pnr, corsa_id, passegero_id, data_ora_acquisto, prezzo, posto) FROM stdin;
501	AXB123	301	401	2025-04-10 15:30:00	55.00	12A
502	CXD456	302	402	2025-04-11 09:15:00	60.00	5B
503	EFG789	303	403	2025-04-12 18:40:00	25.00	NULL
504	HIJ012	304	401	2025-04-13 11:00:00	30.00	3C
\.


--
-- TOC entry 3720 (class 0 OID 24582)
-- Dependencies: 223
-- Data for Name: cambi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cambi (id_cambio, biglietto_id, ordine_cambio, corsa_partenza_id, corsa_arrivo_id, stazione_cambio_id, orario_arrivo_precedente, orario_partenza_successivo) FROM stdin;
601	504	1	304	\N	3	2025-04-16 11:00:00	2025-04-16 11:30:00
\.


--
-- TOC entry 3717 (class 0 OID 16445)
-- Dependencies: 220
-- Data for Name: corse; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.corse (id_corsa, tratta_id, treno_id, data_ora_partenza, data_ora_arrivo) FROM stdin;
301	101	201	2025-04-15 10:00:00	2025-04-15 13:00:00
302	102	202	2025-04-15 14:00:00	2025-04-15 17:05:00
303	103	201	2025-04-16 08:30:00	2025-04-16 10:00:00
304	104	203	2025-04-16 11:00:00	2025-04-16 13:00:00
305	105	202	2025-04-16 15:00:00	2025-04-16 16:55:00
306	106	203	2025-04-17 12:00:00	2025-04-17 15:30:00
\.


--
-- TOC entry 3718 (class 0 OID 16460)
-- Dependencies: 221
-- Data for Name: passeggeri; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.passeggeri (id_passeggero, nome, cognome, data_nascita, email) FROM stdin;
401	Alice	Rossi	1990-05-15	alice.rossi@email.com
402	Bob	Bianchi	1985-11-20	bob.bianchi@email.com
403	Carlo	Verdi	2000-02-10	carlo.verdi@email.com
\.


--
-- TOC entry 3714 (class 0 OID 16411)
-- Dependencies: 217
-- Data for Name: stazioni; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stazioni (id_stazione, nome_stazione, citta) FROM stdin;
1	Roma Termini	Roma
2	Milano Centrale	Milano
3	Firenze SMN	Firenze
4	Napoli Centrale	Napoli
\.


--
-- TOC entry 3715 (class 0 OID 16423)
-- Dependencies: 218
-- Data for Name: tratte; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tratte (id_tratta, stazione_partenza_id, stazione_di_arrivo_id, durata) FROM stdin;
101	1	2	03:00:00+01
102	2	1	03:05:00+01
103	1	3	01:30:00+01
104	3	2	02:00:00+01
105	2	3	01:55:00+01
106	3	4	03:30:00+01
\.


--
-- TOC entry 3716 (class 0 OID 16438)
-- Dependencies: 219
-- Data for Name: treni; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.treni (id_treno, nome_treno, numero_carrozze) FROM stdin;
201	Frecciarossa 1000	10
202	Italo EVO	8
203	Regionale Veloce	5
\.


--
-- TOC entry 3554 (class 2606 OID 16486)
-- Name: biglietti codice_pnr; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.biglietti
    ADD CONSTRAINT codice_pnr UNIQUE (codice_pnr);


--
-- TOC entry 3550 (class 2606 OID 16468)
-- Name: passeggeri email; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passeggeri
    ADD CONSTRAINT email UNIQUE (email);


--
-- TOC entry 3556 (class 2606 OID 16484)
-- Name: biglietti id_biglietto; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.biglietti
    ADD CONSTRAINT id_biglietto PRIMARY KEY (id_biglietto);


--
-- TOC entry 3558 (class 2606 OID 24586)
-- Name: cambi id_cambio; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cambi
    ADD CONSTRAINT id_cambio PRIMARY KEY (id_cambio);


--
-- TOC entry 3548 (class 2606 OID 16449)
-- Name: corse id_corsa; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.corse
    ADD CONSTRAINT id_corsa PRIMARY KEY (id_corsa);


--
-- TOC entry 3552 (class 2606 OID 16466)
-- Name: passeggeri id_passeggero; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passeggeri
    ADD CONSTRAINT id_passeggero PRIMARY KEY (id_passeggero);


--
-- TOC entry 3542 (class 2606 OID 16417)
-- Name: stazioni id_stazione; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stazioni
    ADD CONSTRAINT id_stazione PRIMARY KEY (id_stazione);


--
-- TOC entry 3544 (class 2606 OID 16427)
-- Name: tratte id_tratta; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tratte
    ADD CONSTRAINT id_tratta PRIMARY KEY (id_tratta);


--
-- TOC entry 3546 (class 2606 OID 16444)
-- Name: treni id_treno; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.treni
    ADD CONSTRAINT id_treno PRIMARY KEY (id_treno);


--
-- TOC entry 3565 (class 2606 OID 24587)
-- Name: cambi fk_biglietti; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cambi
    ADD CONSTRAINT fk_biglietti FOREIGN KEY (biglietto_id) REFERENCES public.biglietti(id_biglietto);


--
-- TOC entry 3566 (class 2606 OID 24597)
-- Name: cambi fk_corsa_arrivo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cambi
    ADD CONSTRAINT fk_corsa_arrivo FOREIGN KEY (corsa_arrivo_id) REFERENCES public.corse(id_corsa);


--
-- TOC entry 3567 (class 2606 OID 24592)
-- Name: cambi fk_corsa_partenza; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cambi
    ADD CONSTRAINT fk_corsa_partenza FOREIGN KEY (corsa_partenza_id) REFERENCES public.corse(id_corsa);


--
-- TOC entry 3563 (class 2606 OID 16487)
-- Name: biglietti fk_corse; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.biglietti
    ADD CONSTRAINT fk_corse FOREIGN KEY (corsa_id) REFERENCES public.corse(id_corsa);


--
-- TOC entry 3564 (class 2606 OID 16492)
-- Name: biglietti fk_passegero; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.biglietti
    ADD CONSTRAINT fk_passegero FOREIGN KEY (passegero_id) REFERENCES public.passeggeri(id_passeggero);


--
-- TOC entry 3568 (class 2606 OID 24602)
-- Name: cambi fk_stazione_cambio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cambi
    ADD CONSTRAINT fk_stazione_cambio FOREIGN KEY (stazione_cambio_id) REFERENCES public.stazioni(id_stazione);


--
-- TOC entry 3561 (class 2606 OID 16450)
-- Name: corse fk_tratte; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.corse
    ADD CONSTRAINT fk_tratte FOREIGN KEY (tratta_id) REFERENCES public.tratte(id_tratta);


--
-- TOC entry 3559 (class 2606 OID 16433)
-- Name: tratte fk_tratte_stazione_arrivo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tratte
    ADD CONSTRAINT fk_tratte_stazione_arrivo FOREIGN KEY (stazione_di_arrivo_id) REFERENCES public.stazioni(id_stazione);


--
-- TOC entry 3560 (class 2606 OID 16428)
-- Name: tratte fk_tratte_stazione_partenza; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tratte
    ADD CONSTRAINT fk_tratte_stazione_partenza FOREIGN KEY (stazione_partenza_id) REFERENCES public.stazioni(id_stazione);


--
-- TOC entry 3562 (class 2606 OID 16455)
-- Name: corse fk_treni; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.corse
    ADD CONSTRAINT fk_treni FOREIGN KEY (treno_id) REFERENCES public.treni(id_treno);


-- Completed on 2025-03-27 12:06:13 CET

--
-- PostgreSQL database dump complete
--

