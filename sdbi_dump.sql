--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4 (Postgres.app)
-- Dumped by pg_dump version 17.0

-- Started on 2025-04-02 12:37:35 CEST

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

--
-- TOC entry 3725 (class 0 OID 16478)
-- Dependencies: 222
-- Data for Name: biglietti; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.biglietti (id_biglietto, codice_pnr, corsa_id, passeggero_id, data_ora_acquisto, prezzo, posto) FROM stdin;
501	AXB123	301	401	2025-04-10 15:30:00	55.00	12A
502	CXD456	302	402	2025-04-11 09:15:00	60.00	5B
503	EFG789	303	403	2025-04-12 18:40:00	25.00	NULL
504	HIJ012	304	401	2025-04-13 11:00:00	30.00	3C
505	BGT678	305	402	2025-04-14 11:45:00	80.00	3C
\.


--
-- TOC entry 3726 (class 0 OID 24582)
-- Dependencies: 223
-- Data for Name: cambi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cambi (id_cambio, biglietto_id, ordine_cambio, corsa_partenza_id, corsa_arrivo_id, stazione_cambio_id, orario_arrivo_precedente, orario_partenza_successivo) FROM stdin;
601	504	1	304	\N	3	2025-04-16 11:00:00	2025-04-16 11:30:00
\.


--
-- TOC entry 3723 (class 0 OID 16445)
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
-- TOC entry 3724 (class 0 OID 16460)
-- Dependencies: 221
-- Data for Name: passeggeri; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.passeggeri (id_passeggero, nome, cognome, data_nascita, email) FROM stdin;
401	Alice	Rossi	1990-05-15	alice.rossi@email.com
402	Bob	Bianchi	1985-11-20	bob.bianchi@email.com
403	Carlo	Verdi	2000-02-10	carlo.verdi@email.com
404	Mario	Neri	1988-12-31	mario.neri@email.it
405	filippo	bruno	1990-09-08	filippobruno@email.it
406	Filippo	Bruno	1988-09-08	filippo.bruno@email.com
\.


--
-- TOC entry 3720 (class 0 OID 16411)
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
-- TOC entry 3721 (class 0 OID 16423)
-- Dependencies: 218
-- Data for Name: tratte; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tratte (id_tratta, stazione_partenza_id, stazione_arrivo_id, durata) FROM stdin;
101	1	2	03:00:00+01
102	2	1	03:05:00+01
103	1	3	01:30:00+01
104	3	2	02:00:00+01
105	2	3	01:55:00+01
106	3	4	03:30:00+01
\.


--
-- TOC entry 3722 (class 0 OID 16438)
-- Dependencies: 219
-- Data for Name: treni; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.treni (id_treno, nome_treno, numero_carrozze) FROM stdin;
201	Frecciarossa 1000	10
202	Italo EVO	8
203	Regionale Veloce	5
\.


-- Completed on 2025-04-02 12:37:35 CEST

--
-- PostgreSQL database dump complete
--

