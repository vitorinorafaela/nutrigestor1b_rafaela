--
-- PostgreSQL database dump
--

\restrict ldkKwhospCNHfhGDgfxpzuSXDRgGyeJujnk9GYQD8Q9ihaymR40vIUbZ7x4VKs4

-- Dumped from database version 16.13 (Ubuntu 16.13-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.13 (Ubuntu 16.13-0ubuntu0.24.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- Name: alunos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alunos (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    serie character varying(10) NOT NULL
);


ALTER TABLE public.alunos OWNER TO postgres;

--
-- Name: alunos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.alunos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.alunos_id_seq OWNER TO postgres;

--
-- Name: alunos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.alunos_id_seq OWNED BY public.alunos.id;


--
-- Name: cardapio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cardapio (
    id integer NOT NULL,
    data date NOT NULL,
    descricao character varying(200) NOT NULL,
    itens_utilizados text
);


ALTER TABLE public.cardapio OWNER TO postgres;

--
-- Name: cardapio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cardapio_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cardapio_id_seq OWNER TO postgres;

--
-- Name: cardapio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cardapio_id_seq OWNED BY public.cardapio.id;


--
-- Name: desperdicio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.desperdicio (
    id_cardapio integer NOT NULL,
    dt_merenda timestamp without time zone NOT NULL,
    peso_descartado numeric(8,2) NOT NULL,
    item_mais_rejeitado character varying(100)
);


ALTER TABLE public.desperdicio OWNER TO postgres;

--
-- Name: estoque; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estoque (
    id integer NOT NULL,
    item character varying(100) NOT NULL,
    quantidade numeric(8,2) NOT NULL,
    validade date NOT NULL
);


ALTER TABLE public.estoque OWNER TO postgres;

--
-- Name: estoque_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estoque_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.estoque_id_seq OWNER TO postgres;

--
-- Name: estoque_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estoque_id_seq OWNED BY public.estoque.id;


--
-- Name: item_restricao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.item_restricao (
    id_restricao integer NOT NULL,
    id_estoque integer NOT NULL
);


ALTER TABLE public.item_restricao OWNER TO postgres;

--
-- Name: merenda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.merenda (
    id_cardapio integer NOT NULL,
    dt_merenda timestamp without time zone NOT NULL,
    qtd_produzida numeric(8,2) NOT NULL
);


ALTER TABLE public.merenda OWNER TO postgres;

--
-- Name: participacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.participacao (
    id_aluno integer NOT NULL,
    id_cardapio integer NOT NULL,
    dt_merenda timestamp without time zone NOT NULL
);


ALTER TABLE public.participacao OWNER TO postgres;

--
-- Name: restricao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.restricao (
    id integer NOT NULL,
    descricao character varying(50) NOT NULL
);


ALTER TABLE public.restricao OWNER TO postgres;

--
-- Name: restricao_aluno; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.restricao_aluno (
    id_aluno integer NOT NULL,
    id_restricao integer NOT NULL
);


ALTER TABLE public.restricao_aluno OWNER TO postgres;

--
-- Name: restricao_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.restricao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.restricao_id_seq OWNER TO postgres;

--
-- Name: restricao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.restricao_id_seq OWNED BY public.restricao.id;


--
-- Name: alunos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alunos ALTER COLUMN id SET DEFAULT nextval('public.alunos_id_seq'::regclass);


--
-- Name: cardapio id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cardapio ALTER COLUMN id SET DEFAULT nextval('public.cardapio_id_seq'::regclass);


--
-- Name: estoque id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estoque ALTER COLUMN id SET DEFAULT nextval('public.estoque_id_seq'::regclass);


--
-- Name: restricao id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restricao ALTER COLUMN id SET DEFAULT nextval('public.restricao_id_seq'::regclass);


--
-- Data for Name: alunos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alunos (id, nome, serie) FROM stdin;
1	Aluno A	1ºB
2	Aluno B	2ºA
3	Aluno C	1ºA
4	Ana Clara Silva	6 ano A
5	Bruno Henrique Santos	6 ano A
6	Carla Mendes Oliveira	6 ano B
7	Daniel Costa Ribeiro	6 ano B
8	Eduarda Lima Martins	7 ano A
9	Felipe Gabriel Souza	7 ano A
10	Gabriela Fernandes Lima	7 ano B
11	Heitor Alves Pereira	7 ano B
12	Isabela Rocha Nascimento	8 ano A
13	João Pedro Carvalho	8 ano A
14	Kauan Dias Barbosa	8 ano B
15	Lara Beatriz Castro	8 ano B
16	Lucas Gabriel Araújo	9 ano A
17	Mariana Cardoso Freitas	9 ano A
18	Nicolas Moreira Machado	9 ano B
19	Olivia Monteiro Ramos	9 ano B
20	Paulo Roberto Teixeira	1 EM A
21	Rafaela Gomes Vieira	1 EM A
22	Samuel Victor Correia	1 EM B
23	Sofia Helena Duarte	1 EM B
24	Thiago Augusto Nunes	2 EM A
25	Valentina Soares Campos	2 EM A
26	Vinicius Eduardo Marques	2 EM B
27	Yasmin Alessandra Lopes	2 EM B
28	Arthur Guilherme Santana	3 EM A
29	Beatriz Vitoria Medeiros	3 EM A
30	Caio Felipe Andrade	3 EM B
31	David Lucca Silveira	3 EM B
32	Emma Carolina Farias	6 ano A
33	Enzo Gabriel Guimaraes	6 ano A
34	Fernanda Luisa Peixoto	6 ano B
35	Gabriel Vinicius Franco	6 ano B
36	Giovanna Maria Aguiar	7 ano A
37	Guilherme Henrique Fonseca	7 ano A
38	Igor Matheus Prado	7 ano B
39	Julia Eduarda Xavier	7 ano B
40	Leonardo Augusto Resende	8 ano A
41	Livia Maria Borges	8 ano A
42	Luiz Felipe Monteiro	8 ano B
43	Manuela Vitoria Assis	8 ano B
44	Matheus Henrique Bueno	9 ano A
45	Natalia Cristina Antunes	9 ano A
46	Pedro Henrique Camargo	9 ano B
47	Rebeca Sofia Sales	9 ano B
48	Rodrigo Emanuel Nogueira	1 EM A
49	Sarah Regina Pires	1 EM B
50	Vitor Hugo Barreto	2 EM A
\.


--
-- Data for Name: cardapio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cardapio (id, data, descricao, itens_utilizados) FROM stdin;
1	2026-06-29	arroz temperado	arroz e legumes
2	2026-06-30	macarrao	macarrao e carne moida
3	2026-07-01	arroz carreteiro	arroz e carne seca
4	2026-08-03	Arroz integral, feijão carioca, peito de frango grelhado e salada de alface com tomate.	Arroz Integral, Feijão Carioca, Peito de Frango Congelado, Alface Crespa, Tomate, Óleo de Soja, Sal Refinado
5	2026-08-04	Macarrão espaguete ao molho bolonhesa e banana de sobremesa.	Macarrão Espaguete, Carne Moída (Patinho), Extrato de Tomate, Cebola, Alho Descascado, Banana Prata
6	2026-08-05	Arroz, feijão preto, omelete com queijo e salada de repolho.	Arroz Integral, Feijão Preto, Ovos Brancos (Dúzias), Queijo Mussarela, Repolho Verde, Azeite de Oliva Extra Virgem
7	2026-08-06	Sopa de legumes com frango desfiado e pão de forma integral.	Batata Inglesa, Cenoura fresca, Chuchu, Peito de Frango Congelado, Pão de Forma Integral, Sal Refinado
8	2026-08-07	Galinhada caipira, salada de beterraba e suco de acerola.	Arroz Integral, Peito de Frango Congelado, Cebola, Alho Descascado, Beterraba, Polpa de Acerola, Açúcar Refinado
9	2026-08-10	Arroz, feijão carioca, carne moída ensopada com batata e maçã.	Arroz Integral, Feijão Carioca, Carne Moída (Patinho), Batata Inglesa, Maçã Gala
10	2026-08-11	Macarrão penne integral ao molho de tomate com atum e salada.	Macarrão Penne Integral, Atum em Conserva, Extrato de Tomate, Alface Crespa, Tomate
11	2026-08-12	Arroz, feijão preto, frango assado ao forno e purê de mandioca.	Arroz Integral, Feijão Preto, Peito de Frango Congelado, Farinha de Mandioca, Manteiga com Sal
12	2026-08-13	Risoto de frango com milho e ervilha e suco de caju.	Arroz Integral, Peito de Frango Congelado, Milho Verde em Conserva, Ervilha em Conserva, Suco de Caju Concentrado
13	2026-08-14	Cachorro quente escolar com suco de maracujá e melancia.	Pão Francês (kg), Salsicha para Cachorro Quente, Extrato de Tomate, Polpa de Maracujá, Melancia (kg)
14	2026-08-17	Arroz, feijão carioca, iscas de frango acebolado e salada de cenoura.	Arroz Integral, Feijão Carioca, Peito de Frango Congelado, Cebola, Cenoura fresca
15	2026-08-18	Carne moída com milho, arroz, feijão e laranja pera.	Carne Moída (Patinho), Milho Verde em Conserva, Arroz Integral, Feijão Carioca, Laranja Pera
16	2026-08-19	Sopa de feijão com macarrão e legumes.	Feijão Carioca, Macarrão Espaguete, Batata Inglesa, Cenoura fresca, Cebola
17	2026-08-20	Arroz, feijão preto, fricassê de frango e salada de alface.	Arroz Integral, Feijão Preto, Peito de Frango Congelado, Milho Verde em Conserva, Alface Crespa
18	2026-08-21	Mingau de aveia com banana e biscoito maria no lanche da manhã.	Leite Desnatado (Litros), Aveia em Flocos, Banana Prata, Biscoito Maria, Açúcar Refinado
19	2026-08-24	Arroz integral, feijão, ovos cozidos ao molho e salada de tomate.	Arroz Integral, Feijão Carioca, Ovos Brancos (Dúzias), Extrato de Tomate, Tomate
20	2026-08-25	Macarrão ao alho e óleo com frango em cubos e salada de repolho.	Macarrão Espaguete, Alho Descascado, Azeite de Oliva Extra Virgem, Peito de Frango Congelado, Repolho Verde
21	2026-08-26	Escondidinho de carne moída com purê de batata e melão.	Carne Moída (Patinho), Batata Inglesa, Manteiga com Sal, Leite Desnatado (Litros), Melão Amarelo
22	2026-08-27	Arroz, feijão preto, peito de frango grelhado e abóbora refogada.	Arroz Integral, Feijão Preto, Peito de Frango Congelado, Abóbora Cabotiá, Alho Descascado
23	2026-08-28	Pão com patê de atum, iogurte natural e maçã.	Pão de Forma Integral, Atum em Conserva, Iogurte Natural, Maçã Gala
24	2026-08-31	Arroz, feijão, estrogonofe de frango leve e salada verde.	Arroz Integral, Feijão Carioca, Peito de Frango Congelado, Extrato de Tomate, Alface Crespa
25	2026-09-01	Sopa de fubá com carne moída e couve refogada.	Farinha de Mandioca, Carne Moída (Patinho), Alho Descascado, Sal Refinado
26	2026-09-02	Arroz, feijão preto, omelete de vegetais e salada de beterraba.	Arroz Integral, Feijão Preto, Ovos Brancos (Dúzias), Cenoura fresca, Beterraba
27	2026-09-03	Macarrão penne com molho branco e frango desfiado.	Macarrão Penne Integral, Leite Desnatado (Litros), Farinha de Trigo, Manteiga com Sal, Peito de Frango Congelado
28	2026-09-04	Vitamina de banana com aveia e biscoito cream cracker.	Leite Desnatado (Litros), Banana Prata, Aveia em Flocos, Biscoito Cream Cracker
29	2026-09-08	Arroz, feijão carioca, frango xadrez escolar e salada de pepino.	Arroz Integral, Feijão Carioca, Peito de Frango Congelado, Cebola, Tomate
30	2026-09-09	Arroz de forno com legumes, frango e queijo mussarela.	Arroz Integral, Peito de Frango Congelado, Milho Verde em Conserva, Ervilha em Conserva, Queijo Mussarela
31	2026-09-10	Sopa de mandioca com carne moída e cheiro verde.	Farinha de Mandioca, Carne Moída (Patinho), Cebola, Alho Descascado
32	2026-09-11	Lanche especial: pão francês com queijo quente e suco de acerola.	Pão Francês (kg), Queijo Mussarela, Manteiga com Sal, Polpa de Acerola, Açúcar Refinado
33	2026-09-14	Arroz, feijão preto, carne moída refogada e salada de chuchu.	Arroz Integral, Feijão Preto, Carne Moída (Patinho), Chuchu, Azeite de Oliva Extra Virgem
34	2026-09-15	Macarrão espaguete ao molho de tomate com sardinha e salada.	Macarrão Espaguete, Sardinha em Conserva, Extrato de Tomate, Alface Crespa
35	2026-09-16	Arroz, feijão, frango ensopado com batata e maçã.	Arroz Integral, Feijão Carioca, Peito de Frango Congelado, Batata Inglesa, Maçã Gala
36	2026-09-17	Canja de galinha com arroz e legumes cortados em cubos.	Peito de Frango Congelado, Arroz Integral, Cenoura fresca, Batata Inglesa, Cebola
37	2026-09-18	Iogurte natural com banana picada e biscoito maria.	Iogurte Natural, Banana Prata, Biscoito Maria
38	2026-09-21	Arroz, feijão preto, peito de frango grelhado e purê de abóbora.	Arroz Integral, Feijão Preto, Peito de Frango Congelado, Abóbora Cabotiá, Manteiga com Sal
39	2026-09-22	Arroz colorido com legumes, ovos cozidos e salada de tomate.	Arroz Integral, Cenoura fresca, Ervilha em Conserva, Ovos Brancos (Dúzias), Tomate
40	2026-09-23	Sopa de legumes com carne moída e torradas de pão francês.	Batata Inglesa, Cenoura fresca, Chuchu, Carne Moída (Patinho), Pão Francês (kg)
41	2026-09-24	Macarrão penne integral ao molho sugo com frango.	Macarrão Penne Integral, Leite Desnatado (Litros), Peito de Frango Congelado, Queijo Mussarela
42	2026-09-25	Bolo caseiro simples com suco de maracujá no lanche.	Farinha de Trigo, Ovos Brancos (Dúzias), Açúcar Refinado, Polpa de Maracujá
43	2026-09-28	Arroz, feijão carioca, carne moída acebolada e salada de repolho com cenoura.	Arroz Integral, Feijão Carioca, Carne Moída (Patinho), Cebola, Repolho Verde, Cenoura fresca
44	2026-09-29	Arroz, feijão preto, frango xadrez leve e banana de sobremesa.	Arroz Integral, Feijão Preto, Peito de Frango Congelado, Cebola, Banana Prata
45	2026-09-30	Sopa de canjiquinha com frango desfiado e legumes.	Peito de Frango Congelado, Cenoura fresca, Batata Inglesa, Sal Refinado
46	2026-10-01	Arroz integral, feijão, omelete de queijo e salada de alface.	Arroz Integral, Feijão Carioca, Ovos Brancos (Dúzias), Queijo Mussarela, Alface Crespa
47	2026-10-02	Pão de forma integral com patê de frango e suco de caju.	Pão de Forma Integral, Peito de Frango Congelado, Suco de Caju Concentrado
48	2026-10-05	Arroz, feijão preto, iscas de peito de frango e abóbora cozida.	Arroz Integral, Feijão Preto, Peito de Frango Congelado, Abóbora Cabotiá
49	2026-10-06	Macarrão espaguete bolonhesa e melancia cortada.	Macarrão Espaguete, Carne Moída (Patinho), Extrato de Tomate, Melancia (kg)
50	2026-10-07	Arroz, feijão carioca, picadinho de carne com legumes e maçã.	Arroz Integral, Feijão Carioca, Carne Moída (Patinho), Cenoura fresca, Batata Inglesa, Maçã Gala
\.


--
-- Data for Name: desperdicio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.desperdicio (id_cardapio, dt_merenda, peso_descartado, item_mais_rejeitado) FROM stdin;
\.


--
-- Data for Name: estoque; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estoque (id, item, quantidade, validade) FROM stdin;
1	arroz	38.01	2026-12-01
2	feijao	25.00	2026-11-10
3	farinha	10.00	2027-01-10
4	Arroz Integral	150.00	2026-10-15
5	Feijão Carioca	120.50	2026-09-30
6	Feijão Preto	80.00	2026-11-05
7	Peito de Frango Congelado	95.00	2026-08-20
8	Carne Moída (Patinho)	60.00	2026-08-15
9	Óleo de Soja	45.00	2027-02-10
10	Açúcar Refinado	70.00	2027-05-01
11	Sal Refinado	30.00	2028-01-01
12	Macarrão Espaguete	110.00	2026-12-18
13	Macarrão Penne Integral	50.00	2026-11-22
14	Leite Desnatado (Litros)	200.00	2026-09-10
15	Farinha de Trigo	65.00	2026-10-01
16	Farinha de Mandioca	40.00	2026-12-01
17	Polpa de Acerola	35.00	2026-11-15
18	Polpa de Maracujá	30.00	2026-11-20
19	Banana Prata	85.50	2026-08-05
20	Maçã Gala	90.00	2026-08-10
21	Laranja Pera	120.00	2026-08-12
22	Cenoura fresca	45.00	2026-08-08
23	Batata Inglesa	130.00	2026-08-18
24	Cebola	55.00	2026-08-25
25	Alho Descascado	15.00	2026-09-01
26	Tomate	65.00	2026-08-06
27	Alface Crespa	25.00	2026-08-02
28	Repolho Verde	30.00	2026-08-10
29	Ovos Brancos (Dúzias)	40.00	2026-08-28
30	Queijo Mussarela	25.50	2026-08-30
31	Manteiga com Sal	18.00	2026-10-10
32	Iogurte Natural	80.00	2026-08-22
33	Aveia em Flocos	35.00	2027-01-15
34	Pão Francês (kg)	40.00	2026-07-28
35	Pão de Forma Integral	30.00	2026-08-04
36	Extrato de Tomate	50.00	2027-03-30
37	Milho Verde em Conserva	40.00	2027-06-15
38	Ervilha em Conserva	35.00	2027-06-15
39	Salsicha para Cachorro Quente	40.00	2026-09-05
40	Biscoito Cream Cracker	60.00	2026-12-01
41	Biscoito Maria	55.00	2026-12-05
42	Suco de Caju Concentrado	40.00	2027-01-20
43	Azeite de Oliva Extra Virgem	12.00	2027-08-10
44	Abóbora Cabotiá	35.00	2026-08-20
45	Chuchu	25.00	2026-08-08
46	Beterraba	40.00	2026-08-15
47	Melancia (kg)	75.00	2026-08-03
48	Melão Amarelo	40.00	2026-08-07
49	Atum em Conserva	45.00	2027-10-10
50	Sardinha em Conserva	50.00	2027-11-01
\.


--
-- Data for Name: item_restricao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.item_restricao (id_restricao, id_estoque) FROM stdin;
\.


--
-- Data for Name: merenda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.merenda (id_cardapio, dt_merenda, qtd_produzida) FROM stdin;
\.


--
-- Data for Name: participacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.participacao (id_aluno, id_cardapio, dt_merenda) FROM stdin;
\.


--
-- Data for Name: restricao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.restricao (id, descricao) FROM stdin;
1	lactose
2	gluten
3	amendoim
4	ovo
5	leite
6	soja
7	castanhas
8	nozes
9	peixe
10	frutos do mar
11	gergelim
12	milho
13	corantes
14	conservantes
\.


--
-- Data for Name: restricao_aluno; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.restricao_aluno (id_aluno, id_restricao) FROM stdin;
\.


--
-- Name: alunos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.alunos_id_seq', 50, true);


--
-- Name: cardapio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cardapio_id_seq', 50, true);


--
-- Name: estoque_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estoque_id_seq', 50, true);


--
-- Name: restricao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.restricao_id_seq', 14, true);


--
-- Name: alunos alunos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alunos
    ADD CONSTRAINT alunos_pkey PRIMARY KEY (id);


--
-- Name: cardapio cardapio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cardapio
    ADD CONSTRAINT cardapio_pkey PRIMARY KEY (id);


--
-- Name: estoque estoque_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estoque
    ADD CONSTRAINT estoque_pkey PRIMARY KEY (id);


--
-- Name: desperdicio pk_desperdicio; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.desperdicio
    ADD CONSTRAINT pk_desperdicio PRIMARY KEY (id_cardapio, dt_merenda);


--
-- Name: item_restricao pk_item_restricao; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_restricao
    ADD CONSTRAINT pk_item_restricao PRIMARY KEY (id_restricao, id_estoque);


--
-- Name: merenda pk_merenda; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.merenda
    ADD CONSTRAINT pk_merenda PRIMARY KEY (id_cardapio, dt_merenda);


--
-- Name: participacao pk_participacao; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.participacao
    ADD CONSTRAINT pk_participacao PRIMARY KEY (id_aluno, id_cardapio, dt_merenda);


--
-- Name: restricao_aluno pk_restricao_aluno; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restricao_aluno
    ADD CONSTRAINT pk_restricao_aluno PRIMARY KEY (id_aluno, id_restricao);


--
-- Name: restricao restricao_descricao_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restricao
    ADD CONSTRAINT restricao_descricao_key UNIQUE (descricao);


--
-- Name: restricao restricao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restricao
    ADD CONSTRAINT restricao_pkey PRIMARY KEY (id);


--
-- Name: idx_desp_merenda; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_desp_merenda ON public.desperdicio USING btree (id_cardapio, dt_merenda);


--
-- Name: idx_ir_restricao; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ir_restricao ON public.item_restricao USING btree (id_restricao);


--
-- Name: idx_part_aluno; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_part_aluno ON public.participacao USING btree (id_aluno);


--
-- Name: idx_part_merenda; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_part_merenda ON public.participacao USING btree (id_cardapio, dt_merenda);


--
-- Name: desperdicio fk_desp_merenda; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.desperdicio
    ADD CONSTRAINT fk_desp_merenda FOREIGN KEY (id_cardapio, dt_merenda) REFERENCES public.merenda(id_cardapio, dt_merenda) ON DELETE CASCADE;


--
-- Name: item_restricao fk_ir_estoque; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_restricao
    ADD CONSTRAINT fk_ir_estoque FOREIGN KEY (id_estoque) REFERENCES public.estoque(id) ON DELETE CASCADE;


--
-- Name: item_restricao fk_ir_restricao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_restricao
    ADD CONSTRAINT fk_ir_restricao FOREIGN KEY (id_restricao) REFERENCES public.restricao(id) ON DELETE CASCADE;


--
-- Name: merenda fk_merenda_cardapio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.merenda
    ADD CONSTRAINT fk_merenda_cardapio FOREIGN KEY (id_cardapio) REFERENCES public.cardapio(id) ON DELETE RESTRICT;


--
-- Name: participacao fk_part_aluno; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.participacao
    ADD CONSTRAINT fk_part_aluno FOREIGN KEY (id_aluno) REFERENCES public.alunos(id) ON DELETE RESTRICT;


--
-- Name: participacao fk_part_merenda; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.participacao
    ADD CONSTRAINT fk_part_merenda FOREIGN KEY (id_cardapio, dt_merenda) REFERENCES public.merenda(id_cardapio, dt_merenda) ON DELETE CASCADE;


--
-- Name: restricao_aluno fk_ra_aluno; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restricao_aluno
    ADD CONSTRAINT fk_ra_aluno FOREIGN KEY (id_aluno) REFERENCES public.alunos(id) ON DELETE CASCADE;


--
-- Name: restricao_aluno fk_ra_restricao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restricao_aluno
    ADD CONSTRAINT fk_ra_restricao FOREIGN KEY (id_restricao) REFERENCES public.restricao(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict ldkKwhospCNHfhGDgfxpzuSXDRgGyeJujnk9GYQD8Q9ihaymR40vIUbZ7x4VKs4

