--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4
-- Dumped by pg_dump version 12.4

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

--
-- Name: fuzzystrmatch; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;


--
-- Name: EXTENSION fuzzystrmatch; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';


--
-- Name: pg_trgm; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;


--
-- Name: EXTENSION pg_trgm; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';


--
-- Name: asf_convert_text_to_array(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.asf_convert_text_to_array(text1 text) RETURNS text[]
    LANGUAGE plpgsql
    AS $$

DECLARE 

  result text[];

  i integer;

  l integer;

  t1 text;

  t2 text;

BEGIN

i := 0;

t1 := concat(text1,' ');

l := length(t1);

t2 := '';

while i <= l loop

  if substring(t1 from i for 1) = ' ' then

    if t2 != '' then

      result = array_append(result,t2);  

    end if;

    t2 := '';

  else

    t2 := concat(t2,substring(t1 from i for 1));

  end if;

  i := i + 1;

end loop;

RETURN result;

END

$$;


ALTER FUNCTION public.asf_convert_text_to_array(text1 text) OWNER TO postgres;

--
-- Name: asf_convert_text_to_array2(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.asf_convert_text_to_array2(text1 text) RETURNS text[]
    LANGUAGE plpgsql
    AS $$

DECLARE 

  result text[];

BEGIN

result := regexp_split_to_array(regexp_replace(text1,'[^a-zA-Z 0-9,^ä,^ö,^ü,^ß]', '','g'),' ');

RETURN result;

END

$$;


ALTER FUNCTION public.asf_convert_text_to_array2(text1 text) OWNER TO postgres;

--
-- Name: asf_find_rank(text[], text[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.asf_find_rank(text1 text[], text2 text[]) RETURNS double precision
    LANGUAGE plpgsql
    AS $$

DECLARE 

  result integer;

  i1 integer;

  i2 integer;

  l1 integer;

  l2 integer;

  f1 float;

  f2 float;

  t1 text;

  t2 text;

BEGIN

result := 0;

i1 := 1;

f1 := 0;

f2 := 0;

l1 := cardinality(text1);

l2 := cardinality(text2);

t1 := '';

t2 := '';

while i1 <= l1 loop

  t1 := text1[i1];

  i2 := 1;

  f1 := 0;

  while i2 <= l2 loop

    t2 := text2[i2];

    f1 := f1 + similarity(t1,t2); 

    i2 := i2 + 1;

  end loop;

  f1 := f1 / l2;

  if f1 > f2 then

    f2 := f1;

  end if;

  i1 := i1 + 1;

end loop;

RETURN f2;

END

$$;


ALTER FUNCTION public.asf_find_rank(text1 text[], text2 text[]) OWNER TO postgres;

--
-- Name: asf_find_rank2(text[], text[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.asf_find_rank2(text1 text[], text2 text[]) RETURNS double precision
    LANGUAGE plpgsql
    AS $$

DECLARE 

  result integer;

  i1 integer;

  i2 integer;

  l1 integer;

  l2 integer;

  f1 float;

  f2 float;

  t1 text;

  t2 text;

  b1 boolean;

  b2 boolean;

BEGIN

result := 0;

i1 := 1;

f1 := 0;

f2 := 0;

l1 := cardinality(text1);

l2 := cardinality(text2);

t1 := '';

t2 := '';

b1 := false;

b2 := false;

while i1 <= l1 loop

  t1 := trim(text1[i1]);

  i2 := 1;

  f1 := 0;

  while i2 <= l2 loop

    t2 := lower(trim(text2[i2]));

    if t1 = t2 then

      f1 := f1 + 1;

    else

      if t1 like concat(t2,'%') then

        f1 := f1 + 0.8;

      else

	if t1 like concat('%',t2) then

          f1 := f1 + 0.7;

	else

          if t1 like concat('%',t2,'%') then

            f1 := f1 + 0.6;

	  else

	    f1 := f1 + similarity(t1,t2); 

          end if;

	end if;

      end if;

    end if;

    i2 := i2 + 1;

  end loop;

  f1 := f1 / l2;

  if f1 > f2 then

    f2 := f1;

  end if;

  i1 := i1 + 1;

end loop;

RETURN f2;

END

$$;


ALTER FUNCTION public.asf_find_rank2(text1 text[], text2 text[]) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: active_sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.active_sessions (
    user_id integer,
    session_id integer,
    start timestamp without time zone
);


ALTER TABLE public.active_sessions OWNER TO postgres;

--
-- Name: adressen_kpf; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.adressen_kpf (
    nummer integer,
    anrede1 character varying(100)[],
    anrede2 character varying(100)[],
    anrede3 character varying(100)[],
    anrede4 character varying[],
    anschrift text[]
);


ALTER TABLE public.adressen_kpf OWNER TO postgres;

--
-- Name: berechtigung; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.berechtigung (
    userid integer,
    modulnr integer,
    lesen boolean,
    schreiben boolean
);


ALTER TABLE public.berechtigung OWNER TO postgres;

--
-- Name: TABLE berechtigung; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.berechtigung IS 'Zuordnung der User zu den Modulen für die sie berechtigt sind';


--
-- Name: firmen; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.firmen (
    firma character varying(3) NOT NULL,
    name character varying(50)
);


ALTER TABLE public.firmen OWNER TO postgres;

--
-- Name: forms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.forms (
    id integer NOT NULL,
    theme character varying(100),
    name character varying(300),
    path character varying(300),
    iconpath character varying(300),
    "timestamp" timestamp without time zone,
    themeid integer,
    access_group integer[],
    breadpath json
);


ALTER TABLE public.forms OWNER TO postgres;

--
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.groups_id_seq OWNER TO postgres;

--
-- Name: groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.groups (
    id integer DEFAULT nextval('public.groups_id_seq'::regclass) NOT NULL,
    group_name text
);


ALTER TABLE public.groups OWNER TO postgres;

--
-- Name: handbuch; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.handbuch (
    id integer NOT NULL,
    dokument bytea,
    typ character varying(20),
    kapitel character varying(100),
    bezeichnung character varying(100),
    pfad character varying(1000),
    ebene1 character varying(100),
    ebene2 character varying(100),
    ebene3 character varying(100)
);


ALTER TABLE public.handbuch OWNER TO postgres;

--
-- Name: information; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.information (
    titel character varying(100),
    inhalt text,
    zeitstempel timestamp without time zone,
    aenderung timestamp without time zone,
    fulltextarray text[],
    fulltext text,
    id integer NOT NULL,
    read_permission text,
    modify_permission text,
    titel_de text,
    inhalt_de text,
    titel_pol text,
    inhalt_pol text,
    access_group integer[]
);


ALTER TABLE public.information OWNER TO postgres;

--
-- Name: COLUMN information.aenderung; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.information.aenderung IS 'Änderungsdatum

';


--
-- Name: information_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.information_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.information_id_seq OWNER TO postgres;

--
-- Name: information_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.information_id_seq OWNED BY public.information.id;


--
-- Name: information_inhalt_pol_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.information_inhalt_pol_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.information_inhalt_pol_seq OWNER TO postgres;

--
-- Name: information_inhalt_pol_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.information_inhalt_pol_seq OWNED BY public.information.inhalt_pol;


--
-- Name: kalender; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kalender (
    datum date NOT NULL,
    f1 boolean,
    f2 boolean,
    f3 boolean,
    u1 boolean,
    b1 boolean,
    f1text character varying(150),
    f2text character varying(150),
    f3text character varying(150),
    b1text character varying,
    u1text character varying(150),
    f4 boolean,
    f4text character varying(150)
);


ALTER TABLE public.kalender OWNER TO postgres;

--
-- Name: TABLE kalender; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.kalender IS 'f1 - bundesweiter Feiertag

f2 - Feiertag in Sachsen

f3 - Feiertag in Baden Würtemberg

u1 - Schulferien in Sachsen

b1 - betriebliche Veranstaltung';


--
-- Name: COLUMN kalender.f1; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.kalender.f1 IS 'bundeseinheitlicher Feiertag';


--
-- Name: COLUMN kalender.f2; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.kalender.f2 IS 'Feiertag in Sachsen';


--
-- Name: COLUMN kalender.f3; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.kalender.f3 IS 'Feiertag in Baden Würtemberg';


--
-- Name: COLUMN kalender.u1; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.kalender.u1 IS 'Ferien in Sachsen';


--
-- Name: COLUMN kalender.b1; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.kalender.b1 IS 'Betriebsferien Radeburger Fensterbau';


--
-- Name: COLUMN kalender.f1text; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.kalender.f1text IS 'Bezeichnung bundeseinheitlicher Feiertag';


--
-- Name: COLUMN kalender.f2text; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.kalender.f2text IS 'Feiertag in Sachsen';


--
-- Name: COLUMN kalender.f3text; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.kalender.f3text IS 'Feiertag in Baden Würtemberg';


--
-- Name: COLUMN kalender.b1text; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.kalender.b1text IS 'Betriebsferien Bezeichnung';


--
-- Name: kalenderbasis; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kalenderbasis (
    datum date NOT NULL,
    f1 boolean,
    f1text character varying(30),
    f2 boolean,
    f2text character varying,
    f3 boolean,
    f3text character varying(30),
    f4 boolean,
    f4text character varying(30)
);


ALTER TABLE public.kalenderbasis OWNER TO postgres;

--
-- Name: COLUMN kalenderbasis.f1; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.kalenderbasis.f1 IS 'Bundeseinheitliche Feiertage';


--
-- Name: COLUMN kalenderbasis.f2; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.kalenderbasis.f2 IS 'Feiertage in Sachsen';


--
-- Name: COLUMN kalenderbasis.f3; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.kalenderbasis.f3 IS 'Feiertage in Baden Würtemberg';


--
-- Name: COLUMN kalenderbasis.f4; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.kalenderbasis.f4 IS 'Ferien in Sachsen';


--
-- Name: kontakte_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kontakte_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.kontakte_id_seq OWNER TO postgres;

--
-- Name: kontakte; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kontakte (
    nachname character varying(50),
    vorname character varying(50),
    telefon1 character varying(50),
    telefon2 character varying(50),
    telefon3 character varying(50),
    email1 character varying(100),
    email2 character varying(100),
    email3 character varying(100),
    id integer DEFAULT nextval('public.kontakte_id_seq'::regclass) NOT NULL,
    firma character varying(10),
    fulltextarray text[],
    fulltext text,
    user_id integer,
    showing integer DEFAULT 1
);


ALTER TABLE public.kontakte OWNER TO postgres;

--
-- Name: media; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.media (
    theme character varying(300),
    name character varying(300),
    path character varying(500),
    iconpath character varying(500),
    type character varying(10),
    "timestamp" timestamp without time zone,
    themeid integer,
    id integer NOT NULL,
    path2 text,
    iconpath2 text,
    path3 text,
    iconpath3 text,
    access_group integer[],
    name2 text,
    name3 text
);


ALTER TABLE public.media OWNER TO postgres;

--
-- Name: media_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.media_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.media_id_seq OWNER TO postgres;

--
-- Name: media_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.media_id_seq OWNED BY public.media.id;


--
-- Name: medien; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medien (
    id integer NOT NULL,
    name character varying(100),
    path character varying(300),
    level1 character varying(50),
    level2 character varying(50),
    level3 character varying(50),
    type character varying(10),
    iconpath character varying(300),
    "timestamp" timestamp without time zone,
    themeid integer,
    theme character varying(100)
);


ALTER TABLE public.medien OWNER TO postgres;

--
-- Name: mlevel1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mlevel1 (
    id integer,
    name character varying(50)
);


ALTER TABLE public.mlevel1 OWNER TO postgres;

--
-- Name: mlevel2; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mlevel2 (
    id integer,
    level1 integer,
    name character varying(50)
);


ALTER TABLE public.mlevel2 OWNER TO postgres;

--
-- Name: module; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.module (
    modulnr integer,
    modulname character varying(50),
    beschreibung character varying(200)
);


ALTER TABLE public.module OWNER TO postgres;

--
-- Name: sessions_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessions_log (
    user_id integer,
    session_id integer,
    start timestamp without time zone,
    finish timestamp without time zone
);


ALTER TABLE public.sessions_log OWNER TO postgres;

--
-- Name: stamm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stamm (
    id integer NOT NULL,
    text1 text,
    text2 text
);


ALTER TABLE public.stamm OWNER TO postgres;

--
-- Name: user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_groups (
    id integer NOT NULL,
    user_id integer,
    group_id integer
);


ALTER TABLE public.user_groups OWNER TO postgres;

--
-- Name: user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.user_groups_id_seq OWNER TO postgres;

--
-- Name: user_groups_id_seq1; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_groups_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_groups_id_seq1 OWNER TO postgres;

--
-- Name: user_groups_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_groups_id_seq1 OWNED BY public.user_groups.id;


--
-- Name: username; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.username (
    id integer NOT NULL,
    username character varying(50),
    password character varying(50),
    vorname character varying(50),
    nachname character varying(50)
);


ALTER TABLE public.username OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    first_name text,
    last_name text,
    login_name text,
    password text,
    user_type text,
    telephone1 text,
    telephone2 text,
    telephone3 text,
    email1 text,
    email2 text,
    email3 text,
    company text
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq1; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq1 OWNER TO postgres;

--
-- Name: users_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq1 OWNED BY public.users.id;


--
-- Name: information id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.information ALTER COLUMN id SET DEFAULT nextval('public.information_id_seq'::regclass);


--
-- Name: media id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media ALTER COLUMN id SET DEFAULT nextval('public.media_id_seq'::regclass);


--
-- Name: user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_groups ALTER COLUMN id SET DEFAULT nextval('public.user_groups_id_seq1'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq1'::regclass);


--
-- Data for Name: active_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.active_sessions (user_id, session_id, start) FROM stdin;
\.


--
-- Data for Name: adressen_kpf; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.adressen_kpf (nummer, anrede1, anrede2, anrede3, anrede4, anschrift) FROM stdin;
\.


--
-- Data for Name: berechtigung; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.berechtigung (userid, modulnr, lesen, schreiben) FROM stdin;
\.


--
-- Data for Name: firmen; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.firmen (firma, name) FROM stdin;
GS	Gebrüder Schneider Stimpfach
RF	Radeburger Fensterbau
SC	Schneider Steel Construction
RC	Rapid Calau
\.


--
-- Data for Name: forms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.forms (id, theme, name, path, iconpath, "timestamp", themeid, access_group, breadpath) FROM stdin;
2	\N	Urlaubsantrag	forms/07d419a18db2291db4c72af0c66ea78a.pdf	forms/07d419a18db2291db4c72af0c66ea78a.jpg	2020-01-24 13:44:32.217199	1	\N	\N
3	\N	Freizeitkontoantrag	forms/03ae44deb5de255104fc6382de386abe.pdf	forms/03ae44deb5de255104fc6382de386abe.jpg	2020-02-07 14:29:10.702855	1	\N	\N
4	\N	Reisekostenabrechnung	forms/b6a1bb1d1fe61e926210badd52aa97e1.xls	forms/b6a1bb1d1fe61e926210badd52aa97e1.jpg	2020-02-07 14:30:20.503768	1	\N	\N
5	\N	Reisekostenabrechnung - Anlage für Belege	forms/aa6495c928260e970051b682e351e9cf.docx	forms/aa6495c928260e970051b682e351e9cf.jpg	2020-02-07 14:31:41.966937	1	\N	\N
7	\N	BA PT0130	forms/b761174000171cb95d488c5c03f498b4.xlsm	forms/b761174000171cb95d488c5c03f498b4.jpg	2020-03-11 11:19:04.690285	6	\N	\N
9	\N	Formblatt	forms/77ddcd10dc75bf051efa6647f1168401.pdf	forms/77ddcd10dc75bf051efa6647f1168401.jpg	2020-06-03 13:50:10.212113	8	\N	\N
8	ISO - Arbeitsanweisungen	\N	\N	\N	2020-06-03 13:49:14.645761	\N	\N	\N
13	\N	AAA	forms/d9794cc9c186f7f1a32fc98226d7a952.	forms/d9794cc9c186f7f1a32fc98226d7a952.jpg	2020-12-15 10:43:02.913095	8	\N	\N
15	\N	LALA	forms/56dde76f5c340075ba0c5d4951b4e4a7.xls	forms/56dde76f5c340075ba0c5d4951b4e4a7.jpg	2020-12-15 12:47:39.284353	1	\N	\N
16	\N	MMMM	forms/970bdad1c55b2b93fe70ae0025b5a110.docx	forms/970bdad1c55b2b93fe70ae0025b5a110.jpg	2020-12-15 13:02:02.012652	1	\N	\N
55	sds dsf	\N	\N	\N	2021-03-02 12:02:05.767035	52	{4,9,10,11,12,13,14,15,16,17,18,19,24,25,23,22}	\N
20	Parent	\N	\N	\N	2020-12-15 17:10:21.617143	\N	\N	\N
21	\N	child1	forms/c60617c2c1c43254791610eeca626e79.pdf	forms/c60617c2c1c43254791610eeca626e79.jpg	2020-12-15 17:12:40.395464	20	\N	\N
22	\N	child2	forms/1fc1308368203690ecec60c1552cccf7.	forms/1fc1308368203690ecec60c1552cccf7.jpg	2020-12-16 07:02:13.00073	20	\N	\N
23	\N	Grand Child1	forms/253b2912021149d3e2abf9197ef676fd.	forms/253b2912021149d3e2abf9197ef676fd.jpg	2020-12-16 07:06:02.477197	21	\N	\N
24	\N	RRR	forms/4126dc4fe91d64c1e754f2f917382bb6.docx	forms/4126dc4fe91d64c1e754f2f917382bb6.jpg	2020-12-16 10:14:07.549081	21	\N	\N
25	\N	ASSSWW			2021-01-06 11:03:41.589404	1	\N	\N
26	\N	SF			2021-01-06 11:09:15.241397	1	\N	\N
27	\N	AW	forms/5de208a783d36697a68681e211786cee.docx	forms/5de208a783d36697a68681e211786cee.jpg	2021-01-06 11:14:52.991144	1	\N	\N
28	\N	SFW	forms/a2f9d5a35de1dc660acb2215fa3b40b1.xls	forms/a2f9d5a35de1dc660acb2215fa3b40b1.jpg	2021-01-06 11:57:46.75838	1	\N	\N
29	Parent2	\N	\N	\N	2021-01-11 11:57:29.547762	\N	\N	\N
30	\N	dfd			2021-01-11 12:17:46.547028	29	\N	\N
31	hello	\N	\N	\N	2021-01-11 12:33:36.48482	29	\N	\N
32	hwl	\N	\N	\N	2021-01-11 13:52:37.953742	29	\N	\N
34	KI	\N	\N	\N	2021-01-11 14:07:13.818546	29	\N	\N
35	New Folder1	\N	\N	\N	2021-01-11 15:15:59.013934	29	\N	\N
36	PO	\N	\N	\N	2021-01-11 15:22:53.705132	1	\N	\N
37	\N	LL			2021-01-11 15:31:57.147661	29	\N	\N
38	parent4	\N	\N	\N	2021-02-03 09:46:57.178502	\N	\N	\N
39	\N	test_from			2021-02-03 09:57:44.163304	38	{}	\N
41	parent4sub folder	\N	\N	\N	2021-02-03 10:04:57.721539	38	\N	\N
42	\N	test form with picture	forms/f081a62c105d016c7a6709140c2f93f3.pdf	forms/f081a62c105d016c7a6709140c2f93f3.jpg	2021-02-03 10:10:43.985056	38	{9,10,11,12,13,14}	\N
43	\N	dsfdsf			2021-02-03 10:29:23.68203	38	{12,14}	\N
44	\N	sfs	forms/77931a5907b3782f80a7eb5d6f44a066.pdf	forms/77931a5907b3782f80a7eb5d6f44a066.jpg	2021-02-03 12:44:23.249028	38	{4,10,11}	\N
45	\N	ssf			2021-02-03 12:48:48.79962	38	{4,9,10,12}	\N
46	\N	sdsd			2021-02-03 12:49:45.270729	38	{4,9,10,11}	\N
49	new folder 8	\N	\N	\N	2021-02-03 13:40:26.772894	38	{4,9,10,11,12,13,14,15,16,17,18,19,24,25,23,22}	\N
50	Parent Root	\N	\N	\N	2021-02-03 13:45:50.179163	\N	\N	\N
51	\N	New Folder			2021-02-03 13:46:52.911965	1	{4,9,10,13,16}	\N
57	fgh	\N	\N	\N	2021-03-02 12:06:14.753597	52	{4,9,10,11,12,13,14,15,16,17,18,19,24,25,23,22}	\N
56	hash	\N	\N	\N	2021-03-02 12:04:50.040025	\N	{}	\N
58	dsadsakdf sfkdsmfkmgkfdmg fdkgdkfg dsadsakdf sfkdsmfkmgkfdmg fdkgdkfg	\N	\N	\N	2021-03-02 12:07:13.444226	56	{4,9,10,11,12,13,14,15,16,17,18,19,24,25,23,22}	\N
67	new f	\N	\N	\N	2021-04-07 14:12:41.970612	1	{4,9,10,11,12,13,14,15,16,17,18,19,24,25,23,22}	\N
48	New Folder sdsff	\N	\N	\N	2021-02-03 13:39:02.541143	1	{}	\N
54	New Folder sdsff	\N	\N	\N	2021-02-03 14:20:55.310008	49	{4,9,10,11,12,13,14,15,16,17,18,19,24,25,23,22}	\N
52	New Folder sdsff	New Folder 2	forms/a6589542a6d98a79a3f8e83e35c2a5d8.	forms/a6589542a6d98a79a3f8e83e35c2a5d8.jpg	2021-03-02 11:42:18.032388	1	{4,9,10,11,12,13,14,15,16,17,18,19,24,25,23,22}	\N
40	\N	test form 3			2021-03-31 11:57:54.22214	38	{4,9,10,11,13,15,16}	\N
59	\N	dsfsd	forms/2d3e18164d1be219ca8d05d3ca4330d5.pdf	forms/2d3e18164d1be219ca8d05d3ca4330d5.jpg	2021-04-06 15:52:13.308744	12	{4,9,11,14}	\N
60	\N	dsfsd	forms/5b8c95c70a89d427551b96741c88f683.pdf	forms/5b8c95c70a89d427551b96741c88f683.jpg	2021-04-06 15:52:27.232085	12	{4,9,11,14}	\N
61	\N	dsfsdsdsa	forms/d7af88c9a95165a55514f3a8ac65f8ca.pdf	forms/d7af88c9a95165a55514f3a8ac65f8ca.jpg	2021-04-06 15:53:54.345581	12	{4,9,11,14}	\N
63	dsfdsf dsf	\N	\N	\N	2021-04-06 15:54:52.140848	12	{4,9,10,11,12,13,14,15,16,17,18,19,24,25,23,22}	\N
64	dsfds	\N	\N	\N	2021-04-06 15:55:13.190377	\N	\N	\N
68	ne ff	\N	\N	\N	2021-04-07 14:13:57.749502	38	{4,9,10,11,12,13,14,15,16,17,18,19,24,25,23,22}	\N
47	\N	ccvv edfds			2021-04-07 13:01:39.961053	1	{4,9,10,11,12,23}	\N
66	Hello 2	\N	\N	\N	2021-04-07 14:01:19.202978	\N	{4,9,10,13}	\N
65	adasd	\N	\N	\N	2021-04-07 13:03:13.357389	\N	{4,9,10,12}	\N
10	ISO - Formblätter	\N	\N	\N	2020-06-03 13:51:45.076423	\N	{}	\N
1	adasd	\N	forms/235baf1c9d9fb106a3bdd8d291ba5da3xlsx	forms/235baf1c9d9fb106a3bdd8d291ba5da3.jpg	2020-01-22 15:05:25.130304	\N	{4,9,10,12}	\N
12	adasd	\N	\N	\N	2020-12-15 10:38:14.63335	\N	{4,9,10,12}	\N
70	adasd	\N	\N	\N	2021-04-07 14:20:21.422169	\N	{4,9,10,12}	\N
71	adasd	\N	\N	\N	2021-04-07 14:21:23.982952	\N	{4,9,10,12}	\N
62	adasd	\N	\N	\N	2021-04-06 15:54:36.039301	12	{4,9,10,12}	\N
69	adasd	\N	\N	\N	2021-04-07 14:16:47.207408	\N	{4,9,10,12}	\N
72	A1	\N	\N	\N	2021-04-07 14:46:17.767994	\N	{4,9,10,11,12,13,14,15,16,17,18,19,24,25,23,22}	\N
73	HII	\N	\N	\N	2021-04-07 15:31:30.521982	\N	{4,9,10,11,12,13,14,15,16,17,18,19,24,25,23,22}	\N
74	\N	hh	forms/64e955504ac2dd1c81e0bc0cc248079f.pdf	forms/64e955504ac2dd1c81e0bc0cc248079f.jpg	2021-04-13 07:02:39.575256	50	{4,9,10,11,12,13,14}	\N
75	\N	sadsa	forms/9d47e2cfd0e950dc5e23cce335cadebe.pdf	forms/9d47e2cfd0e950dc5e23cce335cadebe.jpg	2021-04-13 07:32:34.671724	72	{4,9,10,11,12,15,16}	\N
76	gggg	\N	\N	\N	2021-04-28 10:54:27.204781	65	{4,9,10,11,12,13,14,15,16,17,18,19,24,25,23,22}	\N
77	hhhhhh	\N	\N	\N	2021-04-28 13:31:20.85804	76	{4,9,10,11,12,13,14,15,16,17,18,19,24,25,23,22}	\N
78	Hello3	\N	\N	\N	2021-04-28 14:42:57.446788	66	{4,9,10,11,12,13,14,15,16,17,18,19,24,25,23,22}	\N
79	hello4	\N	\N	\N	2021-04-28 15:12:35.219568	78	{4,9,10,11,12,13,14,15,16,17,18,19,24,25,23,22}	\N
80	adddd	\N	\N	\N	2021-04-29 08:58:22.400938	70	{4,9,10,11,12,13,14,15,16,17,18,19,24,25,23,22}	\N
81	Hello5	\N	\N	\N	2021-05-05 15:21:18.790935	79	{4,9,10,11,12,13,14,15,16,17,18,19,24,25,23,22}	\N
82	hello 9	\N	\N	\N	2021-05-05 15:22:56.292901	78	{4,9,10,11,12,13,14,15,16,17,18,19,24,25,23,22}	\N
83	\N	OOO	forms/03f186490656d9bc3284d11254b10125.pdf	forms/03f186490656d9bc3284d11254b10125.jpg	2021-06-04 10:40:30.761282	20	{4,9,11}	\N
84	\N	OOOds	forms/6ecd74d28ba91e84ee4a888d4369a106.pdf	forms/6ecd74d28ba91e84ee4a888d4369a106.jpg	2021-06-04 10:49:20.36851	20	{4,9,11}	{"20":"\\/new_sc\\/forms_item_list.php?forms_id=20&forms_item_id=1"}
85	\N	ffff			2021-06-04 10:51:10.541915	79	{9,11,12,14,16}	{"66":"\\/new_sc\\/forms_item_list.php?forms_id=66&forms_item_id=1","78":"\\/new_sc\\/forms_item_list.php?forms_id=78&forms_item_id=66&origin=1","79":"\\/new_sc\\/forms_item_list.php?forms_id=79&forms_item_id=78&origin=66"}
86	kk	\N	\N	\N	2021-06-04 17:37:07.321831	64	{4,9,10,11,12,13,14,15,16,17,18,19,24,25,23,22}	{"64":"/new_sc/forms_item_list.php?forms_id=64&forms_item_id=1"}
\.


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.groups (id, group_name) FROM stdin;
4	test
9	testing
10	test2
11	test3
12	test4
13	test5
14	test6
15	test9
16	test10
17	test11
18	test12
19	test13
24	adsd
25	aaaa
23	cat5
22	cat6
\.


--
-- Data for Name: handbuch; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.handbuch (id, dokument, typ, kapitel, bezeichnung, pfad, ebene1, ebene2, ebene3) FROM stdin;
1	\N	handbuch	Lager	Lagerarten	/var/www/webtest2/handbooks/Lagerarten.pdf	\N	\N	\N
2	\N	handbuch	Lager	Lagerbuchungen	/var/www/webtest2/handbooks/Lagerbuchungen.pdf	\N	\N	\N
3	\N	handbuch	Allgemein	Lieferziele	/var/www/webtest2/handbooks/Lieferziele.pdf	\N	\N	\N
\.


--
-- Data for Name: information; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.information (titel, inhalt, zeitstempel, aenderung, fulltextarray, fulltext, id, read_permission, modify_permission, titel_de, inhalt_de, titel_pol, inhalt_pol, access_group) FROM stdin;
jdesfd  fdf  re	<p>asdasdn sakdn </p>	\N	\N	\N	\N	18	\N	\N	\N	\N	\N	\N	\N
dfdf 	<p>dsf sd f&nbsp;</p>	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N
code	<p>asd sdf sdf fds&nbsp;</p>	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	{4,9,10,12,13,14,15}
sdfds   	<p>dsf sdf f </p><p>dfejfn fjdjh</p><p><img style="width: 25%;" src="data:image/jpeg;base64,/9j/4AAQSkZJRgABAQEAYABgAAD//gA7Q1JFQVRPUjogZ2QtanBlZyB2MS4wICh1c2luZyBJSkcgSlBFRyB2ODApLCBxdWFsaXR5ID0gNzUK/9sAQwAIBgYHBgUIBwcHCQkICgwUDQwLCwwZEhMPFB0aHx4dGhwcICQuJyAiLCMcHCg3KSwwMTQ0NB8nOT04MjwuMzQy/9sAQwEJCQkMCwwYDQ0YMiEcITIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIy/8AAEQgCWAJYAwEiAAIRAQMRAf/EAB8AAAEFAQEBAQEBAAAAAAAAAAABAgMEBQYHCAkKC//EALUQAAIBAwMCBAMFBQQEAAABfQECAwAEEQUSITFBBhNRYQcicRQygZGhCCNCscEVUtHwJDNicoIJChYXGBkaJSYnKCkqNDU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6g4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2drh4uPk5ebn6Onq8fLz9PX29/j5+v/EAB8BAAMBAQEBAQEBAQEAAAAAAAABAgMEBQYHCAkKC//EALURAAIBAgQEAwQHBQQEAAECdwABAgMRBAUhMQYSQVEHYXETIjKBCBRCkaGxwQkjM1LwFWJy0QoWJDThJfEXGBkaJicoKSo1Njc4OTpDREVGR0hJSlNUVVZXWFlaY2RlZmdoaWpzdHV2d3h5eoKDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uLj5OXm5+jp6vLz9PX29/j5+v/aAAwDAQACEQMRAD8A9/ooooAKKKKACiiigBKKWigApKWigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAoq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" data-filename="imgserver.jpg"></p><p>sjfdjkf dpfkldsf sdjffffffffffffffffffffffffffffffffffffff dsfjdsjf  dsfjdsf sdfjd jsfbs jdf </p>	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	{9,10,11,12}
jahid  	<p class="MsoNormal" align="right" style="margin-bottom:0in;text-align:right;\r\nline-height:normal">Problem<b style="box-sizing: border-box; font-weight: bolder; color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 1rem; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; text-align: left;"><span lang="EN-US" style="box-sizing: border-box;">Problem</span></b><b style="font-size: 1rem; text-align: left;"><span lang="EN-US"> 1.</span></b></p><p>\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n</p><p class="MsoNormal"><span lang="EN-US">Loaded Dataset code in R:dfjd dsf]</span></p><p class="MsoNormal"><span lang="EN-US"><br></span></p><p class="MsoNormal"><span lang="EN-US">fdesklfkdsf odfoodf doisfodsof dfi</span></p><p class="MsoNormal"><span lang="EN-US"><o:p></o:p></span></p>	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	{4,9,10,13,15}
Test with img  en   fd  1st edit  	<p><img src="data:image/jpeg;base64,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" data-filename="weekly report 41.jpg" style="width: 506.989px;"></p><p>fdjfn difjn dsjfgn djsg edit 1st&nbsp;</p>	\N	\N	\N	\N	19	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	25	\N	\N	dfdg 	<p>dgfdg d dh&nbsp; d&nbsp;</p>	\N	\N	\N
fg	<p>gfdg&nbsp;</p>	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	{23}
code 2	<p>er e r</p>	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	\N	{}
 djf jdf jdsf j dsfj de 1st edit 	<p>dsfkjfdsn dskf de ÖDSÄöw32äädäsö f&nbsp; de edit</p>	\N	\N	\N	\N	20	\N	\N	 djf jdf jdsf j dsfj	<p>dsfkjfdsn dskf de&nbsp;</p>	\N	\N	\N
wrewr	<p>rer&nbsp;</p>	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	\N	\N
test pol  1st edit 	<p>dfj&nbsp; dfjjdf kidf ki edit&nbsp;</p>	\N	\N	\N	\N	21	\N	\N	\N	\N	\N	\N	\N
dg  dg 	<p>dgg dg&nbsp;</p>	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	\N
er  	<div style="color: rgb(212, 212, 212); background-color: rgb(30, 30, 30); font-family: Consolas, &quot;Courier New&quot;, monospace; font-size: 14px; line-height: 19px; white-space: pre;"><div><span style="color: #808080;">&lt;</span><span style="color: #569cd6;">h<u>4</u></span><u>&nbsp;<span style="color: #9cdcfe;">class</span>=<span style="color: #ce9178;">"text-120&nbsp;mb-0"</span><span style="color: #808080;">&gt;</span></u></div><div><u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: #808080;">&lt;</span><span style="color: #f44747;">center</span><span style="color: #808080;">&gt;&lt;</span><span style="color: #569cd6;">a</span><span style="color: #808080;">&gt;</span><span style="color: #569cd6;">&lt;?php</span>&nbsp;<span style="color: #c586c0;">if</span>(<span style="color: #9cdcfe;">$item_titel</span>==<span style="color: #ce9178;">""</span>&nbsp;&amp;&amp;&nbsp;<span style="color: #9cdcfe;">$item_title_pol</span>==<span style="color: #ce9178;">""</span>)&nbsp;{&nbsp;<span style="color: #dcdcaa;">echo</span>&nbsp;<span style="color: #9cdcfe;">$item_titel_de</span>;&nbsp;&nbsp;}&nbsp;<span style="color: #c586c0;">else</span>&nbsp;<span style="color: #c586c0;">if</span>(<span style="color: #9cdcfe;">$item_titel_de</span>==<span style="color: #ce9178;">""</span>&nbsp;&amp;&amp;&nbsp;<span style="color: #9cdcfe;">$item_titel</span>==<span style="color: #ce9178;">""</span>&nbsp;)&nbsp;{&nbsp;<span style="color: #dcdcaa;">echo</span>&nbsp;<span style="color: #9cdcfe;">$item_title_pol</span>;&nbsp;&nbsp;}&nbsp;<span style="color: #c586c0;">else</span>&nbsp;{&nbsp;<span style="color: #dcdcaa;">echo</span>&nbsp;<span style="color: #9cdcfe;">$item_titel</span>;}&nbsp;<span style="color: #569cd6;">?</span><span style="color: #569cd6;">&gt;</span><span style="color: #808080;">&lt;/</span><span style="color: #569cd6;">a</span><span style="color: #808080;">&gt;&lt;/</span><span style="color: #f44747;">center</span><span style="color: #808080;">&gt;</span></u></div></div><p><u><span style="background-color: rgb(30, 30, 30); color: rgb(212, 212, 212); font-family: Consolas, &quot;Courier New&quot;, monospace; font-size: 14px; white-space: pre;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="background-color: rgb(30, 30, 30); font-family: Consolas, &quot;Courier New&quot;, monospace; font-size: 14px; white-space: pre; color: rgb(128, 128, 128);">&lt;/</span><span style="background-color: rgb(30, 30, 30); font-family: Consolas, &quot;Courier New&quot;, monospace; font-size: 14px; white-space: pre; color: rgb(86, 156, 214);">h4</span><span style="background-color: rgb(30, 30, 30); font-family: Consolas, &quot;Courier New&quot;, monospace; font-size: 14px; white-space: pre; color: rgb(128, 128, 128);">&gt;</span><span style="color: inherit; font-family: inherit; font-size: 1.2em;">&nbsp; &nbsp;&nbsp;</span></u></p><h4 class="text-120 mb-0"><center><a><!--?php if($item_titel=="" && $item_title_pol=="") { echo $item_titel_de;  } else if($item_titel_de=="" && $item_titel=="" ) { echo $item_title_pol;  } else { echo $item_titel;} ?--></a></center><p></p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </p></h4><h4 class="text-120 mb-0"><p></p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </p><center><a><!--?php if($item_titel=="" && $item_title_pol=="") { echo $item_titel_de;  } else if($item_titel_de=="" && $item_titel=="" ) { echo $item_title_pol;  } else { echo $item_titel;} ?--></a></center><p></p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </p></h4><p></p>	\N	\N	\N	\N	22	\N	\N	\N	\N	\N	\N	\N
edfcds	<p>dsfsd&nbsp;</p>	\N	\N	\N	\N	28	\N	\N	\N	\N	\N	\N	{3,4}
test code	<div style="color: rgb(212, 212, 212); background-color: rgb(30, 30, 30); font-family: Consolas, &quot;Courier New&quot;, monospace; font-size: 14px; line-height: 19px; white-space: pre;"><div><span style="color: #808080;">&lt;</span><span style="color: #569cd6;">h4</span>&nbsp;<span style="color: #9cdcfe;">class</span>=<span style="color: #ce9178;">"text-120&nbsp;mb-0"</span><span style="color: #808080;">&gt;</span></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: #808080;">&lt;</span><span style="color: #f44747;">center</span><span style="color: #808080;">&gt;&lt;</span><span style="color: #569cd6;">a</span><span style="color: #808080;">&gt;</span><span style="color: #569cd6;">&lt;?php</span>&nbsp;<span style="color: #c586c0;">if</span>(<span style="color: #9cdcfe;">$item_titel</span>==<span style="color: #ce9178;">""</span>&nbsp;&amp;&amp;&nbsp;<span style="color: #9cdcfe;">$item_title_pol</span>==<span style="color: #ce9178;">""</span>)&nbsp;{&nbsp;<span style="color: #dcdcaa;">echo</span>&nbsp;<span style="color: #9cdcfe;">$item_titel_de</span>;&nbsp;&nbsp;}&nbsp;<span style="color: #c586c0;">else</span>&nbsp;<span style="color: #c586c0;">if</span>(<span style="color: #9cdcfe;">$item_titel_de</span>==<span style="color: #ce9178;">""</span>&nbsp;&amp;&amp;&nbsp;<span style="color: #9cdcfe;">$item_titel</span>==<span style="color: #ce9178;">""</span>&nbsp;)&nbsp;{&nbsp;<span style="color: #dcdcaa;">echo</span>&nbsp;<span style="color: #9cdcfe;">$item_title_pol</span>;&nbsp;&nbsp;}&nbsp;<span style="color: #c586c0;">else</span>&nbsp;{&nbsp;<span style="color: #dcdcaa;">echo</span>&nbsp;<span style="color: #9cdcfe;">$item_titel</span>;}&nbsp;<span style="color: #569cd6;">?</span><span style="color: #569cd6;">&gt;</span><span style="color: #808080;">&lt;/</span><span style="color: #569cd6;">a</span><span style="color: #808080;">&gt;&lt;/</span><span style="color: #f44747;">center</span><span style="color: #808080;">&gt;</span></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: #808080;">&lt;/</span><span style="color: #569cd6;">h4</span><span style="color: #808080;">&gt;</span></div></div>	\N	\N	\N	\N	23	\N	\N	\N	\N	\N	\N	\N
sfsf sf 	<p>sdf sf&nbsp;</p>	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	\N	{3,4}
\.


--
-- Data for Name: kalender; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kalender (datum, f1, f2, f3, u1, b1, f1text, f2text, f3text, b1text, u1text, f4, f4text) FROM stdin;
2019-07-12	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2019-07-15	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2019-07-16	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2019-07-17	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2019-07-18	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2019-07-19	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2019-07-22	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2019-07-23	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2019-07-24	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2019-07-25	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2019-07-26	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2019-07-29	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2019-07-30	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2019-07-31	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2019-08-01	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2019-08-02	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2019-08-05	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2019-08-06	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2019-08-07	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2019-08-08	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2019-08-09	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2019-08-12	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2019-08-13	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2019-08-14	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2019-08-15	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2019-08-16	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2019-10-03	t	\N	\N	\N	\N	Tag der deutschen Einheit	\N	\N	\N	\N	\N	\N
2019-10-14	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2019-10-15	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2019-10-16	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2019-10-17	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2019-10-18	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2019-10-21	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2019-10-22	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2019-10-23	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2019-10-24	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2019-10-25	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2018-01-02	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-12	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-13	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-14	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-15	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-16	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-19	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-20	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-21	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-22	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-23	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-29	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-30	t	\N	\N	\N	\N	Karfreitag	\N	\N	\N	\N	\N	\N
2018-04-02	t	\N	\N	\N	\N	Ostermontag	\N	\N	\N	\N	\N	\N
2018-04-03	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-04	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-05	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-06	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-01	t	\N	\N	\N	\N	Tag der Arbeit	\N	\N	\N	\N	\N	\N
2018-05-10	t	\N	\N	\N	\N	Christi Himmelfahrt	\N	\N	\N	\N	\N	\N
2018-05-11	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-21	t	\N	\N	\N	\N	Pfingstmontag	\N	\N	\N	\N	\N	\N
2018-05-22	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-02	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-03	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-04	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-05	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-06	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-09	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-10	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-11	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-12	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-13	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-16	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-17	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-18	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-19	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-20	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-23	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-24	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-25	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-26	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-27	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-30	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-31	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-01	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-02	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-03	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-06	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-07	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-08	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-09	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-10	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-08	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-09	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-10	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-11	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-12	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-15	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-16	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-17	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-18	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-19	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-03	t	\N	\N	\N	\N	Tag der Einheit	\N	\N	\N	\N	\N	\N
2018-10-31	t	\N	\N	\N	\N	Reformationstag	\N	\N	\N	\N	\N	\N
2018-12-25	t	\N	\N	\N	\N	1. Weihnachtsfeiertag	\N	\N	\N	\N	\N	\N
2018-12-26	t	\N	\N	\N	\N	2.Weihnachtsfeiertag	\N	\N	\N	\N	\N	\N
2018-12-24	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-27	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-28	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-31	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-01	\N	\N	t	\N	\N	\N	\N	Allerheiligen	\N	\N	\N	\N
2018-01-06	\N	\N	t	\N	\N	\N	\N	Heilige Drei Könige	\N	\N	\N	\N
2018-11-21	\N	t	\N	\N	\N	\N	Buß- und Bettag	\N	\N	\N	\N	\N
2019-10-31	\N	t	\N	\N	\N	\N	Reformationstag	\N	\N	\N	\N	\N
2018-01-01	t	\N	\N	\N	\N	Neujahr	\N	\N	\N	\N	\N	\N
2019-11-20	\N	t	\N	\N	\N	\N	Buß- und Bettag	\N	\N	\N	\N	\N
2019-12-23	\N	\N	\N	t	\N	\N	\N	\N	\N	Weihnachtsferien	\N	\N
2019-01-01	t	\N	\N	t	\N	Neujahr	\N	\N	\N	Weihnachtsferien	\N	\N
2019-01-02	\N	\N	\N	t	\N	\N	\N	\N	\N	Weihnachtsferien	\N	\N
2019-01-03	\N	\N	\N	t	\N	\N	\N	\N	\N	Weihnachtsferien	\N	\N
2019-01-04	\N	\N	\N	t	\N	\N	\N	\N	\N	Weihnachtsferien	\N	\N
2019-01-06	\N	\N	t	\N	\N	\N	\N	Heilige drei Könige	\N	\N	\N	\N
2019-02-18	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2019-02-19	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2019-02-20	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2019-02-21	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2019-02-22	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2019-02-25	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2019-02-26	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2019-02-27	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2019-02-28	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2019-03-01	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2019-04-19	t	\N	\N	t	\N	Karfreitag	\N	\N	\N	Osterferien	\N	\N
2019-04-21	t	\N	\N	\N	\N	Ostersonntag	\N	\N	\N	\N	\N	\N
2019-04-22	t	\N	\N	t	\N	Ostermontag	\N	\N	\N	Osterferien	\N	\N
2019-04-23	\N	\N	\N	t	\N	\N	\N	\N	\N	Osterferien	\N	\N
2019-04-24	\N	\N	\N	t	\N	\N	\N	\N	\N	Osterferien	\N	\N
2019-04-25	\N	\N	\N	t	\N	\N	\N	\N	\N	Osterferien	\N	\N
2019-04-26	\N	\N	\N	t	\N	\N	\N	\N	\N	Osterferien	\N	\N
2019-05-01	t	\N	\N	\N	\N	Tag der Arbeit	\N	\N	\N	\N	\N	\N
2019-05-30	t	\N	\N	\N	\N	Christi Himmelfahrt	\N	\N	\N	\N	\N	\N
2019-05-31	\N	\N	\N	t	\N	\N	\N	\N	\N	Pfingstferien	\N	\N
2019-06-09	t	\N	\N	\N	\N	Pfingstsonntag	\N	\N	\N	\N	\N	\N
2019-06-10	t	\N	\N	\N	\N	Pfingstmontag	\N	\N	\N	\N	\N	\N
2019-06-20	\N	\N	t	\N	\N	\N	\N	Fronleichnam	\N	\N	\N	\N
2019-07-08	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2019-07-09	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2019-07-10	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2019-07-11	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2019-12-24	\N	\N	\N	t	\N	\N	\N	\N	\N	Weihnachtsferien	\N	\N
2019-12-25	t	\N	\N	t	\N	1. Weihnachtsfeiertag	\N	\N	\N	Weihnachtsferien	\N	\N
2019-12-26	t	\N	\N	t	\N	2.Weihnachtsfeiertag	\N	\N	\N	Weihnachtsferien	\N	\N
2019-12-27	\N	\N	\N	t	\N	\N	\N	\N	\N	Weihnachtsferien	\N	\N
2019-12-30	\N	\N	\N	t	\N	\N	\N	\N	\N	Weihnachtsferien	\N	\N
2019-12-31	\N	\N	\N	t	\N	\N	\N	\N	\N	Weihnachtsferien	\N	\N
2021-11-17	\N	t	\N	\N	\N	\N	Buß- und Bettag	\N	\N	\N	\N	\N
2023-10-31	\N	t	\N	\N	\N	\N	Reformationstag	\N	\N	\N	\N	\N
2024-11-20	\N	t	\N	\N	\N	\N	Buß- und Bettag	\N	\N	\N	\N	\N
2019-11-01	\N	\N	t	\N	\N	\N	\N	Allerheiligen	\N	\N	\N	\N
2020-01-01	t	\N	\N	\N	\N	Neujahrstag			\N		\N	
2020-01-02	\N	\N	\N	t	\N				\N	Weihnachtsferien	\N	
2020-01-03	\N	\N	\N	t	\N				\N	Weihnachtsferien	\N	
2020-01-06	\N	\N	t	\N	\N			Heilige Drei Könige	\N		\N	
2020-02-10	\N	\N	\N	t	\N				\N	Winterferien	\N	
2020-02-11	\N	\N	\N	t	\N				\N	Winterferien	\N	
2020-02-12	\N	\N	\N	t	\N				\N	Winterferien	\N	
2020-02-13	\N	\N	\N	t	\N				\N	Winterferien	\N	
2020-02-14	\N	\N	\N	t	\N				\N	Winterferien	\N	
2020-02-17	\N	\N	\N	t	\N				\N	Winterferien	\N	
2020-02-18	\N	\N	\N	t	\N				\N	Winterferien	\N	
2020-02-19	\N	\N	\N	t	\N				\N	Winterferien	\N	
2020-02-20	\N	\N	\N	t	\N				\N	Winterferien	\N	
2020-02-21	\N	\N	\N	t	\N				\N	Winterferien	\N	
2020-04-10	t	\N	\N	\N	\N	Karfreitag			\N		\N	
2020-04-13	t	\N	\N	\N	\N	Ostermontag			\N		\N	
2020-04-14	\N	\N	\N	t	\N				\N	Osterferien	\N	
2020-04-15	\N	\N	\N	t	\N				\N	Osterferien	\N	
2020-04-16	\N	\N	\N	t	\N				\N	Osterferien	\N	
2020-04-17	\N	\N	\N	t	\N				\N	Osterferien	\N	
2020-05-01	t	\N	\N	\N	\N	Tag der Arbeit / 1. Mai			\N		\N	
2020-05-21	t	\N	\N	\N	\N	Christi Himmelfahrt			\N		\N	
2020-05-22	\N	\N	\N	t	\N				\N	Brückentag	\N	
2020-06-01	t	\N	\N	\N	\N	Pfingstmontag			\N		\N	
2020-06-11	\N	\N	t	\N	\N			Fronleichnam	\N		\N	
2020-07-20	\N	\N	\N	t	\N				\N	Sommerferien	\N	
2020-07-21	\N	\N	\N	t	\N				\N	Sommerferien	\N	
2020-07-22	\N	\N	\N	t	\N				\N	Sommerferien	\N	
2020-07-23	\N	\N	\N	t	\N				\N	Sommerferien	\N	
2020-07-24	\N	\N	\N	t	\N				\N	Sommerferien	\N	
2020-07-27	\N	\N	\N	t	\N				\N	Sommerferien	\N	
2020-07-28	\N	\N	\N	t	\N				\N	Sommerferien	\N	
2020-07-29	\N	\N	\N	t	\N				\N	Sommerferien	\N	
2020-07-30	\N	\N	\N	t	\N				\N	Sommerferien	\N	
2020-07-31	\N	\N	\N	t	\N				\N	Sommerferien	\N	
2020-08-03	\N	\N	\N	t	\N				\N	Sommerferien	\N	
2020-08-04	\N	\N	\N	t	\N				\N	Sommerferien	\N	
2020-08-05	\N	\N	\N	t	\N				\N	Sommerferien	\N	
2020-08-06	\N	\N	\N	t	\N				\N	Sommerferien	\N	
2020-08-07	\N	\N	\N	t	\N				\N	Sommerferien	\N	
2020-08-10	\N	\N	\N	t	\N				\N	Sommerferien	\N	
2020-08-11	\N	\N	\N	t	\N				\N	Sommerferien	\N	
2020-08-12	\N	\N	\N	t	\N				\N	Sommerferien	\N	
2020-08-13	\N	\N	\N	t	\N				\N	Sommerferien	\N	
2020-08-14	\N	\N	\N	t	\N				\N	Sommerferien	\N	
2020-08-17	\N	\N	\N	t	\N				\N	Sommerferien	\N	
2020-08-18	\N	\N	\N	t	\N				\N	Sommerferien	\N	
2020-08-19	\N	\N	\N	t	\N				\N	Sommerferien	\N	
2020-08-20	\N	\N	\N	t	\N				\N	Sommerferien	\N	
2020-08-21	\N	\N	\N	t	\N				\N	Sommerferien	\N	
2020-08-24	\N	\N	\N	t	\N				\N	Sommerferien	\N	
2020-08-25	\N	\N	\N	t	\N				\N	Sommerferien	\N	
2020-08-26	\N	\N	\N	t	\N				\N	Sommerferien	\N	
2020-08-27	\N	\N	\N	t	\N				\N	Sommerferien	\N	
2020-08-28	\N	\N	\N	t	\N				\N	Sommerferien	\N	
2020-10-03	t	\N	\N	\N	\N	Tag der Deutschen Einheit			\N		\N	
2020-10-19	\N	\N	\N	t	\N				\N	Herbstferien	\N	
2020-10-20	\N	\N	\N	t	\N				\N	Herbstferien	\N	
2020-10-21	\N	\N	\N	t	\N				\N	Herbstferien	\N	
2020-10-22	\N	\N	\N	t	\N				\N	Herbstferien	\N	
2020-10-23	\N	\N	\N	t	\N				\N	Herbstferien	\N	
2020-10-26	\N	\N	\N	t	\N				\N	Herbstferien	\N	
2020-10-27	\N	\N	\N	t	\N				\N	Herbstferien	\N	
2020-10-28	\N	\N	\N	t	\N				\N	Herbstferien	\N	
2020-10-29	\N	\N	\N	t	\N				\N	Herbstferien	\N	
2020-10-30	\N	\N	\N	t	\N				\N	Herbstferien	\N	
2020-10-31	\N	t	\N	\N	\N		Reformationstag		\N		\N	
2020-11-01	\N	\N	t	\N	\N			Allerheiligen	\N		\N	
2020-11-18	\N	t	\N	\N	\N		Buß- und Bettag		\N		\N	
2020-12-23	\N	\N	\N	t	\N				\N	Weihnachtsferien	\N	
2020-12-24	\N	\N	\N	t	\N				\N	Weihnachtsferien	\N	
2020-12-25	t	\N	\N	\N	\N	1. Weihnachtstag			\N		\N	
2020-12-26	t	\N	\N	\N	\N	2. Weihnachtstag			\N		\N	
2020-12-28	\N	\N	\N	t	\N				\N	Weihnachtsferien	\N	
2020-12-29	\N	\N	\N	t	\N				\N	Weihnachtsferien	\N	
2020-12-30	\N	\N	\N	t	\N				\N	Weihnachtsferien	\N	
2020-12-31	\N	\N	\N	t	\N				\N	Weihnachtsferien	\N	
2021-01-01	t	\N	\N	\N	\N	Neujahrstag	\N	\N	\N	\N	\N	\N
2021-01-06	\N	\N	t	\N	\N	\N	\N	Heilige Drei Könige	\N	\N	\N	\N
2021-02-08	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2021-02-09	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2021-02-10	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2021-02-11	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2021-02-12	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2021-02-15	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2021-02-16	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2021-02-17	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2021-02-18	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2021-02-19	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2021-04-02	t	\N	\N	\N	\N	Karfreitag	\N	\N	\N	\N	\N	\N
2021-04-05	t	\N	\N	\N	\N	Ostermontag	\N	\N	\N	\N	\N	\N
2021-04-06	\N	\N	\N	t	\N	\N	\N	\N	\N	Osterferien	\N	\N
2021-04-07	\N	\N	\N	t	\N	\N	\N	\N	\N	Osterferien	\N	\N
2021-04-08	\N	\N	\N	t	\N	\N	\N	\N	\N	Osterferien	\N	\N
2021-04-09	\N	\N	\N	t	\N	\N	\N	\N	\N	Osterferien	\N	\N
2021-05-01	t	\N	\N	\N	\N	Tag der Arbeit / 1. Mai	\N	\N	\N	\N	\N	\N
2021-05-13	t	\N	\N	\N	\N	Christi Himmelfahrt	\N	\N	\N	\N	\N	\N
2021-05-14	\N	\N	\N	t	\N	\N	\N	\N	\N	Pfingsten	\N	\N
2021-05-24	t	\N	\N	\N	\N	Pfingstmontag	\N	\N	\N	\N	\N	\N
2021-06-03	\N	\N	t	\N	\N	\N	\N	Fronleichnam	\N	\N	\N	\N
2021-07-26	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-07-27	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-07-28	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-07-29	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-07-30	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-08-02	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-08-03	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-08-04	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-08-05	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-08-06	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-08-09	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-08-10	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-08-11	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-08-12	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-08-13	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-08-16	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-08-17	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-08-18	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-08-19	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-08-20	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-08-23	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-08-24	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-08-25	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-08-26	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-08-27	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-08-30	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-08-31	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-09-01	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-09-02	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-09-03	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-10-03	t	\N	\N	\N	\N	Tag der Deutschen Einheit	\N	\N	\N	\N	\N	\N
2021-10-18	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2021-10-19	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2021-10-20	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2021-10-21	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2021-10-22	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2021-10-25	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2021-10-26	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2021-10-27	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2021-10-28	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2021-10-29	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2021-11-01	\N	\N	t	\N	\N	\N	\N	Allerheiligen	\N	\N	\N	\N
2021-12-23	\N	\N	\N	t	\N	\N	\N	\N	\N	Weihnachtsferien	\N	\N
2021-12-24	\N	\N	\N	t	\N	\N	\N	\N	\N	Weihnachtsferien	\N	\N
2021-12-25	t	\N	\N	\N	\N	1. Weihnachtstag	\N	\N	\N	\N	\N	\N
2021-12-26	t	\N	\N	\N	\N	2. Weihnachtstag	\N	\N	\N	\N	\N	\N
2021-12-27	\N	\N	\N	t	\N	\N	\N	\N	\N	Weihnachtsferien	\N	\N
2021-12-28	\N	\N	\N	t	\N	\N	\N	\N	\N	Weihnachtsferien	\N	\N
2021-12-29	\N	\N	\N	t	\N	\N	\N	\N	\N	Weihnachtsferien	\N	\N
2021-12-30	\N	\N	\N	t	\N	\N	\N	\N	\N	Weihnachtsferien	\N	\N
2021-12-31	\N	\N	\N	t	\N	\N	\N	\N	\N	Weihnachtsferien	\N	\N
2022-01-01	t	\N	\N	\N	\N	Neujahrstag	\N	\N	\N	\N	\N	\N
2022-01-06	\N	\N	t	\N	\N	\N	\N	Heilige Drei Könige	\N	\N	\N	\N
2022-02-14	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2022-02-15	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2022-02-16	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2022-02-17	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2022-02-18	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2022-02-21	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2022-02-22	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2022-02-23	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2022-02-24	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2022-02-25	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2022-04-15	t	\N	\N	\N	\N	Karfreitag	\N	\N	\N	\N	\N	\N
2022-04-18	t	\N	\N	\N	\N	Ostermontag	\N	\N	\N	\N	\N	\N
2022-04-19	\N	\N	\N	t	\N	\N	\N	\N	\N	Osterferien	\N	\N
2022-04-20	\N	\N	\N	t	\N	\N	\N	\N	\N	Osterferien	\N	\N
2022-04-21	\N	\N	\N	t	\N	\N	\N	\N	\N	Osterferien	\N	\N
2022-04-22	\N	\N	\N	t	\N	\N	\N	\N	\N	Osterferien	\N	\N
2022-05-01	t	\N	\N	\N	\N	Tag der Arbeit / 1. Mai	\N	\N	\N	\N	\N	\N
2022-05-26	t	\N	\N	\N	\N	Christi Himmelfahrt	\N	\N	\N	\N	\N	\N
2022-06-06	t	\N	\N	\N	\N	Pfingstmontag	\N	\N	\N	\N	\N	\N
2022-06-16	\N	\N	t	\N	\N	\N	\N	Fronleichnam	\N	\N	\N	\N
2022-07-18	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2022-07-19	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2022-07-20	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2022-07-21	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2022-07-22	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2022-07-25	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2022-07-26	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2022-07-27	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2022-07-28	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2022-07-29	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2022-08-01	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2022-08-02	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2022-08-03	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2022-08-04	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2022-08-05	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2022-08-08	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2022-08-09	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2022-08-10	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2022-08-11	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2022-08-12	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2022-08-15	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2022-08-16	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2022-08-17	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2022-08-18	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2022-08-19	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2022-08-22	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2022-08-23	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2022-08-24	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2022-08-25	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2022-08-26	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2022-10-03	t	\N	\N	\N	\N	Tag der Deutschen Einheit	\N	\N	\N	\N	\N	\N
2022-10-17	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2022-10-18	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2022-10-19	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2022-10-20	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2022-10-21	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2022-10-24	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2022-10-25	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2022-10-26	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2022-10-27	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2022-10-28	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2022-11-01	\N	\N	t	\N	\N	\N	\N	Allerheiligen	\N	\N	\N	\N
2022-12-22	\N	\N	\N	t	\N	\N	\N	\N	\N	Weihnachtsferien	\N	\N
2022-12-23	\N	\N	\N	t	\N	\N	\N	\N	\N	Weihnachtsferien	\N	\N
2022-12-25	t	\N	\N	\N	\N	1. Weihnachtstag	\N	\N	\N	\N	\N	\N
2022-12-26	t	\N	\N	\N	\N	2. Weihnachtstag	\N	\N	\N	\N	\N	\N
2022-12-27	\N	\N	\N	t	\N	\N	\N	\N	\N	Weihnachtsferien	\N	\N
2022-12-28	\N	\N	\N	t	\N	\N	\N	\N	\N	Weihnachtsferien	\N	\N
2022-12-29	\N	\N	\N	t	\N	\N	\N	\N	\N	Weihnachtsferien	\N	\N
2022-12-30	\N	\N	\N	t	\N	\N	\N	\N	\N	Weihnachtsferien	\N	\N
2023-01-01	t	\N	\N	\N	\N	Neujahrstag	\N	\N	\N	\N	\N	\N
2023-01-02	\N	\N	\N	t	\N	\N	\N	\N	\N	Weihnachtsferien	\N	\N
2023-01-06	\N	\N	t	\N	\N	\N	\N	Heilige Drei Könige	\N	\N	\N	\N
2023-02-13	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2023-02-14	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2023-02-15	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2023-02-16	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2023-02-17	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2023-02-20	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2023-02-21	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2023-02-22	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2023-02-23	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2023-02-24	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2023-04-07	t	\N	\N	\N	\N	Karfreitag	\N	\N	\N	Osterferien	\N	\N
2023-04-10	t	\N	\N	\N	\N	Ostermontag	\N	\N	\N	Osterferien	\N	\N
2023-04-11	\N	\N	\N	t	\N	\N	\N	\N	\N	Osterferien	\N	\N
2023-04-12	\N	\N	\N	t	\N	\N	\N	\N	\N	Osterferien	\N	\N
2023-04-13	\N	\N	\N	t	\N	\N	\N	\N	\N	Osterferien	\N	\N
2023-04-14	\N	\N	\N	t	\N	\N	\N	\N	\N	Osterferien	\N	\N
2023-05-01	t	\N	\N	\N	\N	Tag der Arbeit / 1. Mai	\N	\N	\N	\N	\N	\N
2023-05-18	t	\N	\N	\N	\N	Christi Himmelfahrt	\N	\N	\N	\N	\N	\N
2023-05-19	\N	\N	\N	t	\N	\N	\N	\N	\N	schulfreier Tag	\N	\N
2023-05-29	t	\N	\N	\N	\N	Pfingstmontag	\N	\N	\N	\N	\N	\N
2023-06-08	\N	\N	t	\N	\N	\N	\N	Fronleichnam	\N	\N	\N	\N
2023-07-10	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2023-07-11	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2023-07-12	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2023-07-13	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2023-07-14	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2023-07-17	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2023-07-18	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2023-07-19	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2023-07-20	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2021-10-31	\N	t	\N	\N	\N	\N	Reformationstag	\N	\N	\N	\N	\N
2022-10-31	\N	t	\N	\N	\N	\N	Reformationstag	\N	\N	\N	\N	\N
2022-11-16	\N	t	\N	\N	\N	\N	Buß- und Bettag	\N	\N	\N	\N	\N
2023-07-21	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2023-07-24	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2023-07-25	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2023-07-26	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2023-07-27	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2023-07-28	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2023-07-31	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2023-08-01	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2023-08-02	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2023-08-03	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2023-08-04	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2023-08-07	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2023-08-08	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2023-08-09	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2023-08-10	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2023-08-11	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2023-08-14	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2023-08-15	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2023-08-16	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2023-08-17	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2023-08-18	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2023-10-02	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2023-10-03	t	\N	\N	\N	\N	Tag der Deutschen Einheit	\N	\N	\N	Herbstferien	\N	\N
2023-10-04	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2023-10-05	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2023-10-06	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2023-10-09	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2023-10-10	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2023-10-11	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2023-10-12	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2023-10-13	\N	\N	\N	t	\N	\N	\N	\N	\N	Herbstferien	\N	\N
2023-10-30	\N	\N	\N	t	\N	\N	\N	\N	\N	schulfreier Tag	\N	\N
2023-11-01	\N	\N	t	\N	\N	\N	\N	Allerheiligen	\N	\N	\N	\N
2023-12-25	t	\N	\N	\N	\N	1. Weihnachtstag	\N	\N	\N	Weihnachtsferien	\N	\N
2023-12-26	t	\N	\N	\N	\N	2. Weihnachtstag	\N	\N	\N	Weihnachtsferien	\N	\N
2023-12-27	\N	\N	\N	t	\N	\N	\N	\N	\N	Weihnachtsferien	\N	\N
2023-12-28	\N	\N	\N	t	\N	\N	\N	\N	\N	Weihnachtsferien	\N	\N
2023-12-29	\N	\N	\N	t	\N	\N	\N	\N	\N	Weihnachtsferien	\N	\N
2024-01-01	t	\N	\N	\N	\N	Neujahrstag	\N	\N	\N	Weihnachtsferien	\N	\N
2024-01-02	\N	\N	\N	t	\N	\N	\N	\N	\N	Weihnachtsferien	\N	\N
2024-01-06	\N	\N	t	\N	\N	\N	\N	Heilige Drei Könige	\N	\N	\N	\N
2024-02-12	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2024-02-13	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2024-02-14	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2024-02-15	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2024-02-16	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2024-02-19	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2024-02-20	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2024-02-21	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2024-02-22	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2024-02-23	\N	\N	\N	t	\N	\N	\N	\N	\N	Winterferien	\N	\N
2024-03-28	\N	\N	\N	t	\N	\N	\N	\N	\N	Osterferien	\N	\N
2024-03-29	t	\N	\N	\N	\N	Karfreitag	\N	\N	\N	Osterferien	\N	\N
2024-04-01	t	\N	\N	\N	\N	Ostermontag	\N	\N	\N	Osterferien	\N	\N
2024-04-02	\N	\N	\N	t	\N	\N	\N	\N	\N	Osterferien	\N	\N
2024-04-03	\N	\N	\N	t	\N	\N	\N	\N	\N	Osterferien	\N	\N
2024-04-04	\N	\N	\N	t	\N	\N	\N	\N	\N	Osterferien	\N	\N
2024-04-05	\N	\N	\N	t	\N	\N	\N	\N	\N	Osterferien	\N	\N
2024-05-01	t	\N	\N	\N	\N	Tag der Arbeit / 1. Mai	\N	\N	\N	\N	\N	\N
2024-05-09	t	\N	\N	\N	\N	Christi Himmelfahrt	\N	\N	\N	\N	\N	\N
2024-05-10	\N	\N	\N	t	\N	\N	\N	\N	\N	schulfreier Tag	\N	\N
2024-05-20	t	\N	\N	\N	\N	Pfingstmontag	\N	\N	\N	Pfingstferien	\N	\N
2024-05-21	\N	\N	\N	t	\N	\N	\N	\N	\N	Pfingstferien	\N	\N
2024-05-30	\N	\N	t	\N	\N	\N	\N	Fronleichnam	\N	\N	\N	\N
2024-06-20	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2024-06-21	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2024-06-24	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2024-06-25	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2024-06-26	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2024-06-27	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2024-06-28	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2024-07-01	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2024-07-02	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2024-07-03	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2024-07-04	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2024-07-05	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2024-07-08	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2024-07-09	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2024-07-10	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2024-07-11	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2024-07-12	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2024-07-15	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2024-07-16	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2024-07-17	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2024-07-18	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2024-07-19	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2024-07-22	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2024-07-23	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2024-07-24	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2024-07-25	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2024-07-26	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2024-07-29	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2024-07-30	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2024-07-31	\N	\N	\N	t	\N	\N	\N	\N	\N	Sommerferien	\N	\N
2024-10-03	t	\N	\N	\N	\N	Tag der Deutschen Einheit	\N	\N	\N	\N	\N	\N
2024-11-01	\N	\N	t	\N	\N	\N	\N	Allerheiligen	\N	\N	\N	\N
2024-12-25	t	\N	\N	\N	\N	1. Weihnachtstag	\N	\N	\N	\N	\N	\N
2024-12-26	t	\N	\N	\N	\N	2. Weihnachtstag	\N	\N	\N	\N	\N	\N
2025-01-01	t	\N	\N	\N	\N	Neujahrstag	\N	\N	\N	\N	\N	\N
2025-01-06	\N	\N	t	\N	\N	\N	\N	Heilige Drei Könige	\N	\N	\N	\N
2025-04-18	t	\N	\N	\N	\N	Karfreitag	\N	\N	\N	\N	\N	\N
2025-04-21	t	\N	\N	\N	\N	Ostermontag	\N	\N	\N	\N	\N	\N
2025-05-01	t	\N	\N	\N	\N	Tag der Arbeit / 1. Mai	\N	\N	\N	\N	\N	\N
2025-05-29	t	\N	\N	\N	\N	Christi Himmelfahrt	\N	\N	\N	\N	\N	\N
2025-06-09	t	\N	\N	\N	\N	Pfingstmontag	\N	\N	\N	\N	\N	\N
2025-06-19	\N	\N	t	\N	\N	\N	\N	Fronleichnam	\N	\N	\N	\N
2025-10-03	t	\N	\N	\N	\N	Tag der Deutschen Einheit	\N	\N	\N	\N	\N	\N
2025-11-01	\N	\N	t	\N	\N	\N	\N	Allerheiligen	\N	\N	\N	\N
2025-12-25	t	\N	\N	\N	\N	1. Weihnachtstag	\N	\N	\N	\N	\N	\N
2025-12-26	t	\N	\N	\N	\N	2. Weihnachtstag	\N	\N	\N	\N	\N	\N
2026-01-01	t	\N	\N	\N	\N	Neujahrstag	\N	\N	\N	\N	\N	\N
2026-01-06	\N	\N	t	\N	\N	\N	\N	Heilige Drei Könige	\N	\N	\N	\N
2026-04-03	t	\N	\N	\N	\N	Karfreitag	\N	\N	\N	\N	\N	\N
2026-04-06	t	\N	\N	\N	\N	Ostermontag	\N	\N	\N	\N	\N	\N
2026-05-01	t	\N	\N	\N	\N	Tag der Arbeit / 1. Mai	\N	\N	\N	\N	\N	\N
2026-05-14	t	\N	\N	\N	\N	Christi Himmelfahrt	\N	\N	\N	\N	\N	\N
2026-05-25	t	\N	\N	\N	\N	Pfingstmontag	\N	\N	\N	\N	\N	\N
2026-06-04	\N	\N	t	\N	\N	\N	\N	Fronleichnam	\N	\N	\N	\N
2026-10-03	t	\N	\N	\N	\N	Tag der Deutschen Einheit	\N	\N	\N	\N	\N	\N
2026-11-01	\N	\N	t	\N	\N	\N	\N	Allerheiligen	\N	\N	\N	\N
2026-12-25	t	\N	\N	\N	\N	1. Weihnachtstag	\N	\N	\N	\N	\N	\N
2026-12-26	t	\N	\N	\N	\N	2. Weihnachtstag	\N	\N	\N	\N	\N	\N
2027-01-01	t	\N	\N	\N	\N	Neujahrstag	\N	\N	\N	\N	\N	\N
2027-01-06	\N	\N	t	\N	\N	\N	\N	Heilige Drei Könige	\N	\N	\N	\N
2027-03-26	t	\N	\N	\N	\N	Karfreitag	\N	\N	\N	\N	\N	\N
2025-10-31	\N	t	\N	\N	\N	\N	Reformationstag	\N	\N	\N	\N	\N
2025-11-19	\N	t	\N	\N	\N	\N	Buß- und Bettag	\N	\N	\N	\N	\N
2026-10-31	\N	t	\N	\N	\N	\N	Reformationstag	\N	\N	\N	\N	\N
2023-11-22	\N	t	\N	\N	\N	\N	Buß- und Bettag	\N	\N	\N	\N	\N
2026-11-18	\N	t	\N	\N	\N	\N	Buß- und Bettag	\N	\N	\N	\N	\N
2024-10-31	\N	t	\N	\N	\N	\N	Reformationstag	\N	\N	\N	\N	\N
2027-03-29	t	\N	\N	\N	\N	Ostermontag	\N	\N	\N	\N	\N	\N
2027-05-01	t	\N	\N	\N	\N	Tag der Arbeit / 1. Mai	\N	\N	\N	\N	\N	\N
2027-05-06	t	\N	\N	\N	\N	Christi Himmelfahrt	\N	\N	\N	\N	\N	\N
2027-05-17	t	\N	\N	\N	\N	Pfingstmontag	\N	\N	\N	\N	\N	\N
2027-05-27	\N	\N	t	\N	\N	\N	\N	Fronleichnam	\N	\N	\N	\N
2027-10-03	t	\N	\N	\N	\N	Tag der Deutschen Einheit	\N	\N	\N	\N	\N	\N
2027-11-01	\N	\N	t	\N	\N	\N	\N	Allerheiligen	\N	\N	\N	\N
2027-12-25	t	\N	\N	\N	\N	1. Weihnachtstag	\N	\N	\N	\N	\N	\N
2027-12-26	t	\N	\N	\N	\N	2. Weihnachtstag	\N	\N	\N	\N	\N	\N
2028-01-01	t	\N	\N	\N	\N	Neujahrstag	\N	\N	\N	\N	\N	\N
2028-01-06	\N	\N	t	\N	\N	\N	\N	Heilige Drei Könige	\N	\N	\N	\N
2028-04-14	t	\N	\N	\N	\N	Karfreitag	\N	\N	\N	\N	\N	\N
2028-04-17	t	\N	\N	\N	\N	Ostermontag	\N	\N	\N	\N	\N	\N
2028-05-01	t	\N	\N	\N	\N	Tag der Arbeit / 1. Mai	\N	\N	\N	\N	\N	\N
2028-05-25	t	\N	\N	\N	\N	Christi Himmelfahrt	\N	\N	\N	\N	\N	\N
2028-06-05	t	\N	\N	\N	\N	Pfingstmontag	\N	\N	\N	\N	\N	\N
2028-06-15	\N	\N	t	\N	\N	\N	\N	Fronleichnam	\N	\N	\N	\N
2028-10-03	t	\N	\N	\N	\N	Tag der Deutschen Einheit	\N	\N	\N	\N	\N	\N
2028-11-01	\N	\N	t	\N	\N	\N	\N	Allerheiligen	\N	\N	\N	\N
2028-12-25	t	\N	\N	\N	\N	1. Weihnachtstag	\N	\N	\N	\N	\N	\N
2028-12-26	t	\N	\N	\N	\N	2. Weihnachtstag	\N	\N	\N	\N	\N	\N
2029-01-01	t	\N	\N	\N	\N	Neujahrstag	\N	\N	\N	\N	\N	\N
2029-01-06	\N	\N	t	\N	\N	\N	\N	Heilige Drei Könige	\N	\N	\N	\N
2029-03-30	t	\N	\N	\N	\N	Karfreitag	\N	\N	\N	\N	\N	\N
2029-04-02	t	\N	\N	\N	\N	Ostermontag	\N	\N	\N	\N	\N	\N
2029-05-01	t	\N	\N	\N	\N	Tag der Arbeit / 1. Mai	\N	\N	\N	\N	\N	\N
2029-05-10	t	\N	\N	\N	\N	Christi Himmelfahrt	\N	\N	\N	\N	\N	\N
2029-05-21	t	\N	\N	\N	\N	Pfingstmontag	\N	\N	\N	\N	\N	\N
2029-05-31	\N	\N	t	\N	\N	\N	\N	Fronleichnam	\N	\N	\N	\N
2029-10-03	t	\N	\N	\N	\N	Tag der Deutschen Einheit	\N	\N	\N	\N	\N	\N
2029-11-01	\N	\N	t	\N	\N	\N	\N	Allerheiligen	\N	\N	\N	\N
2029-12-25	t	\N	\N	\N	\N	1. Weihnachtstag	\N	\N	\N	\N	\N	\N
2029-12-26	t	\N	\N	\N	\N	2. Weihnachtstag	\N	\N	\N	\N	\N	\N
2027-10-31	\N	t	\N	\N	\N	\N	Reformationstag	\N	\N	\N	\N	\N
2028-10-31	\N	t	\N	\N	\N	\N	Reformationstag	\N	\N	\N	\N	\N
2027-11-17	\N	t	\N	\N	\N	\N	Buß- und Bettag	\N	\N	\N	\N	\N
2029-10-31	\N	t	\N	\N	\N	\N	Reformationstag	\N	\N	\N	\N	\N
2028-11-22	\N	t	\N	\N	\N	\N	Buß- und Bettag	\N	\N	\N	\N	\N
2029-11-21	\N	t	\N	\N	\N	\N	Buß- und Bettag	\N	\N	\N	\N	\N
\.


--
-- Data for Name: kalenderbasis; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kalenderbasis (datum, f1, f1text, f2, f2text, f3, f3text, f4, f4text) FROM stdin;
2018-01-03	\N	\N	\N	\N	\N	\N	\N	\N
2018-01-05	\N	\N	\N	\N	\N	\N	\N	\N
2018-01-06	\N	\N	\N	\N	\N	\N	\N	\N
2018-01-07	\N	\N	\N	\N	\N	\N	\N	\N
2018-01-08	\N	\N	\N	\N	\N	\N	\N	\N
2018-01-10	\N	\N	\N	\N	\N	\N	\N	\N
2018-01-11	\N	\N	\N	\N	\N	\N	\N	\N
2018-01-12	\N	\N	\N	\N	\N	\N	\N	\N
2018-01-15	\N	\N	\N	\N	\N	\N	\N	\N
2018-01-16	\N	\N	\N	\N	\N	\N	\N	\N
2018-01-17	\N	\N	\N	\N	\N	\N	\N	\N
2018-01-18	\N	\N	\N	\N	\N	\N	\N	\N
2018-01-19	\N	\N	\N	\N	\N	\N	\N	\N
2018-01-20	\N	\N	\N	\N	\N	\N	\N	\N
2018-01-21	\N	\N	\N	\N	\N	\N	\N	\N
2018-01-22	\N	\N	\N	\N	\N	\N	\N	\N
2018-01-23	\N	\N	\N	\N	\N	\N	\N	\N
2018-01-24	\N	\N	\N	\N	\N	\N	\N	\N
2018-01-25	\N	\N	\N	\N	\N	\N	\N	\N
2018-01-26	\N	\N	\N	\N	\N	\N	\N	\N
2018-01-27	\N	\N	\N	\N	\N	\N	\N	\N
2018-01-28	\N	\N	\N	\N	\N	\N	\N	\N
2018-01-29	\N	\N	\N	\N	\N	\N	\N	\N
2018-01-30	\N	\N	\N	\N	\N	\N	\N	\N
2018-01-31	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-01	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-02	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-03	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-04	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-05	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-06	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-07	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-08	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-09	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-10	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-11	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-12	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-13	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-14	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-15	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-16	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-17	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-18	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-19	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-20	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-21	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-22	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-23	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-24	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-25	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-26	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-27	\N	\N	\N	\N	\N	\N	\N	\N
2018-02-28	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-01	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-02	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-03	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-04	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-05	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-06	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-07	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-08	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-09	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-10	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-11	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-12	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-13	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-14	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-15	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-16	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-17	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-18	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-19	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-20	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-21	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-22	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-23	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-24	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-25	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-26	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-27	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-28	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-29	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-30	\N	\N	\N	\N	\N	\N	\N	\N
2018-03-31	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-01	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-02	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-03	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-04	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-05	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-06	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-07	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-08	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-09	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-10	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-11	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-12	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-13	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-14	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-15	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-16	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-17	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-18	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-19	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-20	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-21	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-22	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-23	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-24	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-25	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-26	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-27	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-28	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-29	\N	\N	\N	\N	\N	\N	\N	\N
2018-04-30	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-01	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-02	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-03	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-04	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-05	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-06	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-07	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-08	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-09	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-10	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-11	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-12	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-13	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-14	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-15	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-16	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-17	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-18	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-19	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-20	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-21	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-22	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-23	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-24	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-25	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-26	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-27	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-28	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-29	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-30	\N	\N	\N	\N	\N	\N	\N	\N
2018-05-31	\N	\N	\N	\N	\N	\N	\N	\N
2018-06-01	\N	\N	\N	\N	\N	\N	\N	\N
2018-06-02	\N	\N	\N	\N	\N	\N	\N	\N
2018-06-03	\N	\N	\N	\N	\N	\N	\N	\N
2018-06-04	\N	\N	\N	\N	\N	\N	\N	\N
2018-06-05	\N	\N	\N	\N	\N	\N	\N	\N
2018-01-04	t	\N	t	\N	\N	\N	\N	\N
2018-01-02	\N	\N	\N	\N	\N	\N	\N	\N
2018-01-09	\N	\N	t	\N	\N	\N	\N	\N
2018-01-14	\N	\N	\N	\N	t	\N	\N	\N
2018-01-13	\N	\N	\N	\N	\N	\N	\N	\N
2018-01-01	t	\N	\N	\N	\N	\N	\N	\N
2018-06-06	\N	\N	\N	\N	\N	\N	\N	\N
2018-06-07	\N	\N	\N	\N	\N	\N	\N	\N
2018-06-08	\N	\N	\N	\N	\N	\N	\N	\N
2018-06-09	\N	\N	\N	\N	\N	\N	\N	\N
2018-06-10	\N	\N	\N	\N	\N	\N	\N	\N
2018-06-11	\N	\N	\N	\N	\N	\N	\N	\N
2018-06-12	\N	\N	\N	\N	\N	\N	\N	\N
2018-06-13	\N	\N	\N	\N	\N	\N	\N	\N
2018-06-14	\N	\N	\N	\N	\N	\N	\N	\N
2018-06-15	\N	\N	\N	\N	\N	\N	\N	\N
2018-06-16	\N	\N	\N	\N	\N	\N	\N	\N
2018-06-17	\N	\N	\N	\N	\N	\N	\N	\N
2018-06-18	\N	\N	\N	\N	\N	\N	\N	\N
2018-06-19	\N	\N	\N	\N	\N	\N	\N	\N
2018-06-20	\N	\N	\N	\N	\N	\N	\N	\N
2018-06-21	\N	\N	\N	\N	\N	\N	\N	\N
2018-06-22	\N	\N	\N	\N	\N	\N	\N	\N
2018-06-23	\N	\N	\N	\N	\N	\N	\N	\N
2018-06-24	\N	\N	\N	\N	\N	\N	\N	\N
2018-06-25	\N	\N	\N	\N	\N	\N	\N	\N
2018-06-26	\N	\N	\N	\N	\N	\N	\N	\N
2018-06-27	\N	\N	\N	\N	\N	\N	\N	\N
2018-06-28	\N	\N	\N	\N	\N	\N	\N	\N
2018-06-29	\N	\N	\N	\N	\N	\N	\N	\N
2018-06-30	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-01	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-02	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-03	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-04	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-05	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-06	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-07	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-08	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-09	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-10	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-11	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-12	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-13	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-14	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-15	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-16	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-17	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-18	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-19	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-20	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-21	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-22	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-23	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-24	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-25	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-26	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-27	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-28	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-29	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-30	\N	\N	\N	\N	\N	\N	\N	\N
2018-07-31	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-01	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-02	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-03	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-04	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-05	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-06	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-07	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-08	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-09	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-10	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-11	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-12	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-13	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-14	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-15	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-16	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-17	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-18	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-19	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-20	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-21	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-22	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-23	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-24	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-25	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-26	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-27	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-28	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-29	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-30	\N	\N	\N	\N	\N	\N	\N	\N
2018-08-31	\N	\N	\N	\N	\N	\N	\N	\N
2018-09-01	\N	\N	\N	\N	\N	\N	\N	\N
2018-09-02	\N	\N	\N	\N	\N	\N	\N	\N
2018-09-03	\N	\N	\N	\N	\N	\N	\N	\N
2018-09-04	\N	\N	\N	\N	\N	\N	\N	\N
2018-09-05	\N	\N	\N	\N	\N	\N	\N	\N
2018-09-06	\N	\N	\N	\N	\N	\N	\N	\N
2018-09-07	\N	\N	\N	\N	\N	\N	\N	\N
2018-09-08	\N	\N	\N	\N	\N	\N	\N	\N
2018-09-09	\N	\N	\N	\N	\N	\N	\N	\N
2018-09-10	\N	\N	\N	\N	\N	\N	\N	\N
2018-09-11	\N	\N	\N	\N	\N	\N	\N	\N
2018-09-12	\N	\N	\N	\N	\N	\N	\N	\N
2018-09-13	\N	\N	\N	\N	\N	\N	\N	\N
2018-09-14	\N	\N	\N	\N	\N	\N	\N	\N
2018-09-15	\N	\N	\N	\N	\N	\N	\N	\N
2018-09-16	\N	\N	\N	\N	\N	\N	\N	\N
2018-09-17	\N	\N	\N	\N	\N	\N	\N	\N
2018-09-18	\N	\N	\N	\N	\N	\N	\N	\N
2018-09-19	\N	\N	\N	\N	\N	\N	\N	\N
2018-09-20	\N	\N	\N	\N	\N	\N	\N	\N
2018-09-21	\N	\N	\N	\N	\N	\N	\N	\N
2018-09-22	\N	\N	\N	\N	\N	\N	\N	\N
2018-09-23	\N	\N	\N	\N	\N	\N	\N	\N
2018-09-24	\N	\N	\N	\N	\N	\N	\N	\N
2018-09-25	\N	\N	\N	\N	\N	\N	\N	\N
2018-09-26	\N	\N	\N	\N	\N	\N	\N	\N
2018-09-27	\N	\N	\N	\N	\N	\N	\N	\N
2018-09-28	\N	\N	\N	\N	\N	\N	\N	\N
2018-09-29	\N	\N	\N	\N	\N	\N	\N	\N
2018-09-30	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-01	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-02	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-03	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-04	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-05	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-06	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-07	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-08	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-09	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-10	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-11	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-12	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-13	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-14	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-15	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-16	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-17	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-18	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-19	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-20	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-21	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-22	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-23	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-24	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-25	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-26	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-27	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-28	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-29	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-30	\N	\N	\N	\N	\N	\N	\N	\N
2018-10-31	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-01	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-02	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-03	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-04	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-05	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-06	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-07	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-08	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-09	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-10	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-11	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-12	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-13	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-14	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-15	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-16	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-17	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-18	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-19	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-20	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-21	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-22	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-23	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-24	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-25	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-26	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-27	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-28	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-29	\N	\N	\N	\N	\N	\N	\N	\N
2018-11-30	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-01	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-02	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-03	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-04	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-05	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-06	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-07	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-08	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-09	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-10	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-11	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-12	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-13	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-14	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-15	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-16	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-17	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-18	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-19	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-20	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-21	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-22	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-23	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-24	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-25	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-26	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-27	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-28	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-29	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-30	\N	\N	\N	\N	\N	\N	\N	\N
2018-12-31	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-01	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-02	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-03	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-04	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-05	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-06	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-07	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-08	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-09	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-10	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-11	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-12	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-13	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-14	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-15	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-16	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-17	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-18	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-19	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-20	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-21	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-22	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-23	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-24	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-25	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-26	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-27	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-28	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-29	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-30	\N	\N	\N	\N	\N	\N	\N	\N
2020-01-31	\N	\N	\N	\N	\N	\N	\N	\N
2020-02-01	\N	\N	\N	\N	\N	\N	\N	\N
2020-02-02	\N	\N	\N	\N	\N	\N	\N	\N
2020-02-03	\N	\N	\N	\N	\N	\N	\N	\N
2020-02-04	\N	\N	\N	\N	\N	\N	\N	\N
2020-02-05	\N	\N	\N	\N	\N	\N	\N	\N
2020-02-06	\N	\N	\N	\N	\N	\N	\N	\N
2020-02-07	\N	\N	\N	\N	\N	\N	\N	\N
2020-02-08	\N	\N	\N	\N	\N	\N	\N	\N
2020-02-09	\N	\N	\N	\N	\N	\N	\N	\N
2020-02-10	\N	\N	\N	\N	\N	\N	\N	\N
2020-02-11	\N	\N	\N	\N	\N	\N	\N	\N
2020-02-12	\N	\N	\N	\N	\N	\N	\N	\N
2020-02-13	\N	\N	\N	\N	\N	\N	\N	\N
2020-02-14	\N	\N	\N	\N	\N	\N	\N	\N
2020-02-15	\N	\N	\N	\N	\N	\N	\N	\N
2020-02-16	\N	\N	\N	\N	\N	\N	\N	\N
2020-02-17	\N	\N	\N	\N	\N	\N	\N	\N
2020-02-18	\N	\N	\N	\N	\N	\N	\N	\N
2020-02-19	\N	\N	\N	\N	\N	\N	\N	\N
2020-02-20	\N	\N	\N	\N	\N	\N	\N	\N
2020-02-21	\N	\N	\N	\N	\N	\N	\N	\N
2020-02-22	\N	\N	\N	\N	\N	\N	\N	\N
2020-02-23	\N	\N	\N	\N	\N	\N	\N	\N
2020-02-24	\N	\N	\N	\N	\N	\N	\N	\N
2020-02-25	\N	\N	\N	\N	\N	\N	\N	\N
2020-02-26	\N	\N	\N	\N	\N	\N	\N	\N
2020-02-27	\N	\N	\N	\N	\N	\N	\N	\N
2020-02-28	\N	\N	\N	\N	\N	\N	\N	\N
2020-02-29	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-01	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-02	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-03	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-04	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-05	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-06	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-07	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-08	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-09	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-10	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-11	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-12	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-13	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-14	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-15	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-16	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-17	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-18	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-19	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-20	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-21	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-22	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-23	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-24	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-25	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-26	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-27	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-28	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-29	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-30	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-31	\N	\N	\N	\N	\N	\N	\N	\N
2020-04-01	\N	\N	\N	\N	\N	\N	\N	\N
2020-04-02	\N	\N	\N	\N	\N	\N	\N	\N
2020-04-03	\N	\N	\N	\N	\N	\N	\N	\N
2020-04-04	\N	\N	\N	\N	\N	\N	\N	\N
2020-04-05	\N	\N	\N	\N	\N	\N	\N	\N
2020-04-06	\N	\N	\N	\N	\N	\N	\N	\N
2020-04-07	\N	\N	\N	\N	\N	\N	\N	\N
2020-04-08	\N	\N	\N	\N	\N	\N	\N	\N
2020-04-09	\N	\N	\N	\N	\N	\N	\N	\N
2020-04-10	\N	\N	\N	\N	\N	\N	\N	\N
2020-04-11	\N	\N	\N	\N	\N	\N	\N	\N
2020-04-12	\N	\N	\N	\N	\N	\N	\N	\N
2020-04-13	\N	\N	\N	\N	\N	\N	\N	\N
2020-04-14	\N	\N	\N	\N	\N	\N	\N	\N
2020-04-15	\N	\N	\N	\N	\N	\N	\N	\N
2020-04-16	\N	\N	\N	\N	\N	\N	\N	\N
2020-04-17	\N	\N	\N	\N	\N	\N	\N	\N
2020-04-18	\N	\N	\N	\N	\N	\N	\N	\N
2020-04-19	\N	\N	\N	\N	\N	\N	\N	\N
2020-04-20	\N	\N	\N	\N	\N	\N	\N	\N
2020-04-21	\N	\N	\N	\N	\N	\N	\N	\N
2020-04-22	\N	\N	\N	\N	\N	\N	\N	\N
2020-04-23	\N	\N	\N	\N	\N	\N	\N	\N
2020-04-24	\N	\N	\N	\N	\N	\N	\N	\N
2020-04-25	\N	\N	\N	\N	\N	\N	\N	\N
2020-04-26	\N	\N	\N	\N	\N	\N	\N	\N
2020-04-27	\N	\N	\N	\N	\N	\N	\N	\N
2020-04-28	\N	\N	\N	\N	\N	\N	\N	\N
2020-04-29	\N	\N	\N	\N	\N	\N	\N	\N
2020-04-30	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-01	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-02	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-03	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-04	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-05	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-06	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-07	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-08	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-09	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-10	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-11	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-12	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-13	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-14	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-15	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-16	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-17	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-18	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-19	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-20	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-21	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-22	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-23	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-24	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-25	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-26	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-27	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-28	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-29	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-30	\N	\N	\N	\N	\N	\N	\N	\N
2020-05-31	\N	\N	\N	\N	\N	\N	\N	\N
2020-06-01	\N	\N	\N	\N	\N	\N	\N	\N
2020-06-02	\N	\N	\N	\N	\N	\N	\N	\N
2020-06-03	\N	\N	\N	\N	\N	\N	\N	\N
2020-06-04	\N	\N	\N	\N	\N	\N	\N	\N
2020-06-05	\N	\N	\N	\N	\N	\N	\N	\N
2020-06-06	\N	\N	\N	\N	\N	\N	\N	\N
2020-06-07	\N	\N	\N	\N	\N	\N	\N	\N
2020-06-08	\N	\N	\N	\N	\N	\N	\N	\N
2020-06-09	\N	\N	\N	\N	\N	\N	\N	\N
2020-06-10	\N	\N	\N	\N	\N	\N	\N	\N
2020-06-11	\N	\N	\N	\N	\N	\N	\N	\N
2020-06-12	\N	\N	\N	\N	\N	\N	\N	\N
2020-06-13	\N	\N	\N	\N	\N	\N	\N	\N
2020-06-14	\N	\N	\N	\N	\N	\N	\N	\N
2020-06-15	\N	\N	\N	\N	\N	\N	\N	\N
2020-06-16	\N	\N	\N	\N	\N	\N	\N	\N
2020-06-17	\N	\N	\N	\N	\N	\N	\N	\N
2020-06-18	\N	\N	\N	\N	\N	\N	\N	\N
2020-06-19	\N	\N	\N	\N	\N	\N	\N	\N
2020-06-20	\N	\N	\N	\N	\N	\N	\N	\N
2020-06-21	\N	\N	\N	\N	\N	\N	\N	\N
2020-06-22	\N	\N	\N	\N	\N	\N	\N	\N
2020-06-23	\N	\N	\N	\N	\N	\N	\N	\N
2020-06-24	\N	\N	\N	\N	\N	\N	\N	\N
2020-06-25	\N	\N	\N	\N	\N	\N	\N	\N
2020-06-26	\N	\N	\N	\N	\N	\N	\N	\N
2020-06-27	\N	\N	\N	\N	\N	\N	\N	\N
2020-06-28	\N	\N	\N	\N	\N	\N	\N	\N
2020-06-29	\N	\N	\N	\N	\N	\N	\N	\N
2020-06-30	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-01	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-02	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-03	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-04	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-05	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-06	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-07	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-08	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-09	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-10	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-11	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-12	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-13	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-14	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-15	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-16	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-17	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-18	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-19	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-20	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-21	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-22	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-23	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-24	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-25	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-26	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-27	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-28	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-29	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-30	\N	\N	\N	\N	\N	\N	\N	\N
2020-07-31	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-01	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-02	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-03	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-04	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-05	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-06	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-07	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-08	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-09	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-10	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-11	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-12	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-13	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-14	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-15	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-16	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-17	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-18	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-19	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-20	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-21	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-22	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-23	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-24	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-25	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-26	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-27	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-28	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-29	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-30	\N	\N	\N	\N	\N	\N	\N	\N
2020-08-31	\N	\N	\N	\N	\N	\N	\N	\N
2020-09-01	\N	\N	\N	\N	\N	\N	\N	\N
2020-09-02	\N	\N	\N	\N	\N	\N	\N	\N
2020-09-03	\N	\N	\N	\N	\N	\N	\N	\N
2020-09-04	\N	\N	\N	\N	\N	\N	\N	\N
2020-09-05	\N	\N	\N	\N	\N	\N	\N	\N
2020-09-06	\N	\N	\N	\N	\N	\N	\N	\N
2020-09-07	\N	\N	\N	\N	\N	\N	\N	\N
2020-09-08	\N	\N	\N	\N	\N	\N	\N	\N
2020-09-09	\N	\N	\N	\N	\N	\N	\N	\N
2020-09-10	\N	\N	\N	\N	\N	\N	\N	\N
2020-09-11	\N	\N	\N	\N	\N	\N	\N	\N
2020-09-12	\N	\N	\N	\N	\N	\N	\N	\N
2020-09-13	\N	\N	\N	\N	\N	\N	\N	\N
2020-09-14	\N	\N	\N	\N	\N	\N	\N	\N
2020-09-15	\N	\N	\N	\N	\N	\N	\N	\N
2020-09-16	\N	\N	\N	\N	\N	\N	\N	\N
2020-09-17	\N	\N	\N	\N	\N	\N	\N	\N
2020-09-18	\N	\N	\N	\N	\N	\N	\N	\N
2020-09-19	\N	\N	\N	\N	\N	\N	\N	\N
2020-09-20	\N	\N	\N	\N	\N	\N	\N	\N
2020-09-21	\N	\N	\N	\N	\N	\N	\N	\N
2020-09-22	\N	\N	\N	\N	\N	\N	\N	\N
2020-09-23	\N	\N	\N	\N	\N	\N	\N	\N
2020-09-24	\N	\N	\N	\N	\N	\N	\N	\N
2020-09-25	\N	\N	\N	\N	\N	\N	\N	\N
2020-09-26	\N	\N	\N	\N	\N	\N	\N	\N
2020-09-27	\N	\N	\N	\N	\N	\N	\N	\N
2020-09-28	\N	\N	\N	\N	\N	\N	\N	\N
2020-09-29	\N	\N	\N	\N	\N	\N	\N	\N
2020-09-30	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-01	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-02	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-03	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-04	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-05	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-06	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-07	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-08	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-09	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-10	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-11	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-12	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-13	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-14	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-15	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-16	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-17	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-18	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-19	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-20	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-21	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-22	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-23	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-24	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-25	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-26	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-27	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-28	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-29	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-30	\N	\N	\N	\N	\N	\N	\N	\N
2020-10-31	\N	\N	\N	\N	\N	\N	\N	\N
2020-11-01	\N	\N	\N	\N	\N	\N	\N	\N
2020-11-02	\N	\N	\N	\N	\N	\N	\N	\N
2020-11-03	\N	\N	\N	\N	\N	\N	\N	\N
2020-11-04	\N	\N	\N	\N	\N	\N	\N	\N
2020-11-05	\N	\N	\N	\N	\N	\N	\N	\N
2020-11-06	\N	\N	\N	\N	\N	\N	\N	\N
2020-11-07	\N	\N	\N	\N	\N	\N	\N	\N
2020-11-08	\N	\N	\N	\N	\N	\N	\N	\N
2020-11-09	\N	\N	\N	\N	\N	\N	\N	\N
2020-11-10	\N	\N	\N	\N	\N	\N	\N	\N
2020-11-11	\N	\N	\N	\N	\N	\N	\N	\N
2020-11-12	\N	\N	\N	\N	\N	\N	\N	\N
2020-11-13	\N	\N	\N	\N	\N	\N	\N	\N
2020-11-14	\N	\N	\N	\N	\N	\N	\N	\N
2020-11-15	\N	\N	\N	\N	\N	\N	\N	\N
2020-11-16	\N	\N	\N	\N	\N	\N	\N	\N
2020-11-17	\N	\N	\N	\N	\N	\N	\N	\N
2020-11-18	\N	\N	\N	\N	\N	\N	\N	\N
2020-11-19	\N	\N	\N	\N	\N	\N	\N	\N
2020-11-20	\N	\N	\N	\N	\N	\N	\N	\N
2020-11-21	\N	\N	\N	\N	\N	\N	\N	\N
2020-11-22	\N	\N	\N	\N	\N	\N	\N	\N
2020-11-23	\N	\N	\N	\N	\N	\N	\N	\N
2020-11-24	\N	\N	\N	\N	\N	\N	\N	\N
2020-11-25	\N	\N	\N	\N	\N	\N	\N	\N
2020-11-26	\N	\N	\N	\N	\N	\N	\N	\N
2020-11-27	\N	\N	\N	\N	\N	\N	\N	\N
2020-11-28	\N	\N	\N	\N	\N	\N	\N	\N
2020-11-29	\N	\N	\N	\N	\N	\N	\N	\N
2020-11-30	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-01	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-02	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-03	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-04	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-05	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-06	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-07	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-08	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-09	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-10	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-11	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-12	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-13	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-14	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-15	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-16	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-17	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-18	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-19	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-20	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-21	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-22	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-23	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-24	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-25	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-26	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-27	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-28	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-29	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-30	\N	\N	\N	\N	\N	\N	\N	\N
2020-12-31	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-01	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-02	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-03	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-04	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-05	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-06	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-07	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-08	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-09	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-10	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-11	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-12	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-13	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-14	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-15	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-16	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-17	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-18	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-19	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-20	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-21	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-22	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-23	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-24	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-25	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-26	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-27	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-28	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-29	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-30	\N	\N	\N	\N	\N	\N	\N	\N
2021-01-31	\N	\N	\N	\N	\N	\N	\N	\N
2021-02-01	\N	\N	\N	\N	\N	\N	\N	\N
2021-02-02	\N	\N	\N	\N	\N	\N	\N	\N
2021-02-03	\N	\N	\N	\N	\N	\N	\N	\N
2021-02-04	\N	\N	\N	\N	\N	\N	\N	\N
2021-02-05	\N	\N	\N	\N	\N	\N	\N	\N
2021-02-06	\N	\N	\N	\N	\N	\N	\N	\N
2021-02-07	\N	\N	\N	\N	\N	\N	\N	\N
2021-02-08	\N	\N	\N	\N	\N	\N	\N	\N
2021-02-09	\N	\N	\N	\N	\N	\N	\N	\N
2021-02-10	\N	\N	\N	\N	\N	\N	\N	\N
2021-02-11	\N	\N	\N	\N	\N	\N	\N	\N
2021-02-12	\N	\N	\N	\N	\N	\N	\N	\N
2021-02-13	\N	\N	\N	\N	\N	\N	\N	\N
2021-02-14	\N	\N	\N	\N	\N	\N	\N	\N
2021-02-15	\N	\N	\N	\N	\N	\N	\N	\N
2021-02-16	\N	\N	\N	\N	\N	\N	\N	\N
2021-02-17	\N	\N	\N	\N	\N	\N	\N	\N
2021-02-18	\N	\N	\N	\N	\N	\N	\N	\N
2021-02-19	\N	\N	\N	\N	\N	\N	\N	\N
2021-02-20	\N	\N	\N	\N	\N	\N	\N	\N
2021-02-21	\N	\N	\N	\N	\N	\N	\N	\N
2021-02-22	\N	\N	\N	\N	\N	\N	\N	\N
2021-02-23	\N	\N	\N	\N	\N	\N	\N	\N
2021-02-24	\N	\N	\N	\N	\N	\N	\N	\N
2021-02-25	\N	\N	\N	\N	\N	\N	\N	\N
2021-02-26	\N	\N	\N	\N	\N	\N	\N	\N
2021-02-27	\N	\N	\N	\N	\N	\N	\N	\N
2021-02-28	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-01	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-02	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-03	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-04	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-05	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-06	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-07	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-08	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-09	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-10	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-11	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-12	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-13	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-14	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-15	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-16	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-17	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-18	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-19	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-20	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-21	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-22	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-23	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-24	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-25	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-26	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-27	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-28	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-29	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-30	\N	\N	\N	\N	\N	\N	\N	\N
2021-03-31	\N	\N	\N	\N	\N	\N	\N	\N
2021-04-01	\N	\N	\N	\N	\N	\N	\N	\N
2021-04-02	\N	\N	\N	\N	\N	\N	\N	\N
2021-04-03	\N	\N	\N	\N	\N	\N	\N	\N
2021-04-04	\N	\N	\N	\N	\N	\N	\N	\N
2021-04-05	\N	\N	\N	\N	\N	\N	\N	\N
2021-04-06	\N	\N	\N	\N	\N	\N	\N	\N
2021-04-07	\N	\N	\N	\N	\N	\N	\N	\N
2021-04-08	\N	\N	\N	\N	\N	\N	\N	\N
2021-04-09	\N	\N	\N	\N	\N	\N	\N	\N
2021-04-10	\N	\N	\N	\N	\N	\N	\N	\N
2021-04-11	\N	\N	\N	\N	\N	\N	\N	\N
2021-04-12	\N	\N	\N	\N	\N	\N	\N	\N
2021-04-13	\N	\N	\N	\N	\N	\N	\N	\N
2021-04-14	\N	\N	\N	\N	\N	\N	\N	\N
2021-04-15	\N	\N	\N	\N	\N	\N	\N	\N
2021-04-16	\N	\N	\N	\N	\N	\N	\N	\N
2021-04-17	\N	\N	\N	\N	\N	\N	\N	\N
2021-04-18	\N	\N	\N	\N	\N	\N	\N	\N
2021-04-19	\N	\N	\N	\N	\N	\N	\N	\N
2021-04-20	\N	\N	\N	\N	\N	\N	\N	\N
2021-04-21	\N	\N	\N	\N	\N	\N	\N	\N
2021-04-22	\N	\N	\N	\N	\N	\N	\N	\N
2021-04-23	\N	\N	\N	\N	\N	\N	\N	\N
2021-04-24	\N	\N	\N	\N	\N	\N	\N	\N
2021-04-25	\N	\N	\N	\N	\N	\N	\N	\N
2021-04-26	\N	\N	\N	\N	\N	\N	\N	\N
2021-04-27	\N	\N	\N	\N	\N	\N	\N	\N
2021-04-28	\N	\N	\N	\N	\N	\N	\N	\N
2021-04-29	\N	\N	\N	\N	\N	\N	\N	\N
2021-04-30	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-01	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-02	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-03	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-04	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-05	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-06	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-07	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-08	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-09	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-10	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-11	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-12	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-13	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-14	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-15	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-16	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-17	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-18	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-19	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-20	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-21	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-22	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-23	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-24	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-25	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-26	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-27	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-28	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-29	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-30	\N	\N	\N	\N	\N	\N	\N	\N
2021-05-31	\N	\N	\N	\N	\N	\N	\N	\N
2021-06-01	\N	\N	\N	\N	\N	\N	\N	\N
2021-06-02	\N	\N	\N	\N	\N	\N	\N	\N
2021-06-03	\N	\N	\N	\N	\N	\N	\N	\N
2021-06-04	\N	\N	\N	\N	\N	\N	\N	\N
2021-06-05	\N	\N	\N	\N	\N	\N	\N	\N
2021-06-06	\N	\N	\N	\N	\N	\N	\N	\N
2021-06-07	\N	\N	\N	\N	\N	\N	\N	\N
2021-06-08	\N	\N	\N	\N	\N	\N	\N	\N
2021-06-09	\N	\N	\N	\N	\N	\N	\N	\N
2021-06-10	\N	\N	\N	\N	\N	\N	\N	\N
2021-06-11	\N	\N	\N	\N	\N	\N	\N	\N
2021-06-12	\N	\N	\N	\N	\N	\N	\N	\N
2021-06-13	\N	\N	\N	\N	\N	\N	\N	\N
2021-06-14	\N	\N	\N	\N	\N	\N	\N	\N
2021-06-15	\N	\N	\N	\N	\N	\N	\N	\N
2021-06-16	\N	\N	\N	\N	\N	\N	\N	\N
2021-06-17	\N	\N	\N	\N	\N	\N	\N	\N
2021-06-18	\N	\N	\N	\N	\N	\N	\N	\N
2021-06-19	\N	\N	\N	\N	\N	\N	\N	\N
2021-06-20	\N	\N	\N	\N	\N	\N	\N	\N
2021-06-21	\N	\N	\N	\N	\N	\N	\N	\N
2021-06-22	\N	\N	\N	\N	\N	\N	\N	\N
2021-06-23	\N	\N	\N	\N	\N	\N	\N	\N
2021-06-24	\N	\N	\N	\N	\N	\N	\N	\N
2021-06-25	\N	\N	\N	\N	\N	\N	\N	\N
2021-06-26	\N	\N	\N	\N	\N	\N	\N	\N
2021-06-27	\N	\N	\N	\N	\N	\N	\N	\N
2021-06-28	\N	\N	\N	\N	\N	\N	\N	\N
2021-06-29	\N	\N	\N	\N	\N	\N	\N	\N
2021-06-30	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-01	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-02	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-03	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-04	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-05	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-06	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-07	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-08	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-09	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-10	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-11	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-12	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-13	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-14	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-15	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-16	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-17	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-18	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-19	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-20	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-21	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-22	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-23	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-24	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-25	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-26	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-27	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-28	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-29	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-30	\N	\N	\N	\N	\N	\N	\N	\N
2021-07-31	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-01	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-02	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-03	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-04	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-05	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-06	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-07	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-08	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-09	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-10	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-11	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-12	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-13	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-14	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-15	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-16	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-17	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-18	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-19	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-20	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-21	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-22	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-23	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-24	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-25	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-26	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-27	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-28	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-29	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-30	\N	\N	\N	\N	\N	\N	\N	\N
2021-08-31	\N	\N	\N	\N	\N	\N	\N	\N
2021-09-01	\N	\N	\N	\N	\N	\N	\N	\N
2021-09-02	\N	\N	\N	\N	\N	\N	\N	\N
2021-09-03	\N	\N	\N	\N	\N	\N	\N	\N
2021-09-04	\N	\N	\N	\N	\N	\N	\N	\N
2021-09-05	\N	\N	\N	\N	\N	\N	\N	\N
2021-09-06	\N	\N	\N	\N	\N	\N	\N	\N
2021-09-07	\N	\N	\N	\N	\N	\N	\N	\N
2021-09-08	\N	\N	\N	\N	\N	\N	\N	\N
2021-09-09	\N	\N	\N	\N	\N	\N	\N	\N
2021-09-10	\N	\N	\N	\N	\N	\N	\N	\N
2021-09-11	\N	\N	\N	\N	\N	\N	\N	\N
2021-09-12	\N	\N	\N	\N	\N	\N	\N	\N
2021-09-13	\N	\N	\N	\N	\N	\N	\N	\N
2021-09-14	\N	\N	\N	\N	\N	\N	\N	\N
2021-09-15	\N	\N	\N	\N	\N	\N	\N	\N
2021-09-16	\N	\N	\N	\N	\N	\N	\N	\N
2021-09-17	\N	\N	\N	\N	\N	\N	\N	\N
2021-09-18	\N	\N	\N	\N	\N	\N	\N	\N
2021-09-19	\N	\N	\N	\N	\N	\N	\N	\N
2021-09-20	\N	\N	\N	\N	\N	\N	\N	\N
2021-09-21	\N	\N	\N	\N	\N	\N	\N	\N
2021-09-22	\N	\N	\N	\N	\N	\N	\N	\N
2021-09-23	\N	\N	\N	\N	\N	\N	\N	\N
2021-09-24	\N	\N	\N	\N	\N	\N	\N	\N
2021-09-25	\N	\N	\N	\N	\N	\N	\N	\N
2021-09-26	\N	\N	\N	\N	\N	\N	\N	\N
2021-09-27	\N	\N	\N	\N	\N	\N	\N	\N
2021-09-28	\N	\N	\N	\N	\N	\N	\N	\N
2021-09-29	\N	\N	\N	\N	\N	\N	\N	\N
2021-09-30	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-01	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-02	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-03	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-04	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-05	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-06	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-07	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-08	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-09	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-10	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-11	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-12	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-13	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-14	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-15	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-16	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-17	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-18	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-19	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-20	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-21	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-22	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-23	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-24	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-25	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-26	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-27	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-28	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-29	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-30	\N	\N	\N	\N	\N	\N	\N	\N
2021-10-31	\N	\N	\N	\N	\N	\N	\N	\N
2021-11-01	\N	\N	\N	\N	\N	\N	\N	\N
2021-11-02	\N	\N	\N	\N	\N	\N	\N	\N
2021-11-03	\N	\N	\N	\N	\N	\N	\N	\N
2021-11-04	\N	\N	\N	\N	\N	\N	\N	\N
2021-11-05	\N	\N	\N	\N	\N	\N	\N	\N
2021-11-06	\N	\N	\N	\N	\N	\N	\N	\N
2021-11-07	\N	\N	\N	\N	\N	\N	\N	\N
2021-11-08	\N	\N	\N	\N	\N	\N	\N	\N
2021-11-09	\N	\N	\N	\N	\N	\N	\N	\N
2021-11-10	\N	\N	\N	\N	\N	\N	\N	\N
2021-11-11	\N	\N	\N	\N	\N	\N	\N	\N
2021-11-12	\N	\N	\N	\N	\N	\N	\N	\N
2021-11-13	\N	\N	\N	\N	\N	\N	\N	\N
2021-11-14	\N	\N	\N	\N	\N	\N	\N	\N
2021-11-15	\N	\N	\N	\N	\N	\N	\N	\N
2021-11-16	\N	\N	\N	\N	\N	\N	\N	\N
2021-11-17	\N	\N	\N	\N	\N	\N	\N	\N
2021-11-18	\N	\N	\N	\N	\N	\N	\N	\N
2021-11-19	\N	\N	\N	\N	\N	\N	\N	\N
2021-11-20	\N	\N	\N	\N	\N	\N	\N	\N
2021-11-21	\N	\N	\N	\N	\N	\N	\N	\N
2021-11-22	\N	\N	\N	\N	\N	\N	\N	\N
2021-11-23	\N	\N	\N	\N	\N	\N	\N	\N
2021-11-24	\N	\N	\N	\N	\N	\N	\N	\N
2021-11-25	\N	\N	\N	\N	\N	\N	\N	\N
2021-11-26	\N	\N	\N	\N	\N	\N	\N	\N
2021-11-27	\N	\N	\N	\N	\N	\N	\N	\N
2021-11-28	\N	\N	\N	\N	\N	\N	\N	\N
2021-11-29	\N	\N	\N	\N	\N	\N	\N	\N
2021-11-30	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-01	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-02	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-03	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-04	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-05	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-06	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-07	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-08	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-09	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-10	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-11	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-12	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-13	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-14	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-15	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-16	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-17	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-18	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-19	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-20	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-21	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-22	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-23	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-24	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-25	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-26	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-27	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-28	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-29	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-30	\N	\N	\N	\N	\N	\N	\N	\N
2021-12-31	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-01	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-02	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-03	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-04	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-05	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-06	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-07	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-08	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-09	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-10	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-11	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-12	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-13	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-14	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-15	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-16	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-17	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-18	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-19	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-20	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-21	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-22	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-23	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-24	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-25	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-26	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-27	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-28	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-29	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-30	\N	\N	\N	\N	\N	\N	\N	\N
2022-01-31	\N	\N	\N	\N	\N	\N	\N	\N
2022-02-01	\N	\N	\N	\N	\N	\N	\N	\N
2022-02-02	\N	\N	\N	\N	\N	\N	\N	\N
2022-02-03	\N	\N	\N	\N	\N	\N	\N	\N
2022-02-04	\N	\N	\N	\N	\N	\N	\N	\N
2022-02-05	\N	\N	\N	\N	\N	\N	\N	\N
2022-02-06	\N	\N	\N	\N	\N	\N	\N	\N
2022-02-07	\N	\N	\N	\N	\N	\N	\N	\N
2022-02-08	\N	\N	\N	\N	\N	\N	\N	\N
2022-02-09	\N	\N	\N	\N	\N	\N	\N	\N
2022-02-10	\N	\N	\N	\N	\N	\N	\N	\N
2022-02-11	\N	\N	\N	\N	\N	\N	\N	\N
2022-02-12	\N	\N	\N	\N	\N	\N	\N	\N
2022-02-13	\N	\N	\N	\N	\N	\N	\N	\N
2022-02-14	\N	\N	\N	\N	\N	\N	\N	\N
2022-02-15	\N	\N	\N	\N	\N	\N	\N	\N
2022-02-16	\N	\N	\N	\N	\N	\N	\N	\N
2022-02-17	\N	\N	\N	\N	\N	\N	\N	\N
2022-02-18	\N	\N	\N	\N	\N	\N	\N	\N
2022-02-19	\N	\N	\N	\N	\N	\N	\N	\N
2022-02-20	\N	\N	\N	\N	\N	\N	\N	\N
2022-02-21	\N	\N	\N	\N	\N	\N	\N	\N
2022-02-22	\N	\N	\N	\N	\N	\N	\N	\N
2022-02-23	\N	\N	\N	\N	\N	\N	\N	\N
2022-02-24	\N	\N	\N	\N	\N	\N	\N	\N
2022-02-25	\N	\N	\N	\N	\N	\N	\N	\N
2022-02-26	\N	\N	\N	\N	\N	\N	\N	\N
2022-02-27	\N	\N	\N	\N	\N	\N	\N	\N
2022-02-28	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-01	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-02	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-03	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-04	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-05	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-06	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-07	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-08	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-09	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-10	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-11	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-12	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-13	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-14	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-15	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-16	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-17	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-18	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-19	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-20	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-21	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-22	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-23	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-24	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-25	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-26	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-27	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-28	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-29	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-30	\N	\N	\N	\N	\N	\N	\N	\N
2022-03-31	\N	\N	\N	\N	\N	\N	\N	\N
2022-04-01	\N	\N	\N	\N	\N	\N	\N	\N
2022-04-02	\N	\N	\N	\N	\N	\N	\N	\N
2022-04-03	\N	\N	\N	\N	\N	\N	\N	\N
2022-04-04	\N	\N	\N	\N	\N	\N	\N	\N
2022-04-05	\N	\N	\N	\N	\N	\N	\N	\N
2022-04-06	\N	\N	\N	\N	\N	\N	\N	\N
2022-04-07	\N	\N	\N	\N	\N	\N	\N	\N
2022-04-08	\N	\N	\N	\N	\N	\N	\N	\N
2022-04-09	\N	\N	\N	\N	\N	\N	\N	\N
2022-04-10	\N	\N	\N	\N	\N	\N	\N	\N
2022-04-11	\N	\N	\N	\N	\N	\N	\N	\N
2022-04-12	\N	\N	\N	\N	\N	\N	\N	\N
2022-04-13	\N	\N	\N	\N	\N	\N	\N	\N
2022-04-14	\N	\N	\N	\N	\N	\N	\N	\N
2022-04-15	\N	\N	\N	\N	\N	\N	\N	\N
2022-04-16	\N	\N	\N	\N	\N	\N	\N	\N
2022-04-17	\N	\N	\N	\N	\N	\N	\N	\N
2022-04-18	\N	\N	\N	\N	\N	\N	\N	\N
2022-04-19	\N	\N	\N	\N	\N	\N	\N	\N
2022-04-20	\N	\N	\N	\N	\N	\N	\N	\N
2022-04-21	\N	\N	\N	\N	\N	\N	\N	\N
2022-04-22	\N	\N	\N	\N	\N	\N	\N	\N
2022-04-23	\N	\N	\N	\N	\N	\N	\N	\N
2022-04-24	\N	\N	\N	\N	\N	\N	\N	\N
2022-04-25	\N	\N	\N	\N	\N	\N	\N	\N
2022-04-26	\N	\N	\N	\N	\N	\N	\N	\N
2022-04-27	\N	\N	\N	\N	\N	\N	\N	\N
2022-04-28	\N	\N	\N	\N	\N	\N	\N	\N
2022-04-29	\N	\N	\N	\N	\N	\N	\N	\N
2022-04-30	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-01	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-02	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-03	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-04	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-05	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-06	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-07	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-08	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-09	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-10	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-11	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-12	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-13	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-14	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-15	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-16	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-17	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-18	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-19	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-20	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-21	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-22	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-23	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-24	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-25	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-26	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-27	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-28	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-29	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-30	\N	\N	\N	\N	\N	\N	\N	\N
2022-05-31	\N	\N	\N	\N	\N	\N	\N	\N
2022-06-01	\N	\N	\N	\N	\N	\N	\N	\N
2022-06-02	\N	\N	\N	\N	\N	\N	\N	\N
2022-06-03	\N	\N	\N	\N	\N	\N	\N	\N
2022-06-04	\N	\N	\N	\N	\N	\N	\N	\N
2022-06-05	\N	\N	\N	\N	\N	\N	\N	\N
2022-06-06	\N	\N	\N	\N	\N	\N	\N	\N
2022-06-07	\N	\N	\N	\N	\N	\N	\N	\N
2022-06-08	\N	\N	\N	\N	\N	\N	\N	\N
2022-06-09	\N	\N	\N	\N	\N	\N	\N	\N
2022-06-10	\N	\N	\N	\N	\N	\N	\N	\N
2022-06-11	\N	\N	\N	\N	\N	\N	\N	\N
2022-06-12	\N	\N	\N	\N	\N	\N	\N	\N
2022-06-13	\N	\N	\N	\N	\N	\N	\N	\N
2022-06-14	\N	\N	\N	\N	\N	\N	\N	\N
2022-06-15	\N	\N	\N	\N	\N	\N	\N	\N
2022-06-16	\N	\N	\N	\N	\N	\N	\N	\N
2022-06-17	\N	\N	\N	\N	\N	\N	\N	\N
2022-06-18	\N	\N	\N	\N	\N	\N	\N	\N
2022-06-19	\N	\N	\N	\N	\N	\N	\N	\N
2022-06-20	\N	\N	\N	\N	\N	\N	\N	\N
2022-06-21	\N	\N	\N	\N	\N	\N	\N	\N
2022-06-22	\N	\N	\N	\N	\N	\N	\N	\N
2022-06-23	\N	\N	\N	\N	\N	\N	\N	\N
2022-06-24	\N	\N	\N	\N	\N	\N	\N	\N
2022-06-25	\N	\N	\N	\N	\N	\N	\N	\N
2022-06-26	\N	\N	\N	\N	\N	\N	\N	\N
2022-06-27	\N	\N	\N	\N	\N	\N	\N	\N
2022-06-28	\N	\N	\N	\N	\N	\N	\N	\N
2022-06-29	\N	\N	\N	\N	\N	\N	\N	\N
2022-06-30	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-01	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-02	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-03	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-04	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-05	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-06	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-07	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-08	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-09	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-10	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-11	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-12	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-13	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-14	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-15	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-16	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-17	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-18	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-19	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-20	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-21	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-22	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-23	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-24	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-25	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-26	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-27	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-28	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-29	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-30	\N	\N	\N	\N	\N	\N	\N	\N
2022-07-31	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-01	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-02	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-03	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-04	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-05	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-06	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-07	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-08	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-09	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-10	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-11	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-12	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-13	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-14	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-15	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-16	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-17	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-18	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-19	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-20	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-21	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-22	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-23	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-24	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-25	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-26	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-27	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-28	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-29	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-30	\N	\N	\N	\N	\N	\N	\N	\N
2022-08-31	\N	\N	\N	\N	\N	\N	\N	\N
2022-09-01	\N	\N	\N	\N	\N	\N	\N	\N
2022-09-02	\N	\N	\N	\N	\N	\N	\N	\N
2022-09-03	\N	\N	\N	\N	\N	\N	\N	\N
2022-09-04	\N	\N	\N	\N	\N	\N	\N	\N
2022-09-05	\N	\N	\N	\N	\N	\N	\N	\N
2022-09-06	\N	\N	\N	\N	\N	\N	\N	\N
2022-09-07	\N	\N	\N	\N	\N	\N	\N	\N
2022-09-08	\N	\N	\N	\N	\N	\N	\N	\N
2022-09-09	\N	\N	\N	\N	\N	\N	\N	\N
2022-09-10	\N	\N	\N	\N	\N	\N	\N	\N
2022-09-11	\N	\N	\N	\N	\N	\N	\N	\N
2022-09-12	\N	\N	\N	\N	\N	\N	\N	\N
2022-09-13	\N	\N	\N	\N	\N	\N	\N	\N
2022-09-14	\N	\N	\N	\N	\N	\N	\N	\N
2022-09-15	\N	\N	\N	\N	\N	\N	\N	\N
2022-09-16	\N	\N	\N	\N	\N	\N	\N	\N
2022-09-17	\N	\N	\N	\N	\N	\N	\N	\N
2022-09-18	\N	\N	\N	\N	\N	\N	\N	\N
2022-09-19	\N	\N	\N	\N	\N	\N	\N	\N
2022-09-20	\N	\N	\N	\N	\N	\N	\N	\N
2022-09-21	\N	\N	\N	\N	\N	\N	\N	\N
2022-09-22	\N	\N	\N	\N	\N	\N	\N	\N
2022-09-23	\N	\N	\N	\N	\N	\N	\N	\N
2022-09-24	\N	\N	\N	\N	\N	\N	\N	\N
2022-09-25	\N	\N	\N	\N	\N	\N	\N	\N
2022-09-26	\N	\N	\N	\N	\N	\N	\N	\N
2022-09-27	\N	\N	\N	\N	\N	\N	\N	\N
2022-09-28	\N	\N	\N	\N	\N	\N	\N	\N
2022-09-29	\N	\N	\N	\N	\N	\N	\N	\N
2022-09-30	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-01	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-02	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-03	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-04	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-05	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-06	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-07	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-08	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-09	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-10	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-11	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-12	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-13	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-14	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-15	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-16	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-17	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-18	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-19	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-20	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-21	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-22	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-23	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-24	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-25	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-26	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-27	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-28	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-29	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-30	\N	\N	\N	\N	\N	\N	\N	\N
2022-10-31	\N	\N	\N	\N	\N	\N	\N	\N
2022-11-01	\N	\N	\N	\N	\N	\N	\N	\N
2022-11-02	\N	\N	\N	\N	\N	\N	\N	\N
2022-11-03	\N	\N	\N	\N	\N	\N	\N	\N
2022-11-04	\N	\N	\N	\N	\N	\N	\N	\N
2022-11-05	\N	\N	\N	\N	\N	\N	\N	\N
2022-11-06	\N	\N	\N	\N	\N	\N	\N	\N
2022-11-07	\N	\N	\N	\N	\N	\N	\N	\N
2022-11-08	\N	\N	\N	\N	\N	\N	\N	\N
2022-11-09	\N	\N	\N	\N	\N	\N	\N	\N
2022-11-10	\N	\N	\N	\N	\N	\N	\N	\N
2022-11-11	\N	\N	\N	\N	\N	\N	\N	\N
2022-11-12	\N	\N	\N	\N	\N	\N	\N	\N
2022-11-13	\N	\N	\N	\N	\N	\N	\N	\N
2022-11-14	\N	\N	\N	\N	\N	\N	\N	\N
2022-11-15	\N	\N	\N	\N	\N	\N	\N	\N
2022-11-16	\N	\N	\N	\N	\N	\N	\N	\N
2022-11-17	\N	\N	\N	\N	\N	\N	\N	\N
2022-11-18	\N	\N	\N	\N	\N	\N	\N	\N
2022-11-19	\N	\N	\N	\N	\N	\N	\N	\N
2022-11-20	\N	\N	\N	\N	\N	\N	\N	\N
2022-11-21	\N	\N	\N	\N	\N	\N	\N	\N
2022-11-22	\N	\N	\N	\N	\N	\N	\N	\N
2022-11-23	\N	\N	\N	\N	\N	\N	\N	\N
2022-11-24	\N	\N	\N	\N	\N	\N	\N	\N
2022-11-25	\N	\N	\N	\N	\N	\N	\N	\N
2022-11-26	\N	\N	\N	\N	\N	\N	\N	\N
2022-11-27	\N	\N	\N	\N	\N	\N	\N	\N
2022-11-28	\N	\N	\N	\N	\N	\N	\N	\N
2022-11-29	\N	\N	\N	\N	\N	\N	\N	\N
2022-11-30	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-01	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-02	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-03	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-04	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-05	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-06	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-07	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-08	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-09	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-10	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-11	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-12	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-13	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-14	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-15	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-16	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-17	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-18	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-19	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-20	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-21	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-22	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-23	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-24	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-25	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-26	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-27	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-28	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-29	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-30	\N	\N	\N	\N	\N	\N	\N	\N
2022-12-31	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-01	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-02	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-03	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-04	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-05	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-06	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-07	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-08	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-09	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-10	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-11	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-12	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-13	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-14	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-15	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-16	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-17	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-18	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-19	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-20	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-21	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-22	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-23	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-24	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-25	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-26	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-27	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-28	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-29	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-30	\N	\N	\N	\N	\N	\N	\N	\N
2023-01-31	\N	\N	\N	\N	\N	\N	\N	\N
2023-02-01	\N	\N	\N	\N	\N	\N	\N	\N
2023-02-02	\N	\N	\N	\N	\N	\N	\N	\N
2023-02-03	\N	\N	\N	\N	\N	\N	\N	\N
2023-02-04	\N	\N	\N	\N	\N	\N	\N	\N
2023-02-05	\N	\N	\N	\N	\N	\N	\N	\N
2023-02-06	\N	\N	\N	\N	\N	\N	\N	\N
2023-02-07	\N	\N	\N	\N	\N	\N	\N	\N
2023-02-08	\N	\N	\N	\N	\N	\N	\N	\N
2023-02-09	\N	\N	\N	\N	\N	\N	\N	\N
2023-02-10	\N	\N	\N	\N	\N	\N	\N	\N
2023-02-11	\N	\N	\N	\N	\N	\N	\N	\N
2023-02-12	\N	\N	\N	\N	\N	\N	\N	\N
2023-02-13	\N	\N	\N	\N	\N	\N	\N	\N
2023-02-14	\N	\N	\N	\N	\N	\N	\N	\N
2023-02-15	\N	\N	\N	\N	\N	\N	\N	\N
2023-02-16	\N	\N	\N	\N	\N	\N	\N	\N
2023-02-17	\N	\N	\N	\N	\N	\N	\N	\N
2023-02-18	\N	\N	\N	\N	\N	\N	\N	\N
2023-02-19	\N	\N	\N	\N	\N	\N	\N	\N
2023-02-20	\N	\N	\N	\N	\N	\N	\N	\N
2023-02-21	\N	\N	\N	\N	\N	\N	\N	\N
2023-02-22	\N	\N	\N	\N	\N	\N	\N	\N
2023-02-23	\N	\N	\N	\N	\N	\N	\N	\N
2023-02-24	\N	\N	\N	\N	\N	\N	\N	\N
2023-02-25	\N	\N	\N	\N	\N	\N	\N	\N
2023-02-26	\N	\N	\N	\N	\N	\N	\N	\N
2023-02-27	\N	\N	\N	\N	\N	\N	\N	\N
2023-02-28	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-01	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-02	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-03	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-04	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-05	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-06	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-07	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-08	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-09	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-10	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-11	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-12	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-13	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-14	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-15	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-16	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-17	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-18	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-19	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-20	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-21	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-22	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-23	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-24	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-25	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-26	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-27	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-28	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-29	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-30	\N	\N	\N	\N	\N	\N	\N	\N
2023-03-31	\N	\N	\N	\N	\N	\N	\N	\N
2023-04-01	\N	\N	\N	\N	\N	\N	\N	\N
2023-04-02	\N	\N	\N	\N	\N	\N	\N	\N
2023-04-03	\N	\N	\N	\N	\N	\N	\N	\N
2023-04-04	\N	\N	\N	\N	\N	\N	\N	\N
2023-04-05	\N	\N	\N	\N	\N	\N	\N	\N
2023-04-06	\N	\N	\N	\N	\N	\N	\N	\N
2023-04-07	\N	\N	\N	\N	\N	\N	\N	\N
2023-04-08	\N	\N	\N	\N	\N	\N	\N	\N
2023-04-09	\N	\N	\N	\N	\N	\N	\N	\N
2023-04-10	\N	\N	\N	\N	\N	\N	\N	\N
2023-04-11	\N	\N	\N	\N	\N	\N	\N	\N
2023-04-12	\N	\N	\N	\N	\N	\N	\N	\N
2023-04-13	\N	\N	\N	\N	\N	\N	\N	\N
2023-04-14	\N	\N	\N	\N	\N	\N	\N	\N
2023-04-15	\N	\N	\N	\N	\N	\N	\N	\N
2023-04-16	\N	\N	\N	\N	\N	\N	\N	\N
2023-04-17	\N	\N	\N	\N	\N	\N	\N	\N
2023-04-18	\N	\N	\N	\N	\N	\N	\N	\N
2023-04-19	\N	\N	\N	\N	\N	\N	\N	\N
2023-04-20	\N	\N	\N	\N	\N	\N	\N	\N
2023-04-21	\N	\N	\N	\N	\N	\N	\N	\N
2023-04-22	\N	\N	\N	\N	\N	\N	\N	\N
2023-04-23	\N	\N	\N	\N	\N	\N	\N	\N
2023-04-24	\N	\N	\N	\N	\N	\N	\N	\N
2023-04-25	\N	\N	\N	\N	\N	\N	\N	\N
2023-04-26	\N	\N	\N	\N	\N	\N	\N	\N
2023-04-27	\N	\N	\N	\N	\N	\N	\N	\N
2023-04-28	\N	\N	\N	\N	\N	\N	\N	\N
2023-04-29	\N	\N	\N	\N	\N	\N	\N	\N
2023-04-30	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-01	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-02	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-03	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-04	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-05	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-06	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-07	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-08	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-09	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-10	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-11	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-12	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-13	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-14	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-15	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-16	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-17	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-18	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-19	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-20	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-21	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-22	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-23	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-24	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-25	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-26	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-27	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-28	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-29	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-30	\N	\N	\N	\N	\N	\N	\N	\N
2023-05-31	\N	\N	\N	\N	\N	\N	\N	\N
2023-06-01	\N	\N	\N	\N	\N	\N	\N	\N
2023-06-02	\N	\N	\N	\N	\N	\N	\N	\N
2023-06-03	\N	\N	\N	\N	\N	\N	\N	\N
2023-06-04	\N	\N	\N	\N	\N	\N	\N	\N
2023-06-05	\N	\N	\N	\N	\N	\N	\N	\N
2023-06-06	\N	\N	\N	\N	\N	\N	\N	\N
2023-06-07	\N	\N	\N	\N	\N	\N	\N	\N
2023-06-08	\N	\N	\N	\N	\N	\N	\N	\N
2023-06-09	\N	\N	\N	\N	\N	\N	\N	\N
2023-06-10	\N	\N	\N	\N	\N	\N	\N	\N
2023-06-11	\N	\N	\N	\N	\N	\N	\N	\N
2023-06-12	\N	\N	\N	\N	\N	\N	\N	\N
2023-06-13	\N	\N	\N	\N	\N	\N	\N	\N
2023-06-14	\N	\N	\N	\N	\N	\N	\N	\N
2023-06-15	\N	\N	\N	\N	\N	\N	\N	\N
2023-06-16	\N	\N	\N	\N	\N	\N	\N	\N
2023-06-17	\N	\N	\N	\N	\N	\N	\N	\N
2023-06-18	\N	\N	\N	\N	\N	\N	\N	\N
2023-06-19	\N	\N	\N	\N	\N	\N	\N	\N
2023-06-20	\N	\N	\N	\N	\N	\N	\N	\N
2023-06-21	\N	\N	\N	\N	\N	\N	\N	\N
2023-06-22	\N	\N	\N	\N	\N	\N	\N	\N
2023-06-23	\N	\N	\N	\N	\N	\N	\N	\N
2023-06-24	\N	\N	\N	\N	\N	\N	\N	\N
2023-06-25	\N	\N	\N	\N	\N	\N	\N	\N
2023-06-26	\N	\N	\N	\N	\N	\N	\N	\N
2023-06-27	\N	\N	\N	\N	\N	\N	\N	\N
2023-06-28	\N	\N	\N	\N	\N	\N	\N	\N
2023-06-29	\N	\N	\N	\N	\N	\N	\N	\N
2023-06-30	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-01	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-02	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-03	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-04	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-05	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-06	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-07	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-08	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-09	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-10	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-11	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-12	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-13	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-14	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-15	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-16	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-17	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-18	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-19	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-20	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-21	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-22	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-23	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-24	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-25	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-26	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-27	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-28	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-29	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-30	\N	\N	\N	\N	\N	\N	\N	\N
2023-07-31	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-01	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-02	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-03	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-04	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-05	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-06	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-07	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-08	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-09	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-10	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-11	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-12	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-13	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-14	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-15	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-16	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-17	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-18	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-19	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-20	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-21	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-22	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-23	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-24	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-25	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-26	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-27	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-28	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-29	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-30	\N	\N	\N	\N	\N	\N	\N	\N
2023-08-31	\N	\N	\N	\N	\N	\N	\N	\N
2023-09-01	\N	\N	\N	\N	\N	\N	\N	\N
2023-09-02	\N	\N	\N	\N	\N	\N	\N	\N
2023-09-03	\N	\N	\N	\N	\N	\N	\N	\N
2023-09-04	\N	\N	\N	\N	\N	\N	\N	\N
2023-09-05	\N	\N	\N	\N	\N	\N	\N	\N
2023-09-06	\N	\N	\N	\N	\N	\N	\N	\N
2023-09-07	\N	\N	\N	\N	\N	\N	\N	\N
2023-09-08	\N	\N	\N	\N	\N	\N	\N	\N
2023-09-09	\N	\N	\N	\N	\N	\N	\N	\N
2023-09-10	\N	\N	\N	\N	\N	\N	\N	\N
2023-09-11	\N	\N	\N	\N	\N	\N	\N	\N
2023-09-12	\N	\N	\N	\N	\N	\N	\N	\N
2023-09-13	\N	\N	\N	\N	\N	\N	\N	\N
2023-09-14	\N	\N	\N	\N	\N	\N	\N	\N
2023-09-15	\N	\N	\N	\N	\N	\N	\N	\N
2023-09-16	\N	\N	\N	\N	\N	\N	\N	\N
2023-09-17	\N	\N	\N	\N	\N	\N	\N	\N
2023-09-18	\N	\N	\N	\N	\N	\N	\N	\N
2023-09-19	\N	\N	\N	\N	\N	\N	\N	\N
2023-09-20	\N	\N	\N	\N	\N	\N	\N	\N
2023-09-21	\N	\N	\N	\N	\N	\N	\N	\N
2023-09-22	\N	\N	\N	\N	\N	\N	\N	\N
2023-09-23	\N	\N	\N	\N	\N	\N	\N	\N
2023-09-24	\N	\N	\N	\N	\N	\N	\N	\N
2023-09-25	\N	\N	\N	\N	\N	\N	\N	\N
2023-09-26	\N	\N	\N	\N	\N	\N	\N	\N
2023-09-27	\N	\N	\N	\N	\N	\N	\N	\N
2023-09-28	\N	\N	\N	\N	\N	\N	\N	\N
2023-09-29	\N	\N	\N	\N	\N	\N	\N	\N
2023-09-30	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-01	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-02	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-03	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-04	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-05	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-06	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-07	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-08	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-09	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-10	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-11	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-12	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-13	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-14	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-15	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-16	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-17	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-18	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-19	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-20	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-21	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-22	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-23	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-24	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-25	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-26	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-27	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-28	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-29	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-30	\N	\N	\N	\N	\N	\N	\N	\N
2023-10-31	\N	\N	\N	\N	\N	\N	\N	\N
2023-11-01	\N	\N	\N	\N	\N	\N	\N	\N
2023-11-02	\N	\N	\N	\N	\N	\N	\N	\N
2023-11-03	\N	\N	\N	\N	\N	\N	\N	\N
2023-11-04	\N	\N	\N	\N	\N	\N	\N	\N
2023-11-05	\N	\N	\N	\N	\N	\N	\N	\N
2023-11-06	\N	\N	\N	\N	\N	\N	\N	\N
2023-11-07	\N	\N	\N	\N	\N	\N	\N	\N
2023-11-08	\N	\N	\N	\N	\N	\N	\N	\N
2023-11-09	\N	\N	\N	\N	\N	\N	\N	\N
2023-11-10	\N	\N	\N	\N	\N	\N	\N	\N
2023-11-11	\N	\N	\N	\N	\N	\N	\N	\N
2023-11-12	\N	\N	\N	\N	\N	\N	\N	\N
2023-11-13	\N	\N	\N	\N	\N	\N	\N	\N
2023-11-14	\N	\N	\N	\N	\N	\N	\N	\N
2023-11-15	\N	\N	\N	\N	\N	\N	\N	\N
2023-11-16	\N	\N	\N	\N	\N	\N	\N	\N
2023-11-17	\N	\N	\N	\N	\N	\N	\N	\N
2023-11-18	\N	\N	\N	\N	\N	\N	\N	\N
2023-11-19	\N	\N	\N	\N	\N	\N	\N	\N
2023-11-20	\N	\N	\N	\N	\N	\N	\N	\N
2023-11-21	\N	\N	\N	\N	\N	\N	\N	\N
2023-11-22	\N	\N	\N	\N	\N	\N	\N	\N
2023-11-23	\N	\N	\N	\N	\N	\N	\N	\N
2023-11-24	\N	\N	\N	\N	\N	\N	\N	\N
2023-11-25	\N	\N	\N	\N	\N	\N	\N	\N
2023-11-26	\N	\N	\N	\N	\N	\N	\N	\N
2023-11-27	\N	\N	\N	\N	\N	\N	\N	\N
2023-11-28	\N	\N	\N	\N	\N	\N	\N	\N
2023-11-29	\N	\N	\N	\N	\N	\N	\N	\N
2023-11-30	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-01	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-02	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-03	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-04	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-05	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-06	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-07	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-08	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-09	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-10	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-11	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-12	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-13	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-14	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-15	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-16	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-17	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-18	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-19	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-20	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-21	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-22	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-23	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-24	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-25	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-26	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-27	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-28	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-29	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-30	\N	\N	\N	\N	\N	\N	\N	\N
2023-12-31	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-01	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-02	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-03	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-04	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-05	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-06	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-07	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-08	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-09	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-10	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-11	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-12	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-13	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-14	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-15	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-16	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-17	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-18	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-19	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-20	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-21	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-22	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-23	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-24	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-25	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-26	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-27	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-28	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-29	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-30	\N	\N	\N	\N	\N	\N	\N	\N
2024-01-31	\N	\N	\N	\N	\N	\N	\N	\N
2024-02-01	\N	\N	\N	\N	\N	\N	\N	\N
2024-02-02	\N	\N	\N	\N	\N	\N	\N	\N
2024-02-03	\N	\N	\N	\N	\N	\N	\N	\N
2024-02-04	\N	\N	\N	\N	\N	\N	\N	\N
2024-02-05	\N	\N	\N	\N	\N	\N	\N	\N
2024-02-06	\N	\N	\N	\N	\N	\N	\N	\N
2024-02-07	\N	\N	\N	\N	\N	\N	\N	\N
2024-02-08	\N	\N	\N	\N	\N	\N	\N	\N
2024-02-09	\N	\N	\N	\N	\N	\N	\N	\N
2024-02-10	\N	\N	\N	\N	\N	\N	\N	\N
2024-02-11	\N	\N	\N	\N	\N	\N	\N	\N
2024-02-12	\N	\N	\N	\N	\N	\N	\N	\N
2024-02-13	\N	\N	\N	\N	\N	\N	\N	\N
2024-02-14	\N	\N	\N	\N	\N	\N	\N	\N
2024-02-15	\N	\N	\N	\N	\N	\N	\N	\N
2024-02-16	\N	\N	\N	\N	\N	\N	\N	\N
2024-02-17	\N	\N	\N	\N	\N	\N	\N	\N
2024-02-18	\N	\N	\N	\N	\N	\N	\N	\N
2024-02-19	\N	\N	\N	\N	\N	\N	\N	\N
2024-02-20	\N	\N	\N	\N	\N	\N	\N	\N
2024-02-21	\N	\N	\N	\N	\N	\N	\N	\N
2024-02-22	\N	\N	\N	\N	\N	\N	\N	\N
2024-02-23	\N	\N	\N	\N	\N	\N	\N	\N
2024-02-24	\N	\N	\N	\N	\N	\N	\N	\N
2024-02-25	\N	\N	\N	\N	\N	\N	\N	\N
2024-02-26	\N	\N	\N	\N	\N	\N	\N	\N
2024-02-27	\N	\N	\N	\N	\N	\N	\N	\N
2024-02-28	\N	\N	\N	\N	\N	\N	\N	\N
2024-02-29	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-01	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-02	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-03	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-04	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-05	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-06	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-07	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-08	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-09	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-10	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-11	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-12	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-13	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-14	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-15	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-16	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-17	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-18	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-19	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-20	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-21	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-22	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-23	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-24	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-25	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-26	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-27	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-28	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-29	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-30	\N	\N	\N	\N	\N	\N	\N	\N
2024-03-31	\N	\N	\N	\N	\N	\N	\N	\N
2024-04-01	\N	\N	\N	\N	\N	\N	\N	\N
2024-04-02	\N	\N	\N	\N	\N	\N	\N	\N
2024-04-03	\N	\N	\N	\N	\N	\N	\N	\N
2024-04-04	\N	\N	\N	\N	\N	\N	\N	\N
2024-04-05	\N	\N	\N	\N	\N	\N	\N	\N
2024-04-06	\N	\N	\N	\N	\N	\N	\N	\N
2024-04-07	\N	\N	\N	\N	\N	\N	\N	\N
2024-04-08	\N	\N	\N	\N	\N	\N	\N	\N
2024-04-09	\N	\N	\N	\N	\N	\N	\N	\N
2024-04-10	\N	\N	\N	\N	\N	\N	\N	\N
2024-04-11	\N	\N	\N	\N	\N	\N	\N	\N
2024-04-12	\N	\N	\N	\N	\N	\N	\N	\N
2024-04-13	\N	\N	\N	\N	\N	\N	\N	\N
2024-04-14	\N	\N	\N	\N	\N	\N	\N	\N
2024-04-15	\N	\N	\N	\N	\N	\N	\N	\N
2024-04-16	\N	\N	\N	\N	\N	\N	\N	\N
2024-04-17	\N	\N	\N	\N	\N	\N	\N	\N
2024-04-18	\N	\N	\N	\N	\N	\N	\N	\N
2024-04-19	\N	\N	\N	\N	\N	\N	\N	\N
2024-04-20	\N	\N	\N	\N	\N	\N	\N	\N
2024-04-21	\N	\N	\N	\N	\N	\N	\N	\N
2024-04-22	\N	\N	\N	\N	\N	\N	\N	\N
2024-04-23	\N	\N	\N	\N	\N	\N	\N	\N
2024-04-24	\N	\N	\N	\N	\N	\N	\N	\N
2024-04-25	\N	\N	\N	\N	\N	\N	\N	\N
2024-04-26	\N	\N	\N	\N	\N	\N	\N	\N
2024-04-27	\N	\N	\N	\N	\N	\N	\N	\N
2024-04-28	\N	\N	\N	\N	\N	\N	\N	\N
2024-04-29	\N	\N	\N	\N	\N	\N	\N	\N
2024-04-30	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-01	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-02	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-03	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-04	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-05	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-06	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-07	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-08	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-09	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-10	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-11	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-12	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-13	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-14	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-15	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-16	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-17	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-18	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-19	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-20	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-21	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-22	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-23	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-24	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-25	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-26	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-27	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-28	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-29	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-30	\N	\N	\N	\N	\N	\N	\N	\N
2024-05-31	\N	\N	\N	\N	\N	\N	\N	\N
2024-06-01	\N	\N	\N	\N	\N	\N	\N	\N
2024-06-02	\N	\N	\N	\N	\N	\N	\N	\N
2024-06-03	\N	\N	\N	\N	\N	\N	\N	\N
2024-06-04	\N	\N	\N	\N	\N	\N	\N	\N
2024-06-05	\N	\N	\N	\N	\N	\N	\N	\N
2024-06-06	\N	\N	\N	\N	\N	\N	\N	\N
2024-06-07	\N	\N	\N	\N	\N	\N	\N	\N
2024-06-08	\N	\N	\N	\N	\N	\N	\N	\N
2024-06-09	\N	\N	\N	\N	\N	\N	\N	\N
2024-06-10	\N	\N	\N	\N	\N	\N	\N	\N
2024-06-11	\N	\N	\N	\N	\N	\N	\N	\N
2024-06-12	\N	\N	\N	\N	\N	\N	\N	\N
2024-06-13	\N	\N	\N	\N	\N	\N	\N	\N
2024-06-14	\N	\N	\N	\N	\N	\N	\N	\N
2024-06-15	\N	\N	\N	\N	\N	\N	\N	\N
2024-06-16	\N	\N	\N	\N	\N	\N	\N	\N
2024-06-17	\N	\N	\N	\N	\N	\N	\N	\N
2024-06-18	\N	\N	\N	\N	\N	\N	\N	\N
2024-06-19	\N	\N	\N	\N	\N	\N	\N	\N
2024-06-20	\N	\N	\N	\N	\N	\N	\N	\N
2024-06-21	\N	\N	\N	\N	\N	\N	\N	\N
2024-06-22	\N	\N	\N	\N	\N	\N	\N	\N
2024-06-23	\N	\N	\N	\N	\N	\N	\N	\N
2024-06-24	\N	\N	\N	\N	\N	\N	\N	\N
2024-06-25	\N	\N	\N	\N	\N	\N	\N	\N
2024-06-26	\N	\N	\N	\N	\N	\N	\N	\N
2024-06-27	\N	\N	\N	\N	\N	\N	\N	\N
2024-06-28	\N	\N	\N	\N	\N	\N	\N	\N
2024-06-29	\N	\N	\N	\N	\N	\N	\N	\N
2024-06-30	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-01	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-02	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-03	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-04	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-05	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-06	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-07	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-08	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-09	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-10	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-11	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-12	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-13	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-14	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-15	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-16	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-17	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-18	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-19	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-20	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-21	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-22	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-23	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-24	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-25	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-26	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-27	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-28	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-29	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-30	\N	\N	\N	\N	\N	\N	\N	\N
2024-07-31	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-01	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-02	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-03	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-04	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-05	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-06	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-07	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-08	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-09	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-10	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-11	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-12	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-13	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-14	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-15	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-16	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-17	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-18	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-19	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-20	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-21	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-22	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-23	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-24	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-25	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-26	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-27	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-28	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-29	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-30	\N	\N	\N	\N	\N	\N	\N	\N
2024-08-31	\N	\N	\N	\N	\N	\N	\N	\N
2024-09-01	\N	\N	\N	\N	\N	\N	\N	\N
2024-09-02	\N	\N	\N	\N	\N	\N	\N	\N
2024-09-03	\N	\N	\N	\N	\N	\N	\N	\N
2024-09-04	\N	\N	\N	\N	\N	\N	\N	\N
2024-09-05	\N	\N	\N	\N	\N	\N	\N	\N
2024-09-06	\N	\N	\N	\N	\N	\N	\N	\N
2024-09-07	\N	\N	\N	\N	\N	\N	\N	\N
2024-09-08	\N	\N	\N	\N	\N	\N	\N	\N
2024-09-09	\N	\N	\N	\N	\N	\N	\N	\N
2024-09-10	\N	\N	\N	\N	\N	\N	\N	\N
2024-09-11	\N	\N	\N	\N	\N	\N	\N	\N
2024-09-12	\N	\N	\N	\N	\N	\N	\N	\N
2024-09-13	\N	\N	\N	\N	\N	\N	\N	\N
2024-09-14	\N	\N	\N	\N	\N	\N	\N	\N
2024-09-15	\N	\N	\N	\N	\N	\N	\N	\N
2024-09-16	\N	\N	\N	\N	\N	\N	\N	\N
2024-09-17	\N	\N	\N	\N	\N	\N	\N	\N
2024-09-18	\N	\N	\N	\N	\N	\N	\N	\N
2024-09-19	\N	\N	\N	\N	\N	\N	\N	\N
2024-09-20	\N	\N	\N	\N	\N	\N	\N	\N
2024-09-21	\N	\N	\N	\N	\N	\N	\N	\N
2024-09-22	\N	\N	\N	\N	\N	\N	\N	\N
2024-09-23	\N	\N	\N	\N	\N	\N	\N	\N
2024-09-24	\N	\N	\N	\N	\N	\N	\N	\N
2024-09-25	\N	\N	\N	\N	\N	\N	\N	\N
2024-09-26	\N	\N	\N	\N	\N	\N	\N	\N
2024-09-27	\N	\N	\N	\N	\N	\N	\N	\N
2024-09-28	\N	\N	\N	\N	\N	\N	\N	\N
2024-09-29	\N	\N	\N	\N	\N	\N	\N	\N
2024-09-30	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-01	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-02	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-03	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-04	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-05	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-06	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-07	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-08	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-09	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-10	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-11	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-12	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-13	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-14	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-15	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-16	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-17	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-18	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-19	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-20	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-21	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-22	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-23	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-24	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-25	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-26	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-27	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-28	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-29	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-30	\N	\N	\N	\N	\N	\N	\N	\N
2024-10-31	\N	\N	\N	\N	\N	\N	\N	\N
2024-11-01	\N	\N	\N	\N	\N	\N	\N	\N
2024-11-02	\N	\N	\N	\N	\N	\N	\N	\N
2024-11-03	\N	\N	\N	\N	\N	\N	\N	\N
2024-11-04	\N	\N	\N	\N	\N	\N	\N	\N
2024-11-05	\N	\N	\N	\N	\N	\N	\N	\N
2024-11-06	\N	\N	\N	\N	\N	\N	\N	\N
2024-11-07	\N	\N	\N	\N	\N	\N	\N	\N
2024-11-08	\N	\N	\N	\N	\N	\N	\N	\N
2024-11-09	\N	\N	\N	\N	\N	\N	\N	\N
2024-11-10	\N	\N	\N	\N	\N	\N	\N	\N
2024-11-11	\N	\N	\N	\N	\N	\N	\N	\N
2024-11-12	\N	\N	\N	\N	\N	\N	\N	\N
2024-11-13	\N	\N	\N	\N	\N	\N	\N	\N
2024-11-14	\N	\N	\N	\N	\N	\N	\N	\N
2024-11-15	\N	\N	\N	\N	\N	\N	\N	\N
2024-11-16	\N	\N	\N	\N	\N	\N	\N	\N
2024-11-17	\N	\N	\N	\N	\N	\N	\N	\N
2024-11-18	\N	\N	\N	\N	\N	\N	\N	\N
2024-11-19	\N	\N	\N	\N	\N	\N	\N	\N
2024-11-20	\N	\N	\N	\N	\N	\N	\N	\N
2024-11-21	\N	\N	\N	\N	\N	\N	\N	\N
2024-11-22	\N	\N	\N	\N	\N	\N	\N	\N
2024-11-23	\N	\N	\N	\N	\N	\N	\N	\N
2024-11-24	\N	\N	\N	\N	\N	\N	\N	\N
2024-11-25	\N	\N	\N	\N	\N	\N	\N	\N
2024-11-26	\N	\N	\N	\N	\N	\N	\N	\N
2024-11-27	\N	\N	\N	\N	\N	\N	\N	\N
2024-11-28	\N	\N	\N	\N	\N	\N	\N	\N
2024-11-29	\N	\N	\N	\N	\N	\N	\N	\N
2024-11-30	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-01	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-02	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-03	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-04	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-05	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-06	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-07	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-08	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-09	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-10	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-11	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-12	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-13	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-14	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-15	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-16	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-17	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-18	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-19	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-20	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-21	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-22	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-23	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-24	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-25	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-26	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-27	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-28	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-29	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-30	\N	\N	\N	\N	\N	\N	\N	\N
2024-12-31	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-01	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-02	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-03	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-04	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-05	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-06	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-07	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-08	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-09	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-10	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-11	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-12	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-13	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-14	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-15	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-16	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-17	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-18	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-19	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-20	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-21	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-22	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-23	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-24	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-25	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-26	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-27	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-28	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-29	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-30	\N	\N	\N	\N	\N	\N	\N	\N
2025-01-31	\N	\N	\N	\N	\N	\N	\N	\N
2025-02-01	\N	\N	\N	\N	\N	\N	\N	\N
2025-02-02	\N	\N	\N	\N	\N	\N	\N	\N
2025-02-03	\N	\N	\N	\N	\N	\N	\N	\N
2025-02-04	\N	\N	\N	\N	\N	\N	\N	\N
2025-02-05	\N	\N	\N	\N	\N	\N	\N	\N
2025-02-06	\N	\N	\N	\N	\N	\N	\N	\N
2025-02-07	\N	\N	\N	\N	\N	\N	\N	\N
2025-02-08	\N	\N	\N	\N	\N	\N	\N	\N
2025-02-09	\N	\N	\N	\N	\N	\N	\N	\N
2025-02-10	\N	\N	\N	\N	\N	\N	\N	\N
2025-02-11	\N	\N	\N	\N	\N	\N	\N	\N
2025-02-12	\N	\N	\N	\N	\N	\N	\N	\N
2025-02-13	\N	\N	\N	\N	\N	\N	\N	\N
2025-02-14	\N	\N	\N	\N	\N	\N	\N	\N
2025-02-15	\N	\N	\N	\N	\N	\N	\N	\N
2025-02-16	\N	\N	\N	\N	\N	\N	\N	\N
2025-02-17	\N	\N	\N	\N	\N	\N	\N	\N
2025-02-18	\N	\N	\N	\N	\N	\N	\N	\N
2025-02-19	\N	\N	\N	\N	\N	\N	\N	\N
2025-02-20	\N	\N	\N	\N	\N	\N	\N	\N
2025-02-21	\N	\N	\N	\N	\N	\N	\N	\N
2025-02-22	\N	\N	\N	\N	\N	\N	\N	\N
2025-02-23	\N	\N	\N	\N	\N	\N	\N	\N
2025-02-24	\N	\N	\N	\N	\N	\N	\N	\N
2025-02-25	\N	\N	\N	\N	\N	\N	\N	\N
2025-02-26	\N	\N	\N	\N	\N	\N	\N	\N
2025-02-27	\N	\N	\N	\N	\N	\N	\N	\N
2025-02-28	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-01	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-02	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-03	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-04	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-05	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-06	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-07	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-08	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-09	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-10	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-11	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-12	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-13	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-14	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-15	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-16	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-17	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-18	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-19	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-20	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-21	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-22	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-23	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-24	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-25	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-26	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-27	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-28	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-29	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-30	\N	\N	\N	\N	\N	\N	\N	\N
2025-03-31	\N	\N	\N	\N	\N	\N	\N	\N
2025-04-01	\N	\N	\N	\N	\N	\N	\N	\N
2025-04-02	\N	\N	\N	\N	\N	\N	\N	\N
2025-04-03	\N	\N	\N	\N	\N	\N	\N	\N
2025-04-04	\N	\N	\N	\N	\N	\N	\N	\N
2025-04-05	\N	\N	\N	\N	\N	\N	\N	\N
2025-04-06	\N	\N	\N	\N	\N	\N	\N	\N
2025-04-07	\N	\N	\N	\N	\N	\N	\N	\N
2025-04-08	\N	\N	\N	\N	\N	\N	\N	\N
2025-04-09	\N	\N	\N	\N	\N	\N	\N	\N
2025-04-10	\N	\N	\N	\N	\N	\N	\N	\N
2025-04-11	\N	\N	\N	\N	\N	\N	\N	\N
2025-04-12	\N	\N	\N	\N	\N	\N	\N	\N
2025-04-13	\N	\N	\N	\N	\N	\N	\N	\N
2025-04-14	\N	\N	\N	\N	\N	\N	\N	\N
2025-04-15	\N	\N	\N	\N	\N	\N	\N	\N
2025-04-16	\N	\N	\N	\N	\N	\N	\N	\N
2025-04-17	\N	\N	\N	\N	\N	\N	\N	\N
2025-04-18	\N	\N	\N	\N	\N	\N	\N	\N
2025-04-19	\N	\N	\N	\N	\N	\N	\N	\N
2025-04-20	\N	\N	\N	\N	\N	\N	\N	\N
2025-04-21	\N	\N	\N	\N	\N	\N	\N	\N
2025-04-22	\N	\N	\N	\N	\N	\N	\N	\N
2025-04-23	\N	\N	\N	\N	\N	\N	\N	\N
2025-04-24	\N	\N	\N	\N	\N	\N	\N	\N
2025-04-25	\N	\N	\N	\N	\N	\N	\N	\N
2025-04-26	\N	\N	\N	\N	\N	\N	\N	\N
2025-04-27	\N	\N	\N	\N	\N	\N	\N	\N
2025-04-28	\N	\N	\N	\N	\N	\N	\N	\N
2025-04-29	\N	\N	\N	\N	\N	\N	\N	\N
2025-04-30	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-01	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-02	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-03	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-04	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-05	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-06	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-07	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-08	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-09	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-10	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-11	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-12	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-13	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-14	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-15	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-16	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-17	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-18	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-19	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-20	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-21	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-22	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-23	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-24	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-25	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-26	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-27	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-28	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-29	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-30	\N	\N	\N	\N	\N	\N	\N	\N
2025-05-31	\N	\N	\N	\N	\N	\N	\N	\N
2025-06-01	\N	\N	\N	\N	\N	\N	\N	\N
2025-06-02	\N	\N	\N	\N	\N	\N	\N	\N
2025-06-03	\N	\N	\N	\N	\N	\N	\N	\N
2025-06-04	\N	\N	\N	\N	\N	\N	\N	\N
2025-06-05	\N	\N	\N	\N	\N	\N	\N	\N
2025-06-06	\N	\N	\N	\N	\N	\N	\N	\N
2025-06-07	\N	\N	\N	\N	\N	\N	\N	\N
2025-06-08	\N	\N	\N	\N	\N	\N	\N	\N
2025-06-09	\N	\N	\N	\N	\N	\N	\N	\N
2025-06-10	\N	\N	\N	\N	\N	\N	\N	\N
2025-06-11	\N	\N	\N	\N	\N	\N	\N	\N
2025-06-12	\N	\N	\N	\N	\N	\N	\N	\N
2025-06-13	\N	\N	\N	\N	\N	\N	\N	\N
2025-06-14	\N	\N	\N	\N	\N	\N	\N	\N
2025-06-15	\N	\N	\N	\N	\N	\N	\N	\N
2025-06-16	\N	\N	\N	\N	\N	\N	\N	\N
2025-06-17	\N	\N	\N	\N	\N	\N	\N	\N
2025-06-18	\N	\N	\N	\N	\N	\N	\N	\N
2025-06-19	\N	\N	\N	\N	\N	\N	\N	\N
2025-06-20	\N	\N	\N	\N	\N	\N	\N	\N
2025-06-21	\N	\N	\N	\N	\N	\N	\N	\N
2025-06-22	\N	\N	\N	\N	\N	\N	\N	\N
2025-06-23	\N	\N	\N	\N	\N	\N	\N	\N
2025-06-24	\N	\N	\N	\N	\N	\N	\N	\N
2025-06-25	\N	\N	\N	\N	\N	\N	\N	\N
2025-06-26	\N	\N	\N	\N	\N	\N	\N	\N
2025-06-27	\N	\N	\N	\N	\N	\N	\N	\N
2025-06-28	\N	\N	\N	\N	\N	\N	\N	\N
2025-06-29	\N	\N	\N	\N	\N	\N	\N	\N
2025-06-30	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-01	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-02	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-03	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-04	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-05	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-06	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-07	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-08	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-09	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-10	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-11	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-12	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-13	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-14	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-15	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-16	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-17	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-18	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-19	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-20	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-21	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-22	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-23	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-24	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-25	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-26	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-27	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-28	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-29	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-30	\N	\N	\N	\N	\N	\N	\N	\N
2025-07-31	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-01	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-02	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-03	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-04	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-05	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-06	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-07	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-08	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-09	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-10	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-11	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-12	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-13	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-14	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-15	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-16	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-17	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-18	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-19	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-20	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-21	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-22	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-23	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-24	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-25	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-26	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-27	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-28	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-29	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-30	\N	\N	\N	\N	\N	\N	\N	\N
2025-08-31	\N	\N	\N	\N	\N	\N	\N	\N
2025-09-01	\N	\N	\N	\N	\N	\N	\N	\N
2025-09-02	\N	\N	\N	\N	\N	\N	\N	\N
2025-09-03	\N	\N	\N	\N	\N	\N	\N	\N
2025-09-04	\N	\N	\N	\N	\N	\N	\N	\N
2025-09-05	\N	\N	\N	\N	\N	\N	\N	\N
2025-09-06	\N	\N	\N	\N	\N	\N	\N	\N
2025-09-07	\N	\N	\N	\N	\N	\N	\N	\N
2025-09-08	\N	\N	\N	\N	\N	\N	\N	\N
2025-09-09	\N	\N	\N	\N	\N	\N	\N	\N
2025-09-10	\N	\N	\N	\N	\N	\N	\N	\N
2025-09-11	\N	\N	\N	\N	\N	\N	\N	\N
2025-09-12	\N	\N	\N	\N	\N	\N	\N	\N
2025-09-13	\N	\N	\N	\N	\N	\N	\N	\N
2025-09-14	\N	\N	\N	\N	\N	\N	\N	\N
2025-09-15	\N	\N	\N	\N	\N	\N	\N	\N
2025-09-16	\N	\N	\N	\N	\N	\N	\N	\N
2025-09-17	\N	\N	\N	\N	\N	\N	\N	\N
2025-09-18	\N	\N	\N	\N	\N	\N	\N	\N
2025-09-19	\N	\N	\N	\N	\N	\N	\N	\N
2025-09-20	\N	\N	\N	\N	\N	\N	\N	\N
2025-09-21	\N	\N	\N	\N	\N	\N	\N	\N
2025-09-22	\N	\N	\N	\N	\N	\N	\N	\N
2025-09-23	\N	\N	\N	\N	\N	\N	\N	\N
2025-09-24	\N	\N	\N	\N	\N	\N	\N	\N
2025-09-25	\N	\N	\N	\N	\N	\N	\N	\N
2025-09-26	\N	\N	\N	\N	\N	\N	\N	\N
2025-09-27	\N	\N	\N	\N	\N	\N	\N	\N
2025-09-28	\N	\N	\N	\N	\N	\N	\N	\N
2025-09-29	\N	\N	\N	\N	\N	\N	\N	\N
2025-09-30	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-01	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-02	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-03	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-04	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-05	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-06	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-07	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-08	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-09	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-10	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-11	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-12	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-13	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-14	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-15	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-16	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-17	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-18	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-19	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-20	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-21	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-22	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-23	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-24	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-25	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-26	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-27	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-28	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-29	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-30	\N	\N	\N	\N	\N	\N	\N	\N
2025-10-31	\N	\N	\N	\N	\N	\N	\N	\N
2025-11-01	\N	\N	\N	\N	\N	\N	\N	\N
2025-11-02	\N	\N	\N	\N	\N	\N	\N	\N
2025-11-03	\N	\N	\N	\N	\N	\N	\N	\N
2025-11-04	\N	\N	\N	\N	\N	\N	\N	\N
2025-11-05	\N	\N	\N	\N	\N	\N	\N	\N
2025-11-06	\N	\N	\N	\N	\N	\N	\N	\N
2025-11-07	\N	\N	\N	\N	\N	\N	\N	\N
2025-11-08	\N	\N	\N	\N	\N	\N	\N	\N
2025-11-09	\N	\N	\N	\N	\N	\N	\N	\N
2025-11-10	\N	\N	\N	\N	\N	\N	\N	\N
2025-11-11	\N	\N	\N	\N	\N	\N	\N	\N
2025-11-12	\N	\N	\N	\N	\N	\N	\N	\N
2025-11-13	\N	\N	\N	\N	\N	\N	\N	\N
2025-11-14	\N	\N	\N	\N	\N	\N	\N	\N
2025-11-15	\N	\N	\N	\N	\N	\N	\N	\N
2025-11-16	\N	\N	\N	\N	\N	\N	\N	\N
2025-11-17	\N	\N	\N	\N	\N	\N	\N	\N
2025-11-18	\N	\N	\N	\N	\N	\N	\N	\N
2025-11-19	\N	\N	\N	\N	\N	\N	\N	\N
2025-11-20	\N	\N	\N	\N	\N	\N	\N	\N
2025-11-21	\N	\N	\N	\N	\N	\N	\N	\N
2025-11-22	\N	\N	\N	\N	\N	\N	\N	\N
2025-11-23	\N	\N	\N	\N	\N	\N	\N	\N
2025-11-24	\N	\N	\N	\N	\N	\N	\N	\N
2025-11-25	\N	\N	\N	\N	\N	\N	\N	\N
2025-11-26	\N	\N	\N	\N	\N	\N	\N	\N
2025-11-27	\N	\N	\N	\N	\N	\N	\N	\N
2025-11-28	\N	\N	\N	\N	\N	\N	\N	\N
2025-11-29	\N	\N	\N	\N	\N	\N	\N	\N
2025-11-30	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-01	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-02	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-03	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-04	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-05	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-06	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-07	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-08	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-09	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-10	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-11	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-12	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-13	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-14	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-15	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-16	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-17	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-18	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-19	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-20	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-21	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-22	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-23	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-24	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-25	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-26	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-27	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-28	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-29	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-30	\N	\N	\N	\N	\N	\N	\N	\N
2025-12-31	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-01	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-02	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-03	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-04	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-05	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-06	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-07	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-08	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-09	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-10	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-11	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-12	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-13	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-14	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-15	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-16	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-17	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-18	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-19	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-20	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-21	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-22	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-23	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-24	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-25	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-26	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-27	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-28	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-29	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-30	\N	\N	\N	\N	\N	\N	\N	\N
2026-01-31	\N	\N	\N	\N	\N	\N	\N	\N
2026-02-01	\N	\N	\N	\N	\N	\N	\N	\N
2026-02-02	\N	\N	\N	\N	\N	\N	\N	\N
2026-02-03	\N	\N	\N	\N	\N	\N	\N	\N
2026-02-04	\N	\N	\N	\N	\N	\N	\N	\N
2026-02-05	\N	\N	\N	\N	\N	\N	\N	\N
2026-02-06	\N	\N	\N	\N	\N	\N	\N	\N
2026-02-07	\N	\N	\N	\N	\N	\N	\N	\N
2026-02-08	\N	\N	\N	\N	\N	\N	\N	\N
2026-02-09	\N	\N	\N	\N	\N	\N	\N	\N
2026-02-10	\N	\N	\N	\N	\N	\N	\N	\N
2026-02-11	\N	\N	\N	\N	\N	\N	\N	\N
2026-02-12	\N	\N	\N	\N	\N	\N	\N	\N
2026-02-13	\N	\N	\N	\N	\N	\N	\N	\N
2026-02-14	\N	\N	\N	\N	\N	\N	\N	\N
2026-02-15	\N	\N	\N	\N	\N	\N	\N	\N
2026-02-16	\N	\N	\N	\N	\N	\N	\N	\N
2026-02-17	\N	\N	\N	\N	\N	\N	\N	\N
2026-02-18	\N	\N	\N	\N	\N	\N	\N	\N
2026-02-19	\N	\N	\N	\N	\N	\N	\N	\N
2026-02-20	\N	\N	\N	\N	\N	\N	\N	\N
2026-02-21	\N	\N	\N	\N	\N	\N	\N	\N
2026-02-22	\N	\N	\N	\N	\N	\N	\N	\N
2026-02-23	\N	\N	\N	\N	\N	\N	\N	\N
2026-02-24	\N	\N	\N	\N	\N	\N	\N	\N
2026-02-25	\N	\N	\N	\N	\N	\N	\N	\N
2026-02-26	\N	\N	\N	\N	\N	\N	\N	\N
2026-02-27	\N	\N	\N	\N	\N	\N	\N	\N
2026-02-28	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-01	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-02	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-03	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-04	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-05	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-06	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-07	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-08	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-09	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-10	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-11	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-12	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-13	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-14	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-15	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-16	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-17	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-18	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-19	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-20	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-21	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-22	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-23	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-24	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-25	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-26	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-27	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-28	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-29	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-30	\N	\N	\N	\N	\N	\N	\N	\N
2026-03-31	\N	\N	\N	\N	\N	\N	\N	\N
2026-04-01	\N	\N	\N	\N	\N	\N	\N	\N
2026-04-02	\N	\N	\N	\N	\N	\N	\N	\N
2026-04-03	\N	\N	\N	\N	\N	\N	\N	\N
2026-04-04	\N	\N	\N	\N	\N	\N	\N	\N
2026-04-05	\N	\N	\N	\N	\N	\N	\N	\N
2026-04-06	\N	\N	\N	\N	\N	\N	\N	\N
2026-04-07	\N	\N	\N	\N	\N	\N	\N	\N
2026-04-08	\N	\N	\N	\N	\N	\N	\N	\N
2026-04-09	\N	\N	\N	\N	\N	\N	\N	\N
2026-04-10	\N	\N	\N	\N	\N	\N	\N	\N
2026-04-11	\N	\N	\N	\N	\N	\N	\N	\N
2026-04-12	\N	\N	\N	\N	\N	\N	\N	\N
2026-04-13	\N	\N	\N	\N	\N	\N	\N	\N
2026-04-14	\N	\N	\N	\N	\N	\N	\N	\N
2026-04-15	\N	\N	\N	\N	\N	\N	\N	\N
2026-04-16	\N	\N	\N	\N	\N	\N	\N	\N
2026-04-17	\N	\N	\N	\N	\N	\N	\N	\N
2026-04-18	\N	\N	\N	\N	\N	\N	\N	\N
2026-04-19	\N	\N	\N	\N	\N	\N	\N	\N
2026-04-20	\N	\N	\N	\N	\N	\N	\N	\N
2026-04-21	\N	\N	\N	\N	\N	\N	\N	\N
2026-04-22	\N	\N	\N	\N	\N	\N	\N	\N
2026-04-23	\N	\N	\N	\N	\N	\N	\N	\N
2026-04-24	\N	\N	\N	\N	\N	\N	\N	\N
2026-04-25	\N	\N	\N	\N	\N	\N	\N	\N
2026-04-26	\N	\N	\N	\N	\N	\N	\N	\N
2026-04-27	\N	\N	\N	\N	\N	\N	\N	\N
2026-04-28	\N	\N	\N	\N	\N	\N	\N	\N
2026-04-29	\N	\N	\N	\N	\N	\N	\N	\N
2026-04-30	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-01	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-02	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-03	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-04	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-05	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-06	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-07	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-08	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-09	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-10	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-11	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-12	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-13	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-14	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-15	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-16	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-17	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-18	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-19	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-20	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-21	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-22	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-23	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-24	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-25	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-26	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-27	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-28	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-29	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-30	\N	\N	\N	\N	\N	\N	\N	\N
2026-05-31	\N	\N	\N	\N	\N	\N	\N	\N
2026-06-01	\N	\N	\N	\N	\N	\N	\N	\N
2026-06-02	\N	\N	\N	\N	\N	\N	\N	\N
2026-06-03	\N	\N	\N	\N	\N	\N	\N	\N
2026-06-04	\N	\N	\N	\N	\N	\N	\N	\N
2026-06-05	\N	\N	\N	\N	\N	\N	\N	\N
2026-06-06	\N	\N	\N	\N	\N	\N	\N	\N
2026-06-07	\N	\N	\N	\N	\N	\N	\N	\N
2026-06-08	\N	\N	\N	\N	\N	\N	\N	\N
2026-06-09	\N	\N	\N	\N	\N	\N	\N	\N
2026-06-10	\N	\N	\N	\N	\N	\N	\N	\N
2026-06-11	\N	\N	\N	\N	\N	\N	\N	\N
2026-06-12	\N	\N	\N	\N	\N	\N	\N	\N
2026-06-13	\N	\N	\N	\N	\N	\N	\N	\N
2026-06-14	\N	\N	\N	\N	\N	\N	\N	\N
2026-06-15	\N	\N	\N	\N	\N	\N	\N	\N
2026-06-16	\N	\N	\N	\N	\N	\N	\N	\N
2026-06-17	\N	\N	\N	\N	\N	\N	\N	\N
2026-06-18	\N	\N	\N	\N	\N	\N	\N	\N
2026-06-19	\N	\N	\N	\N	\N	\N	\N	\N
2026-06-20	\N	\N	\N	\N	\N	\N	\N	\N
2026-06-21	\N	\N	\N	\N	\N	\N	\N	\N
2026-06-22	\N	\N	\N	\N	\N	\N	\N	\N
2026-06-23	\N	\N	\N	\N	\N	\N	\N	\N
2026-06-24	\N	\N	\N	\N	\N	\N	\N	\N
2026-06-25	\N	\N	\N	\N	\N	\N	\N	\N
2026-06-26	\N	\N	\N	\N	\N	\N	\N	\N
2026-06-27	\N	\N	\N	\N	\N	\N	\N	\N
2026-06-28	\N	\N	\N	\N	\N	\N	\N	\N
2026-06-29	\N	\N	\N	\N	\N	\N	\N	\N
2026-06-30	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-01	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-02	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-03	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-04	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-05	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-06	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-07	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-08	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-09	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-10	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-11	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-12	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-13	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-14	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-15	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-16	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-17	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-18	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-19	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-20	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-21	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-22	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-23	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-24	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-25	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-26	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-27	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-28	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-29	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-30	\N	\N	\N	\N	\N	\N	\N	\N
2026-07-31	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-01	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-02	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-03	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-04	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-05	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-06	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-07	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-08	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-09	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-10	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-11	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-12	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-13	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-14	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-15	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-16	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-17	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-18	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-19	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-20	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-21	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-22	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-23	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-24	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-25	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-26	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-27	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-28	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-29	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-30	\N	\N	\N	\N	\N	\N	\N	\N
2026-08-31	\N	\N	\N	\N	\N	\N	\N	\N
2026-09-01	\N	\N	\N	\N	\N	\N	\N	\N
2026-09-02	\N	\N	\N	\N	\N	\N	\N	\N
2026-09-03	\N	\N	\N	\N	\N	\N	\N	\N
2026-09-04	\N	\N	\N	\N	\N	\N	\N	\N
2026-09-05	\N	\N	\N	\N	\N	\N	\N	\N
2026-09-06	\N	\N	\N	\N	\N	\N	\N	\N
2026-09-07	\N	\N	\N	\N	\N	\N	\N	\N
2026-09-08	\N	\N	\N	\N	\N	\N	\N	\N
2026-09-09	\N	\N	\N	\N	\N	\N	\N	\N
2026-09-10	\N	\N	\N	\N	\N	\N	\N	\N
2026-09-11	\N	\N	\N	\N	\N	\N	\N	\N
2026-09-12	\N	\N	\N	\N	\N	\N	\N	\N
2026-09-13	\N	\N	\N	\N	\N	\N	\N	\N
2026-09-14	\N	\N	\N	\N	\N	\N	\N	\N
2026-09-15	\N	\N	\N	\N	\N	\N	\N	\N
2026-09-16	\N	\N	\N	\N	\N	\N	\N	\N
2026-09-17	\N	\N	\N	\N	\N	\N	\N	\N
2026-09-18	\N	\N	\N	\N	\N	\N	\N	\N
2026-09-19	\N	\N	\N	\N	\N	\N	\N	\N
2026-09-20	\N	\N	\N	\N	\N	\N	\N	\N
2026-09-21	\N	\N	\N	\N	\N	\N	\N	\N
2026-09-22	\N	\N	\N	\N	\N	\N	\N	\N
2026-09-23	\N	\N	\N	\N	\N	\N	\N	\N
2026-09-24	\N	\N	\N	\N	\N	\N	\N	\N
2026-09-25	\N	\N	\N	\N	\N	\N	\N	\N
2026-09-26	\N	\N	\N	\N	\N	\N	\N	\N
2026-09-27	\N	\N	\N	\N	\N	\N	\N	\N
2026-09-28	\N	\N	\N	\N	\N	\N	\N	\N
2026-09-29	\N	\N	\N	\N	\N	\N	\N	\N
2026-09-30	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-01	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-02	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-03	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-04	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-05	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-06	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-07	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-08	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-09	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-10	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-11	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-12	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-13	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-14	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-15	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-16	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-17	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-18	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-19	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-20	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-21	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-22	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-23	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-24	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-25	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-26	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-27	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-28	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-29	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-30	\N	\N	\N	\N	\N	\N	\N	\N
2026-10-31	\N	\N	\N	\N	\N	\N	\N	\N
2026-11-01	\N	\N	\N	\N	\N	\N	\N	\N
2026-11-02	\N	\N	\N	\N	\N	\N	\N	\N
2026-11-03	\N	\N	\N	\N	\N	\N	\N	\N
2026-11-04	\N	\N	\N	\N	\N	\N	\N	\N
2026-11-05	\N	\N	\N	\N	\N	\N	\N	\N
2026-11-06	\N	\N	\N	\N	\N	\N	\N	\N
2026-11-07	\N	\N	\N	\N	\N	\N	\N	\N
2026-11-08	\N	\N	\N	\N	\N	\N	\N	\N
2026-11-09	\N	\N	\N	\N	\N	\N	\N	\N
2026-11-10	\N	\N	\N	\N	\N	\N	\N	\N
2026-11-11	\N	\N	\N	\N	\N	\N	\N	\N
2026-11-12	\N	\N	\N	\N	\N	\N	\N	\N
2026-11-13	\N	\N	\N	\N	\N	\N	\N	\N
2026-11-14	\N	\N	\N	\N	\N	\N	\N	\N
2026-11-15	\N	\N	\N	\N	\N	\N	\N	\N
2026-11-16	\N	\N	\N	\N	\N	\N	\N	\N
2026-11-17	\N	\N	\N	\N	\N	\N	\N	\N
2026-11-18	\N	\N	\N	\N	\N	\N	\N	\N
2026-11-19	\N	\N	\N	\N	\N	\N	\N	\N
2026-11-20	\N	\N	\N	\N	\N	\N	\N	\N
2026-11-21	\N	\N	\N	\N	\N	\N	\N	\N
2026-11-22	\N	\N	\N	\N	\N	\N	\N	\N
2026-11-23	\N	\N	\N	\N	\N	\N	\N	\N
2026-11-24	\N	\N	\N	\N	\N	\N	\N	\N
2026-11-25	\N	\N	\N	\N	\N	\N	\N	\N
2026-11-26	\N	\N	\N	\N	\N	\N	\N	\N
2026-11-27	\N	\N	\N	\N	\N	\N	\N	\N
2026-11-28	\N	\N	\N	\N	\N	\N	\N	\N
2026-11-29	\N	\N	\N	\N	\N	\N	\N	\N
2026-11-30	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-01	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-02	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-03	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-04	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-05	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-06	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-07	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-08	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-09	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-10	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-11	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-12	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-13	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-14	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-15	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-16	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-17	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-18	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-19	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-20	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-21	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-22	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-23	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-24	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-25	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-26	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-27	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-28	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-29	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-30	\N	\N	\N	\N	\N	\N	\N	\N
2026-12-31	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-01	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-02	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-03	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-04	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-05	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-06	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-07	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-08	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-09	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-10	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-11	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-12	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-13	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-14	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-15	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-16	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-17	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-18	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-19	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-20	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-21	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-22	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-23	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-24	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-25	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-26	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-27	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-28	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-29	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-30	\N	\N	\N	\N	\N	\N	\N	\N
2027-01-31	\N	\N	\N	\N	\N	\N	\N	\N
2027-02-01	\N	\N	\N	\N	\N	\N	\N	\N
2027-02-02	\N	\N	\N	\N	\N	\N	\N	\N
2027-02-03	\N	\N	\N	\N	\N	\N	\N	\N
2027-02-04	\N	\N	\N	\N	\N	\N	\N	\N
2027-02-05	\N	\N	\N	\N	\N	\N	\N	\N
2027-02-06	\N	\N	\N	\N	\N	\N	\N	\N
2027-02-07	\N	\N	\N	\N	\N	\N	\N	\N
2027-02-08	\N	\N	\N	\N	\N	\N	\N	\N
2027-02-09	\N	\N	\N	\N	\N	\N	\N	\N
2027-02-10	\N	\N	\N	\N	\N	\N	\N	\N
2027-02-11	\N	\N	\N	\N	\N	\N	\N	\N
2027-02-12	\N	\N	\N	\N	\N	\N	\N	\N
2027-02-13	\N	\N	\N	\N	\N	\N	\N	\N
2027-02-14	\N	\N	\N	\N	\N	\N	\N	\N
2027-02-15	\N	\N	\N	\N	\N	\N	\N	\N
2027-02-16	\N	\N	\N	\N	\N	\N	\N	\N
2027-02-17	\N	\N	\N	\N	\N	\N	\N	\N
2027-02-18	\N	\N	\N	\N	\N	\N	\N	\N
2027-02-19	\N	\N	\N	\N	\N	\N	\N	\N
2027-02-20	\N	\N	\N	\N	\N	\N	\N	\N
2027-02-21	\N	\N	\N	\N	\N	\N	\N	\N
2027-02-22	\N	\N	\N	\N	\N	\N	\N	\N
2027-02-23	\N	\N	\N	\N	\N	\N	\N	\N
2027-02-24	\N	\N	\N	\N	\N	\N	\N	\N
2027-02-25	\N	\N	\N	\N	\N	\N	\N	\N
2027-02-26	\N	\N	\N	\N	\N	\N	\N	\N
2027-02-27	\N	\N	\N	\N	\N	\N	\N	\N
2027-02-28	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-01	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-02	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-03	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-04	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-05	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-06	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-07	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-08	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-09	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-10	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-11	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-12	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-13	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-14	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-15	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-16	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-17	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-18	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-19	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-20	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-21	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-22	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-23	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-24	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-25	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-26	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-27	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-28	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-29	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-30	\N	\N	\N	\N	\N	\N	\N	\N
2027-03-31	\N	\N	\N	\N	\N	\N	\N	\N
2027-04-01	\N	\N	\N	\N	\N	\N	\N	\N
2027-04-02	\N	\N	\N	\N	\N	\N	\N	\N
2027-04-03	\N	\N	\N	\N	\N	\N	\N	\N
2027-04-04	\N	\N	\N	\N	\N	\N	\N	\N
2027-04-05	\N	\N	\N	\N	\N	\N	\N	\N
2027-04-06	\N	\N	\N	\N	\N	\N	\N	\N
2027-04-07	\N	\N	\N	\N	\N	\N	\N	\N
2027-04-08	\N	\N	\N	\N	\N	\N	\N	\N
2027-04-09	\N	\N	\N	\N	\N	\N	\N	\N
2027-04-10	\N	\N	\N	\N	\N	\N	\N	\N
2027-04-11	\N	\N	\N	\N	\N	\N	\N	\N
2027-04-12	\N	\N	\N	\N	\N	\N	\N	\N
2027-04-13	\N	\N	\N	\N	\N	\N	\N	\N
2027-04-14	\N	\N	\N	\N	\N	\N	\N	\N
2027-04-15	\N	\N	\N	\N	\N	\N	\N	\N
2027-04-16	\N	\N	\N	\N	\N	\N	\N	\N
2027-04-17	\N	\N	\N	\N	\N	\N	\N	\N
2027-04-18	\N	\N	\N	\N	\N	\N	\N	\N
2027-04-19	\N	\N	\N	\N	\N	\N	\N	\N
2027-04-20	\N	\N	\N	\N	\N	\N	\N	\N
2027-04-21	\N	\N	\N	\N	\N	\N	\N	\N
2027-04-22	\N	\N	\N	\N	\N	\N	\N	\N
2027-04-23	\N	\N	\N	\N	\N	\N	\N	\N
2027-04-24	\N	\N	\N	\N	\N	\N	\N	\N
2027-04-25	\N	\N	\N	\N	\N	\N	\N	\N
2027-04-26	\N	\N	\N	\N	\N	\N	\N	\N
2027-04-27	\N	\N	\N	\N	\N	\N	\N	\N
2027-04-28	\N	\N	\N	\N	\N	\N	\N	\N
2027-04-29	\N	\N	\N	\N	\N	\N	\N	\N
2027-04-30	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-01	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-02	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-03	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-04	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-05	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-06	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-07	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-08	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-09	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-10	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-11	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-12	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-13	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-14	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-15	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-16	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-17	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-18	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-19	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-20	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-21	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-22	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-23	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-24	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-25	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-26	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-27	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-28	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-29	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-30	\N	\N	\N	\N	\N	\N	\N	\N
2027-05-31	\N	\N	\N	\N	\N	\N	\N	\N
2027-06-01	\N	\N	\N	\N	\N	\N	\N	\N
2027-06-02	\N	\N	\N	\N	\N	\N	\N	\N
2027-06-03	\N	\N	\N	\N	\N	\N	\N	\N
2027-06-04	\N	\N	\N	\N	\N	\N	\N	\N
2027-06-05	\N	\N	\N	\N	\N	\N	\N	\N
2027-06-06	\N	\N	\N	\N	\N	\N	\N	\N
2027-06-07	\N	\N	\N	\N	\N	\N	\N	\N
2027-06-08	\N	\N	\N	\N	\N	\N	\N	\N
2027-06-09	\N	\N	\N	\N	\N	\N	\N	\N
2027-06-10	\N	\N	\N	\N	\N	\N	\N	\N
2027-06-11	\N	\N	\N	\N	\N	\N	\N	\N
2027-06-12	\N	\N	\N	\N	\N	\N	\N	\N
2027-06-13	\N	\N	\N	\N	\N	\N	\N	\N
2027-06-14	\N	\N	\N	\N	\N	\N	\N	\N
2027-06-15	\N	\N	\N	\N	\N	\N	\N	\N
2027-06-16	\N	\N	\N	\N	\N	\N	\N	\N
2027-06-17	\N	\N	\N	\N	\N	\N	\N	\N
2027-06-18	\N	\N	\N	\N	\N	\N	\N	\N
2027-06-19	\N	\N	\N	\N	\N	\N	\N	\N
2027-06-20	\N	\N	\N	\N	\N	\N	\N	\N
2027-06-21	\N	\N	\N	\N	\N	\N	\N	\N
2027-06-22	\N	\N	\N	\N	\N	\N	\N	\N
2027-06-23	\N	\N	\N	\N	\N	\N	\N	\N
2027-06-24	\N	\N	\N	\N	\N	\N	\N	\N
2027-06-25	\N	\N	\N	\N	\N	\N	\N	\N
2027-06-26	\N	\N	\N	\N	\N	\N	\N	\N
2027-06-27	\N	\N	\N	\N	\N	\N	\N	\N
2027-06-28	\N	\N	\N	\N	\N	\N	\N	\N
2027-06-29	\N	\N	\N	\N	\N	\N	\N	\N
2027-06-30	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-01	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-02	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-03	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-04	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-05	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-06	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-07	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-08	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-09	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-10	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-11	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-12	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-13	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-14	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-15	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-16	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-17	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-18	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-19	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-20	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-21	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-22	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-23	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-24	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-25	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-26	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-27	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-28	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-29	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-30	\N	\N	\N	\N	\N	\N	\N	\N
2027-07-31	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-01	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-02	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-03	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-04	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-05	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-06	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-07	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-08	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-09	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-10	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-11	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-12	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-13	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-14	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-15	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-16	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-17	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-18	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-19	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-20	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-21	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-22	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-23	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-24	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-25	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-26	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-27	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-28	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-29	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-30	\N	\N	\N	\N	\N	\N	\N	\N
2027-08-31	\N	\N	\N	\N	\N	\N	\N	\N
2027-09-01	\N	\N	\N	\N	\N	\N	\N	\N
2027-09-02	\N	\N	\N	\N	\N	\N	\N	\N
2027-09-03	\N	\N	\N	\N	\N	\N	\N	\N
2027-09-04	\N	\N	\N	\N	\N	\N	\N	\N
2027-09-05	\N	\N	\N	\N	\N	\N	\N	\N
2027-09-06	\N	\N	\N	\N	\N	\N	\N	\N
2027-09-07	\N	\N	\N	\N	\N	\N	\N	\N
2027-09-08	\N	\N	\N	\N	\N	\N	\N	\N
2027-09-09	\N	\N	\N	\N	\N	\N	\N	\N
2027-09-10	\N	\N	\N	\N	\N	\N	\N	\N
2027-09-11	\N	\N	\N	\N	\N	\N	\N	\N
2027-09-12	\N	\N	\N	\N	\N	\N	\N	\N
2027-09-13	\N	\N	\N	\N	\N	\N	\N	\N
2027-09-14	\N	\N	\N	\N	\N	\N	\N	\N
2027-09-15	\N	\N	\N	\N	\N	\N	\N	\N
2027-09-16	\N	\N	\N	\N	\N	\N	\N	\N
2027-09-17	\N	\N	\N	\N	\N	\N	\N	\N
2027-09-18	\N	\N	\N	\N	\N	\N	\N	\N
2027-09-19	\N	\N	\N	\N	\N	\N	\N	\N
2027-09-20	\N	\N	\N	\N	\N	\N	\N	\N
2027-09-21	\N	\N	\N	\N	\N	\N	\N	\N
2027-09-22	\N	\N	\N	\N	\N	\N	\N	\N
2027-09-23	\N	\N	\N	\N	\N	\N	\N	\N
2027-09-24	\N	\N	\N	\N	\N	\N	\N	\N
2027-09-25	\N	\N	\N	\N	\N	\N	\N	\N
2027-09-26	\N	\N	\N	\N	\N	\N	\N	\N
2027-09-27	\N	\N	\N	\N	\N	\N	\N	\N
2027-09-28	\N	\N	\N	\N	\N	\N	\N	\N
2027-09-29	\N	\N	\N	\N	\N	\N	\N	\N
2027-09-30	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-01	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-02	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-03	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-04	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-05	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-06	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-07	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-08	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-09	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-10	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-11	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-12	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-13	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-14	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-15	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-16	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-17	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-18	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-19	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-20	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-21	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-22	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-23	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-24	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-25	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-26	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-27	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-28	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-29	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-30	\N	\N	\N	\N	\N	\N	\N	\N
2027-10-31	\N	\N	\N	\N	\N	\N	\N	\N
2027-11-01	\N	\N	\N	\N	\N	\N	\N	\N
2027-11-02	\N	\N	\N	\N	\N	\N	\N	\N
2027-11-03	\N	\N	\N	\N	\N	\N	\N	\N
2027-11-04	\N	\N	\N	\N	\N	\N	\N	\N
2027-11-05	\N	\N	\N	\N	\N	\N	\N	\N
2027-11-06	\N	\N	\N	\N	\N	\N	\N	\N
2027-11-07	\N	\N	\N	\N	\N	\N	\N	\N
2027-11-08	\N	\N	\N	\N	\N	\N	\N	\N
2027-11-09	\N	\N	\N	\N	\N	\N	\N	\N
2027-11-10	\N	\N	\N	\N	\N	\N	\N	\N
2027-11-11	\N	\N	\N	\N	\N	\N	\N	\N
2027-11-12	\N	\N	\N	\N	\N	\N	\N	\N
2027-11-13	\N	\N	\N	\N	\N	\N	\N	\N
2027-11-14	\N	\N	\N	\N	\N	\N	\N	\N
2027-11-15	\N	\N	\N	\N	\N	\N	\N	\N
2027-11-16	\N	\N	\N	\N	\N	\N	\N	\N
2027-11-17	\N	\N	\N	\N	\N	\N	\N	\N
2027-11-18	\N	\N	\N	\N	\N	\N	\N	\N
2027-11-19	\N	\N	\N	\N	\N	\N	\N	\N
2027-11-20	\N	\N	\N	\N	\N	\N	\N	\N
2027-11-21	\N	\N	\N	\N	\N	\N	\N	\N
2027-11-22	\N	\N	\N	\N	\N	\N	\N	\N
2027-11-23	\N	\N	\N	\N	\N	\N	\N	\N
2027-11-24	\N	\N	\N	\N	\N	\N	\N	\N
2027-11-25	\N	\N	\N	\N	\N	\N	\N	\N
2027-11-26	\N	\N	\N	\N	\N	\N	\N	\N
2027-11-27	\N	\N	\N	\N	\N	\N	\N	\N
2027-11-28	\N	\N	\N	\N	\N	\N	\N	\N
2027-11-29	\N	\N	\N	\N	\N	\N	\N	\N
2027-11-30	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-01	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-02	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-03	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-04	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-05	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-06	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-07	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-08	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-09	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-10	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-11	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-12	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-13	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-14	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-15	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-16	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-17	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-18	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-19	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-20	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-21	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-22	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-23	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-24	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-25	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-26	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-27	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-28	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-29	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-30	\N	\N	\N	\N	\N	\N	\N	\N
2027-12-31	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-01	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-02	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-03	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-04	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-05	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-06	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-07	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-08	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-09	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-10	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-11	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-12	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-13	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-14	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-15	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-16	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-17	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-18	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-19	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-20	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-21	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-22	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-23	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-24	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-25	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-26	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-27	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-28	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-29	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-30	\N	\N	\N	\N	\N	\N	\N	\N
2028-01-31	\N	\N	\N	\N	\N	\N	\N	\N
2028-02-01	\N	\N	\N	\N	\N	\N	\N	\N
2028-02-02	\N	\N	\N	\N	\N	\N	\N	\N
2028-02-03	\N	\N	\N	\N	\N	\N	\N	\N
2028-02-04	\N	\N	\N	\N	\N	\N	\N	\N
2028-02-05	\N	\N	\N	\N	\N	\N	\N	\N
2028-02-06	\N	\N	\N	\N	\N	\N	\N	\N
2028-02-07	\N	\N	\N	\N	\N	\N	\N	\N
2028-02-08	\N	\N	\N	\N	\N	\N	\N	\N
2028-02-09	\N	\N	\N	\N	\N	\N	\N	\N
2028-02-10	\N	\N	\N	\N	\N	\N	\N	\N
2028-02-11	\N	\N	\N	\N	\N	\N	\N	\N
2028-02-12	\N	\N	\N	\N	\N	\N	\N	\N
2028-02-13	\N	\N	\N	\N	\N	\N	\N	\N
2028-02-14	\N	\N	\N	\N	\N	\N	\N	\N
2028-02-15	\N	\N	\N	\N	\N	\N	\N	\N
2028-02-16	\N	\N	\N	\N	\N	\N	\N	\N
2028-02-17	\N	\N	\N	\N	\N	\N	\N	\N
2028-02-18	\N	\N	\N	\N	\N	\N	\N	\N
2028-02-19	\N	\N	\N	\N	\N	\N	\N	\N
2028-02-20	\N	\N	\N	\N	\N	\N	\N	\N
2028-02-21	\N	\N	\N	\N	\N	\N	\N	\N
2028-02-22	\N	\N	\N	\N	\N	\N	\N	\N
2028-02-23	\N	\N	\N	\N	\N	\N	\N	\N
2028-02-24	\N	\N	\N	\N	\N	\N	\N	\N
2028-02-25	\N	\N	\N	\N	\N	\N	\N	\N
2028-02-26	\N	\N	\N	\N	\N	\N	\N	\N
2028-02-27	\N	\N	\N	\N	\N	\N	\N	\N
2028-02-28	\N	\N	\N	\N	\N	\N	\N	\N
2028-02-29	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-01	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-02	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-03	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-04	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-05	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-06	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-07	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-08	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-09	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-10	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-11	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-12	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-13	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-14	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-15	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-16	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-17	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-18	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-19	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-20	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-21	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-22	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-23	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-24	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-25	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-26	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-27	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-28	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-29	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-30	\N	\N	\N	\N	\N	\N	\N	\N
2028-03-31	\N	\N	\N	\N	\N	\N	\N	\N
2028-04-01	\N	\N	\N	\N	\N	\N	\N	\N
2028-04-02	\N	\N	\N	\N	\N	\N	\N	\N
2028-04-03	\N	\N	\N	\N	\N	\N	\N	\N
2028-04-04	\N	\N	\N	\N	\N	\N	\N	\N
2028-04-05	\N	\N	\N	\N	\N	\N	\N	\N
2028-04-06	\N	\N	\N	\N	\N	\N	\N	\N
2028-04-07	\N	\N	\N	\N	\N	\N	\N	\N
2028-04-08	\N	\N	\N	\N	\N	\N	\N	\N
2028-04-09	\N	\N	\N	\N	\N	\N	\N	\N
2028-04-10	\N	\N	\N	\N	\N	\N	\N	\N
2028-04-11	\N	\N	\N	\N	\N	\N	\N	\N
2028-04-12	\N	\N	\N	\N	\N	\N	\N	\N
2028-04-13	\N	\N	\N	\N	\N	\N	\N	\N
2028-04-14	\N	\N	\N	\N	\N	\N	\N	\N
2028-04-15	\N	\N	\N	\N	\N	\N	\N	\N
2028-04-16	\N	\N	\N	\N	\N	\N	\N	\N
2028-04-17	\N	\N	\N	\N	\N	\N	\N	\N
2028-04-18	\N	\N	\N	\N	\N	\N	\N	\N
2028-04-19	\N	\N	\N	\N	\N	\N	\N	\N
2028-04-20	\N	\N	\N	\N	\N	\N	\N	\N
2028-04-21	\N	\N	\N	\N	\N	\N	\N	\N
2028-04-22	\N	\N	\N	\N	\N	\N	\N	\N
2028-04-23	\N	\N	\N	\N	\N	\N	\N	\N
2028-04-24	\N	\N	\N	\N	\N	\N	\N	\N
2028-04-25	\N	\N	\N	\N	\N	\N	\N	\N
2028-04-26	\N	\N	\N	\N	\N	\N	\N	\N
2028-04-27	\N	\N	\N	\N	\N	\N	\N	\N
2028-04-28	\N	\N	\N	\N	\N	\N	\N	\N
2028-04-29	\N	\N	\N	\N	\N	\N	\N	\N
2028-04-30	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-01	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-02	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-03	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-04	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-05	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-06	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-07	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-08	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-09	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-10	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-11	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-12	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-13	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-14	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-15	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-16	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-17	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-18	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-19	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-20	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-21	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-22	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-23	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-24	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-25	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-26	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-27	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-28	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-29	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-30	\N	\N	\N	\N	\N	\N	\N	\N
2028-05-31	\N	\N	\N	\N	\N	\N	\N	\N
2028-06-01	\N	\N	\N	\N	\N	\N	\N	\N
2028-06-02	\N	\N	\N	\N	\N	\N	\N	\N
2028-06-03	\N	\N	\N	\N	\N	\N	\N	\N
2028-06-04	\N	\N	\N	\N	\N	\N	\N	\N
2028-06-05	\N	\N	\N	\N	\N	\N	\N	\N
2028-06-06	\N	\N	\N	\N	\N	\N	\N	\N
2028-06-07	\N	\N	\N	\N	\N	\N	\N	\N
2028-06-08	\N	\N	\N	\N	\N	\N	\N	\N
2028-06-09	\N	\N	\N	\N	\N	\N	\N	\N
2028-06-10	\N	\N	\N	\N	\N	\N	\N	\N
2028-06-11	\N	\N	\N	\N	\N	\N	\N	\N
2028-06-12	\N	\N	\N	\N	\N	\N	\N	\N
2028-06-13	\N	\N	\N	\N	\N	\N	\N	\N
2028-06-14	\N	\N	\N	\N	\N	\N	\N	\N
2028-06-15	\N	\N	\N	\N	\N	\N	\N	\N
2028-06-16	\N	\N	\N	\N	\N	\N	\N	\N
2028-06-17	\N	\N	\N	\N	\N	\N	\N	\N
2028-06-18	\N	\N	\N	\N	\N	\N	\N	\N
2028-06-19	\N	\N	\N	\N	\N	\N	\N	\N
2028-06-20	\N	\N	\N	\N	\N	\N	\N	\N
2028-06-21	\N	\N	\N	\N	\N	\N	\N	\N
2028-06-22	\N	\N	\N	\N	\N	\N	\N	\N
2028-06-23	\N	\N	\N	\N	\N	\N	\N	\N
2028-06-24	\N	\N	\N	\N	\N	\N	\N	\N
2028-06-25	\N	\N	\N	\N	\N	\N	\N	\N
2028-06-26	\N	\N	\N	\N	\N	\N	\N	\N
2028-06-27	\N	\N	\N	\N	\N	\N	\N	\N
2028-06-28	\N	\N	\N	\N	\N	\N	\N	\N
2028-06-29	\N	\N	\N	\N	\N	\N	\N	\N
2028-06-30	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-01	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-02	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-03	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-04	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-05	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-06	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-07	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-08	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-09	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-10	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-11	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-12	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-13	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-14	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-15	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-16	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-17	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-18	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-19	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-20	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-21	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-22	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-23	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-24	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-25	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-26	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-27	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-28	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-29	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-30	\N	\N	\N	\N	\N	\N	\N	\N
2028-07-31	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-01	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-02	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-03	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-04	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-05	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-06	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-07	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-08	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-09	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-10	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-11	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-12	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-13	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-14	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-15	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-16	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-17	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-18	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-19	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-20	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-21	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-22	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-23	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-24	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-25	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-26	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-27	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-28	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-29	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-30	\N	\N	\N	\N	\N	\N	\N	\N
2028-08-31	\N	\N	\N	\N	\N	\N	\N	\N
2028-09-01	\N	\N	\N	\N	\N	\N	\N	\N
2028-09-02	\N	\N	\N	\N	\N	\N	\N	\N
2028-09-03	\N	\N	\N	\N	\N	\N	\N	\N
2028-09-04	\N	\N	\N	\N	\N	\N	\N	\N
2028-09-05	\N	\N	\N	\N	\N	\N	\N	\N
2028-09-06	\N	\N	\N	\N	\N	\N	\N	\N
2028-09-07	\N	\N	\N	\N	\N	\N	\N	\N
2028-09-08	\N	\N	\N	\N	\N	\N	\N	\N
2028-09-09	\N	\N	\N	\N	\N	\N	\N	\N
2028-09-10	\N	\N	\N	\N	\N	\N	\N	\N
2028-09-11	\N	\N	\N	\N	\N	\N	\N	\N
2028-09-12	\N	\N	\N	\N	\N	\N	\N	\N
2028-09-13	\N	\N	\N	\N	\N	\N	\N	\N
2028-09-14	\N	\N	\N	\N	\N	\N	\N	\N
2028-09-15	\N	\N	\N	\N	\N	\N	\N	\N
2028-09-16	\N	\N	\N	\N	\N	\N	\N	\N
2028-09-17	\N	\N	\N	\N	\N	\N	\N	\N
2028-09-18	\N	\N	\N	\N	\N	\N	\N	\N
2028-09-19	\N	\N	\N	\N	\N	\N	\N	\N
2028-09-20	\N	\N	\N	\N	\N	\N	\N	\N
2028-09-21	\N	\N	\N	\N	\N	\N	\N	\N
2028-09-22	\N	\N	\N	\N	\N	\N	\N	\N
2028-09-23	\N	\N	\N	\N	\N	\N	\N	\N
2028-09-24	\N	\N	\N	\N	\N	\N	\N	\N
2028-09-25	\N	\N	\N	\N	\N	\N	\N	\N
2028-09-26	\N	\N	\N	\N	\N	\N	\N	\N
2028-09-27	\N	\N	\N	\N	\N	\N	\N	\N
2028-09-28	\N	\N	\N	\N	\N	\N	\N	\N
2028-09-29	\N	\N	\N	\N	\N	\N	\N	\N
2028-09-30	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-01	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-02	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-03	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-04	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-05	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-06	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-07	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-08	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-09	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-10	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-11	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-12	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-13	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-14	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-15	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-16	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-17	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-18	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-19	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-20	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-21	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-22	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-23	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-24	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-25	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-26	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-27	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-28	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-29	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-30	\N	\N	\N	\N	\N	\N	\N	\N
2028-10-31	\N	\N	\N	\N	\N	\N	\N	\N
2028-11-01	\N	\N	\N	\N	\N	\N	\N	\N
2028-11-02	\N	\N	\N	\N	\N	\N	\N	\N
2028-11-03	\N	\N	\N	\N	\N	\N	\N	\N
2028-11-04	\N	\N	\N	\N	\N	\N	\N	\N
2028-11-05	\N	\N	\N	\N	\N	\N	\N	\N
2028-11-06	\N	\N	\N	\N	\N	\N	\N	\N
2028-11-07	\N	\N	\N	\N	\N	\N	\N	\N
2028-11-08	\N	\N	\N	\N	\N	\N	\N	\N
2028-11-09	\N	\N	\N	\N	\N	\N	\N	\N
2028-11-10	\N	\N	\N	\N	\N	\N	\N	\N
2028-11-11	\N	\N	\N	\N	\N	\N	\N	\N
2028-11-12	\N	\N	\N	\N	\N	\N	\N	\N
2028-11-13	\N	\N	\N	\N	\N	\N	\N	\N
2028-11-14	\N	\N	\N	\N	\N	\N	\N	\N
2028-11-15	\N	\N	\N	\N	\N	\N	\N	\N
2028-11-16	\N	\N	\N	\N	\N	\N	\N	\N
2028-11-17	\N	\N	\N	\N	\N	\N	\N	\N
2028-11-18	\N	\N	\N	\N	\N	\N	\N	\N
2028-11-19	\N	\N	\N	\N	\N	\N	\N	\N
2028-11-20	\N	\N	\N	\N	\N	\N	\N	\N
2028-11-21	\N	\N	\N	\N	\N	\N	\N	\N
2028-11-22	\N	\N	\N	\N	\N	\N	\N	\N
2028-11-23	\N	\N	\N	\N	\N	\N	\N	\N
2028-11-24	\N	\N	\N	\N	\N	\N	\N	\N
2028-11-25	\N	\N	\N	\N	\N	\N	\N	\N
2028-11-26	\N	\N	\N	\N	\N	\N	\N	\N
2028-11-27	\N	\N	\N	\N	\N	\N	\N	\N
2028-11-28	\N	\N	\N	\N	\N	\N	\N	\N
2028-11-29	\N	\N	\N	\N	\N	\N	\N	\N
2028-11-30	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-01	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-02	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-03	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-04	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-05	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-06	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-07	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-08	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-09	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-10	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-11	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-12	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-13	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-14	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-15	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-16	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-17	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-18	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-19	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-20	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-21	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-22	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-23	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-24	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-25	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-26	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-27	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-28	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-29	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-30	\N	\N	\N	\N	\N	\N	\N	\N
2028-12-31	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-01	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-02	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-03	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-04	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-05	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-06	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-07	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-08	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-09	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-10	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-11	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-12	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-13	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-14	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-15	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-16	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-17	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-18	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-19	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-20	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-21	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-22	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-23	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-24	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-25	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-26	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-27	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-28	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-29	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-30	\N	\N	\N	\N	\N	\N	\N	\N
2029-01-31	\N	\N	\N	\N	\N	\N	\N	\N
2029-02-01	\N	\N	\N	\N	\N	\N	\N	\N
2029-02-02	\N	\N	\N	\N	\N	\N	\N	\N
2029-02-03	\N	\N	\N	\N	\N	\N	\N	\N
2029-02-04	\N	\N	\N	\N	\N	\N	\N	\N
2029-02-05	\N	\N	\N	\N	\N	\N	\N	\N
2029-02-06	\N	\N	\N	\N	\N	\N	\N	\N
2029-02-07	\N	\N	\N	\N	\N	\N	\N	\N
2029-02-08	\N	\N	\N	\N	\N	\N	\N	\N
2029-02-09	\N	\N	\N	\N	\N	\N	\N	\N
2029-02-10	\N	\N	\N	\N	\N	\N	\N	\N
2029-02-11	\N	\N	\N	\N	\N	\N	\N	\N
2029-02-12	\N	\N	\N	\N	\N	\N	\N	\N
2029-02-13	\N	\N	\N	\N	\N	\N	\N	\N
2029-02-14	\N	\N	\N	\N	\N	\N	\N	\N
2029-02-15	\N	\N	\N	\N	\N	\N	\N	\N
2029-02-16	\N	\N	\N	\N	\N	\N	\N	\N
2029-02-17	\N	\N	\N	\N	\N	\N	\N	\N
2029-02-18	\N	\N	\N	\N	\N	\N	\N	\N
2029-02-19	\N	\N	\N	\N	\N	\N	\N	\N
2029-02-20	\N	\N	\N	\N	\N	\N	\N	\N
2029-02-21	\N	\N	\N	\N	\N	\N	\N	\N
2029-02-22	\N	\N	\N	\N	\N	\N	\N	\N
2029-02-23	\N	\N	\N	\N	\N	\N	\N	\N
2029-02-24	\N	\N	\N	\N	\N	\N	\N	\N
2029-02-25	\N	\N	\N	\N	\N	\N	\N	\N
2029-02-26	\N	\N	\N	\N	\N	\N	\N	\N
2029-02-27	\N	\N	\N	\N	\N	\N	\N	\N
2029-02-28	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-01	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-02	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-03	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-04	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-05	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-06	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-07	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-08	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-09	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-10	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-11	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-12	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-13	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-14	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-15	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-16	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-17	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-18	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-19	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-20	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-21	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-22	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-23	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-24	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-25	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-26	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-27	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-28	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-29	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-30	\N	\N	\N	\N	\N	\N	\N	\N
2029-03-31	\N	\N	\N	\N	\N	\N	\N	\N
2029-04-01	\N	\N	\N	\N	\N	\N	\N	\N
2029-04-02	\N	\N	\N	\N	\N	\N	\N	\N
2029-04-03	\N	\N	\N	\N	\N	\N	\N	\N
2029-04-04	\N	\N	\N	\N	\N	\N	\N	\N
2029-04-05	\N	\N	\N	\N	\N	\N	\N	\N
2029-04-06	\N	\N	\N	\N	\N	\N	\N	\N
2029-04-07	\N	\N	\N	\N	\N	\N	\N	\N
2029-04-08	\N	\N	\N	\N	\N	\N	\N	\N
2029-04-09	\N	\N	\N	\N	\N	\N	\N	\N
2029-04-10	\N	\N	\N	\N	\N	\N	\N	\N
2029-04-11	\N	\N	\N	\N	\N	\N	\N	\N
2029-04-12	\N	\N	\N	\N	\N	\N	\N	\N
2029-04-13	\N	\N	\N	\N	\N	\N	\N	\N
2029-04-14	\N	\N	\N	\N	\N	\N	\N	\N
2029-04-15	\N	\N	\N	\N	\N	\N	\N	\N
2029-04-16	\N	\N	\N	\N	\N	\N	\N	\N
2029-04-17	\N	\N	\N	\N	\N	\N	\N	\N
2029-04-18	\N	\N	\N	\N	\N	\N	\N	\N
2029-04-19	\N	\N	\N	\N	\N	\N	\N	\N
2029-04-20	\N	\N	\N	\N	\N	\N	\N	\N
2029-04-21	\N	\N	\N	\N	\N	\N	\N	\N
2029-04-22	\N	\N	\N	\N	\N	\N	\N	\N
2029-04-23	\N	\N	\N	\N	\N	\N	\N	\N
2029-04-24	\N	\N	\N	\N	\N	\N	\N	\N
2029-04-25	\N	\N	\N	\N	\N	\N	\N	\N
2029-04-26	\N	\N	\N	\N	\N	\N	\N	\N
2029-04-27	\N	\N	\N	\N	\N	\N	\N	\N
2029-04-28	\N	\N	\N	\N	\N	\N	\N	\N
2029-04-29	\N	\N	\N	\N	\N	\N	\N	\N
2029-04-30	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-01	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-02	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-03	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-04	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-05	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-06	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-07	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-08	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-09	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-10	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-11	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-12	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-13	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-14	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-15	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-16	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-17	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-18	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-19	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-20	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-21	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-22	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-23	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-24	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-25	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-26	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-27	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-28	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-29	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-30	\N	\N	\N	\N	\N	\N	\N	\N
2029-05-31	\N	\N	\N	\N	\N	\N	\N	\N
2029-06-01	\N	\N	\N	\N	\N	\N	\N	\N
2029-06-02	\N	\N	\N	\N	\N	\N	\N	\N
2029-06-03	\N	\N	\N	\N	\N	\N	\N	\N
2029-06-04	\N	\N	\N	\N	\N	\N	\N	\N
2029-06-05	\N	\N	\N	\N	\N	\N	\N	\N
2029-06-06	\N	\N	\N	\N	\N	\N	\N	\N
2029-06-07	\N	\N	\N	\N	\N	\N	\N	\N
2029-06-08	\N	\N	\N	\N	\N	\N	\N	\N
2029-06-09	\N	\N	\N	\N	\N	\N	\N	\N
2029-06-10	\N	\N	\N	\N	\N	\N	\N	\N
2029-06-11	\N	\N	\N	\N	\N	\N	\N	\N
2029-06-12	\N	\N	\N	\N	\N	\N	\N	\N
2029-06-13	\N	\N	\N	\N	\N	\N	\N	\N
2029-06-14	\N	\N	\N	\N	\N	\N	\N	\N
2029-06-15	\N	\N	\N	\N	\N	\N	\N	\N
2029-06-16	\N	\N	\N	\N	\N	\N	\N	\N
2029-06-17	\N	\N	\N	\N	\N	\N	\N	\N
2029-06-18	\N	\N	\N	\N	\N	\N	\N	\N
2029-06-19	\N	\N	\N	\N	\N	\N	\N	\N
2029-06-20	\N	\N	\N	\N	\N	\N	\N	\N
2029-06-21	\N	\N	\N	\N	\N	\N	\N	\N
2029-06-22	\N	\N	\N	\N	\N	\N	\N	\N
2029-06-23	\N	\N	\N	\N	\N	\N	\N	\N
2029-06-24	\N	\N	\N	\N	\N	\N	\N	\N
2029-06-25	\N	\N	\N	\N	\N	\N	\N	\N
2029-06-26	\N	\N	\N	\N	\N	\N	\N	\N
2029-06-27	\N	\N	\N	\N	\N	\N	\N	\N
2029-06-28	\N	\N	\N	\N	\N	\N	\N	\N
2029-06-29	\N	\N	\N	\N	\N	\N	\N	\N
2029-06-30	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-01	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-02	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-03	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-04	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-05	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-06	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-07	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-08	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-09	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-10	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-11	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-12	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-13	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-14	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-15	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-16	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-17	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-18	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-19	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-20	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-21	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-22	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-23	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-24	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-25	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-26	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-27	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-28	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-29	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-30	\N	\N	\N	\N	\N	\N	\N	\N
2029-07-31	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-01	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-02	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-03	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-04	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-05	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-06	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-07	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-08	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-09	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-10	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-11	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-12	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-13	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-14	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-15	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-16	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-17	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-18	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-19	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-20	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-21	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-22	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-23	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-24	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-25	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-26	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-27	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-28	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-29	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-30	\N	\N	\N	\N	\N	\N	\N	\N
2029-08-31	\N	\N	\N	\N	\N	\N	\N	\N
2029-09-01	\N	\N	\N	\N	\N	\N	\N	\N
2029-09-02	\N	\N	\N	\N	\N	\N	\N	\N
2029-09-03	\N	\N	\N	\N	\N	\N	\N	\N
2029-09-04	\N	\N	\N	\N	\N	\N	\N	\N
2029-09-05	\N	\N	\N	\N	\N	\N	\N	\N
2029-09-06	\N	\N	\N	\N	\N	\N	\N	\N
2029-09-07	\N	\N	\N	\N	\N	\N	\N	\N
2029-09-08	\N	\N	\N	\N	\N	\N	\N	\N
2029-09-09	\N	\N	\N	\N	\N	\N	\N	\N
2029-09-10	\N	\N	\N	\N	\N	\N	\N	\N
2029-09-11	\N	\N	\N	\N	\N	\N	\N	\N
2029-09-12	\N	\N	\N	\N	\N	\N	\N	\N
2029-09-13	\N	\N	\N	\N	\N	\N	\N	\N
2029-09-14	\N	\N	\N	\N	\N	\N	\N	\N
2029-09-15	\N	\N	\N	\N	\N	\N	\N	\N
2029-09-16	\N	\N	\N	\N	\N	\N	\N	\N
2029-09-17	\N	\N	\N	\N	\N	\N	\N	\N
2029-09-18	\N	\N	\N	\N	\N	\N	\N	\N
2029-09-19	\N	\N	\N	\N	\N	\N	\N	\N
2029-09-20	\N	\N	\N	\N	\N	\N	\N	\N
2029-09-21	\N	\N	\N	\N	\N	\N	\N	\N
2029-09-22	\N	\N	\N	\N	\N	\N	\N	\N
2029-09-23	\N	\N	\N	\N	\N	\N	\N	\N
2029-09-24	\N	\N	\N	\N	\N	\N	\N	\N
2029-09-25	\N	\N	\N	\N	\N	\N	\N	\N
2029-09-26	\N	\N	\N	\N	\N	\N	\N	\N
2029-09-27	\N	\N	\N	\N	\N	\N	\N	\N
2029-09-28	\N	\N	\N	\N	\N	\N	\N	\N
2029-09-29	\N	\N	\N	\N	\N	\N	\N	\N
2029-09-30	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-01	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-02	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-03	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-04	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-05	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-06	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-07	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-08	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-09	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-10	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-11	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-12	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-13	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-14	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-15	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-16	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-17	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-18	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-19	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-20	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-21	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-22	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-23	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-24	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-25	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-26	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-27	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-28	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-29	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-30	\N	\N	\N	\N	\N	\N	\N	\N
2029-10-31	\N	\N	\N	\N	\N	\N	\N	\N
2029-11-01	\N	\N	\N	\N	\N	\N	\N	\N
2029-11-02	\N	\N	\N	\N	\N	\N	\N	\N
2029-11-03	\N	\N	\N	\N	\N	\N	\N	\N
2029-11-04	\N	\N	\N	\N	\N	\N	\N	\N
2029-11-05	\N	\N	\N	\N	\N	\N	\N	\N
2029-11-06	\N	\N	\N	\N	\N	\N	\N	\N
2029-11-07	\N	\N	\N	\N	\N	\N	\N	\N
2029-11-08	\N	\N	\N	\N	\N	\N	\N	\N
2029-11-09	\N	\N	\N	\N	\N	\N	\N	\N
2029-11-10	\N	\N	\N	\N	\N	\N	\N	\N
2029-11-11	\N	\N	\N	\N	\N	\N	\N	\N
2029-11-12	\N	\N	\N	\N	\N	\N	\N	\N
2029-11-13	\N	\N	\N	\N	\N	\N	\N	\N
2029-11-14	\N	\N	\N	\N	\N	\N	\N	\N
2029-11-15	\N	\N	\N	\N	\N	\N	\N	\N
2029-11-16	\N	\N	\N	\N	\N	\N	\N	\N
2029-11-17	\N	\N	\N	\N	\N	\N	\N	\N
2029-11-18	\N	\N	\N	\N	\N	\N	\N	\N
2029-11-19	\N	\N	\N	\N	\N	\N	\N	\N
2029-11-20	\N	\N	\N	\N	\N	\N	\N	\N
2029-11-21	\N	\N	\N	\N	\N	\N	\N	\N
2029-11-22	\N	\N	\N	\N	\N	\N	\N	\N
2029-11-23	\N	\N	\N	\N	\N	\N	\N	\N
2029-11-24	\N	\N	\N	\N	\N	\N	\N	\N
2029-11-25	\N	\N	\N	\N	\N	\N	\N	\N
2029-11-26	\N	\N	\N	\N	\N	\N	\N	\N
2029-11-27	\N	\N	\N	\N	\N	\N	\N	\N
2029-11-28	\N	\N	\N	\N	\N	\N	\N	\N
2029-11-29	\N	\N	\N	\N	\N	\N	\N	\N
2029-11-30	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-01	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-02	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-03	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-04	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-05	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-06	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-07	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-08	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-09	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-10	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-11	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-12	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-13	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-14	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-15	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-16	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-17	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-18	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-19	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-20	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-21	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-22	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-23	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-24	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-25	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-26	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-27	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-28	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-29	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-30	\N	\N	\N	\N	\N	\N	\N	\N
2029-12-31	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-01	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-02	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-03	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-04	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-05	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-06	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-07	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-08	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-09	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-10	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-11	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-12	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-13	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-14	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-15	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-16	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-17	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-18	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-19	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-20	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-21	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-22	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-23	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-24	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-25	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-26	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-27	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-28	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-29	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-30	\N	\N	\N	\N	\N	\N	\N	\N
2030-01-31	\N	\N	\N	\N	\N	\N	\N	\N
2030-02-01	\N	\N	\N	\N	\N	\N	\N	\N
2030-02-02	\N	\N	\N	\N	\N	\N	\N	\N
2030-02-03	\N	\N	\N	\N	\N	\N	\N	\N
2030-02-04	\N	\N	\N	\N	\N	\N	\N	\N
2030-02-05	\N	\N	\N	\N	\N	\N	\N	\N
2030-02-06	\N	\N	\N	\N	\N	\N	\N	\N
2030-02-07	\N	\N	\N	\N	\N	\N	\N	\N
2030-02-08	\N	\N	\N	\N	\N	\N	\N	\N
2030-02-09	\N	\N	\N	\N	\N	\N	\N	\N
2030-02-10	\N	\N	\N	\N	\N	\N	\N	\N
2030-02-11	\N	\N	\N	\N	\N	\N	\N	\N
2030-02-12	\N	\N	\N	\N	\N	\N	\N	\N
2030-02-13	\N	\N	\N	\N	\N	\N	\N	\N
2030-02-14	\N	\N	\N	\N	\N	\N	\N	\N
2030-02-15	\N	\N	\N	\N	\N	\N	\N	\N
2030-02-16	\N	\N	\N	\N	\N	\N	\N	\N
2030-02-17	\N	\N	\N	\N	\N	\N	\N	\N
2030-02-18	\N	\N	\N	\N	\N	\N	\N	\N
2030-02-19	\N	\N	\N	\N	\N	\N	\N	\N
2030-02-20	\N	\N	\N	\N	\N	\N	\N	\N
2030-02-21	\N	\N	\N	\N	\N	\N	\N	\N
2030-02-22	\N	\N	\N	\N	\N	\N	\N	\N
2030-02-23	\N	\N	\N	\N	\N	\N	\N	\N
2030-02-24	\N	\N	\N	\N	\N	\N	\N	\N
2030-02-25	\N	\N	\N	\N	\N	\N	\N	\N
2030-02-26	\N	\N	\N	\N	\N	\N	\N	\N
2030-02-27	\N	\N	\N	\N	\N	\N	\N	\N
2030-02-28	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-01	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-02	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-03	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-04	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-05	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-06	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-07	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-08	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-09	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-10	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-11	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-12	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-13	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-14	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-15	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-16	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-17	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-18	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-19	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-20	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-21	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-22	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-23	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-24	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-25	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-26	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-27	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-28	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-29	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-30	\N	\N	\N	\N	\N	\N	\N	\N
2030-03-31	\N	\N	\N	\N	\N	\N	\N	\N
2030-04-01	\N	\N	\N	\N	\N	\N	\N	\N
2030-04-02	\N	\N	\N	\N	\N	\N	\N	\N
2030-04-03	\N	\N	\N	\N	\N	\N	\N	\N
2030-04-04	\N	\N	\N	\N	\N	\N	\N	\N
2030-04-05	\N	\N	\N	\N	\N	\N	\N	\N
2030-04-06	\N	\N	\N	\N	\N	\N	\N	\N
2030-04-07	\N	\N	\N	\N	\N	\N	\N	\N
2030-04-08	\N	\N	\N	\N	\N	\N	\N	\N
2030-04-09	\N	\N	\N	\N	\N	\N	\N	\N
2030-04-10	\N	\N	\N	\N	\N	\N	\N	\N
2030-04-11	\N	\N	\N	\N	\N	\N	\N	\N
2030-04-12	\N	\N	\N	\N	\N	\N	\N	\N
2030-04-13	\N	\N	\N	\N	\N	\N	\N	\N
2030-04-14	\N	\N	\N	\N	\N	\N	\N	\N
2030-04-15	\N	\N	\N	\N	\N	\N	\N	\N
2030-04-16	\N	\N	\N	\N	\N	\N	\N	\N
2030-04-17	\N	\N	\N	\N	\N	\N	\N	\N
2030-04-18	\N	\N	\N	\N	\N	\N	\N	\N
2030-04-19	\N	\N	\N	\N	\N	\N	\N	\N
2030-04-20	\N	\N	\N	\N	\N	\N	\N	\N
2030-04-21	\N	\N	\N	\N	\N	\N	\N	\N
2030-04-22	\N	\N	\N	\N	\N	\N	\N	\N
2030-04-23	\N	\N	\N	\N	\N	\N	\N	\N
2030-04-24	\N	\N	\N	\N	\N	\N	\N	\N
2030-04-25	\N	\N	\N	\N	\N	\N	\N	\N
2030-04-26	\N	\N	\N	\N	\N	\N	\N	\N
2030-04-27	\N	\N	\N	\N	\N	\N	\N	\N
2030-04-28	\N	\N	\N	\N	\N	\N	\N	\N
2030-04-29	\N	\N	\N	\N	\N	\N	\N	\N
2030-04-30	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-01	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-02	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-03	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-04	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-05	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-06	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-07	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-08	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-09	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-10	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-11	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-12	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-13	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-14	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-15	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-16	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-17	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-18	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-19	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-20	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-21	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-22	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-23	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-24	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-25	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-26	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-27	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-28	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-29	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-30	\N	\N	\N	\N	\N	\N	\N	\N
2030-05-31	\N	\N	\N	\N	\N	\N	\N	\N
2030-06-01	\N	\N	\N	\N	\N	\N	\N	\N
2030-06-02	\N	\N	\N	\N	\N	\N	\N	\N
2030-06-03	\N	\N	\N	\N	\N	\N	\N	\N
2030-06-04	\N	\N	\N	\N	\N	\N	\N	\N
2030-06-05	\N	\N	\N	\N	\N	\N	\N	\N
2030-06-06	\N	\N	\N	\N	\N	\N	\N	\N
2030-06-07	\N	\N	\N	\N	\N	\N	\N	\N
2030-06-08	\N	\N	\N	\N	\N	\N	\N	\N
2030-06-09	\N	\N	\N	\N	\N	\N	\N	\N
2030-06-10	\N	\N	\N	\N	\N	\N	\N	\N
2030-06-11	\N	\N	\N	\N	\N	\N	\N	\N
2030-06-12	\N	\N	\N	\N	\N	\N	\N	\N
2030-06-13	\N	\N	\N	\N	\N	\N	\N	\N
2030-06-14	\N	\N	\N	\N	\N	\N	\N	\N
2030-06-15	\N	\N	\N	\N	\N	\N	\N	\N
2030-06-16	\N	\N	\N	\N	\N	\N	\N	\N
2030-06-17	\N	\N	\N	\N	\N	\N	\N	\N
2030-06-18	\N	\N	\N	\N	\N	\N	\N	\N
2030-06-19	\N	\N	\N	\N	\N	\N	\N	\N
2030-06-20	\N	\N	\N	\N	\N	\N	\N	\N
2030-06-21	\N	\N	\N	\N	\N	\N	\N	\N
2030-06-22	\N	\N	\N	\N	\N	\N	\N	\N
2030-06-23	\N	\N	\N	\N	\N	\N	\N	\N
2030-06-24	\N	\N	\N	\N	\N	\N	\N	\N
2030-06-25	\N	\N	\N	\N	\N	\N	\N	\N
2030-06-26	\N	\N	\N	\N	\N	\N	\N	\N
2030-06-27	\N	\N	\N	\N	\N	\N	\N	\N
2030-06-28	\N	\N	\N	\N	\N	\N	\N	\N
2030-06-29	\N	\N	\N	\N	\N	\N	\N	\N
2030-06-30	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-01	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-02	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-03	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-04	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-05	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-06	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-07	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-08	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-09	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-10	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-11	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-12	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-13	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-14	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-15	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-16	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-17	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-18	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-19	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-20	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-21	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-22	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-23	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-24	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-25	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-26	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-27	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-28	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-29	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-30	\N	\N	\N	\N	\N	\N	\N	\N
2030-07-31	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-01	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-02	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-03	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-04	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-05	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-06	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-07	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-08	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-09	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-10	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-11	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-12	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-13	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-14	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-15	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-16	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-17	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-18	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-19	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-20	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-21	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-22	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-23	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-24	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-25	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-26	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-27	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-28	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-29	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-30	\N	\N	\N	\N	\N	\N	\N	\N
2030-08-31	\N	\N	\N	\N	\N	\N	\N	\N
2030-09-01	\N	\N	\N	\N	\N	\N	\N	\N
2030-09-02	\N	\N	\N	\N	\N	\N	\N	\N
2030-09-03	\N	\N	\N	\N	\N	\N	\N	\N
2030-09-04	\N	\N	\N	\N	\N	\N	\N	\N
2030-09-05	\N	\N	\N	\N	\N	\N	\N	\N
2030-09-06	\N	\N	\N	\N	\N	\N	\N	\N
2030-09-07	\N	\N	\N	\N	\N	\N	\N	\N
2030-09-08	\N	\N	\N	\N	\N	\N	\N	\N
2030-09-09	\N	\N	\N	\N	\N	\N	\N	\N
2030-09-10	\N	\N	\N	\N	\N	\N	\N	\N
2030-09-11	\N	\N	\N	\N	\N	\N	\N	\N
2030-09-12	\N	\N	\N	\N	\N	\N	\N	\N
2030-09-13	\N	\N	\N	\N	\N	\N	\N	\N
2030-09-14	\N	\N	\N	\N	\N	\N	\N	\N
2030-09-15	\N	\N	\N	\N	\N	\N	\N	\N
2030-09-16	\N	\N	\N	\N	\N	\N	\N	\N
2030-09-17	\N	\N	\N	\N	\N	\N	\N	\N
2030-09-18	\N	\N	\N	\N	\N	\N	\N	\N
2030-09-19	\N	\N	\N	\N	\N	\N	\N	\N
2030-09-20	\N	\N	\N	\N	\N	\N	\N	\N
2030-09-21	\N	\N	\N	\N	\N	\N	\N	\N
2030-09-22	\N	\N	\N	\N	\N	\N	\N	\N
2030-09-23	\N	\N	\N	\N	\N	\N	\N	\N
2030-09-24	\N	\N	\N	\N	\N	\N	\N	\N
2030-09-25	\N	\N	\N	\N	\N	\N	\N	\N
2030-09-26	\N	\N	\N	\N	\N	\N	\N	\N
2030-09-27	\N	\N	\N	\N	\N	\N	\N	\N
2030-09-28	\N	\N	\N	\N	\N	\N	\N	\N
2030-09-29	\N	\N	\N	\N	\N	\N	\N	\N
2030-09-30	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-01	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-02	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-03	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-04	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-05	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-06	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-07	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-08	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-09	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-10	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-11	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-12	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-13	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-14	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-15	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-16	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-17	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-18	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-19	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-20	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-21	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-22	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-23	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-24	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-25	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-26	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-27	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-28	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-29	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-30	\N	\N	\N	\N	\N	\N	\N	\N
2030-10-31	\N	\N	\N	\N	\N	\N	\N	\N
2030-11-01	\N	\N	\N	\N	\N	\N	\N	\N
2030-11-02	\N	\N	\N	\N	\N	\N	\N	\N
2030-11-03	\N	\N	\N	\N	\N	\N	\N	\N
2030-11-04	\N	\N	\N	\N	\N	\N	\N	\N
2030-11-05	\N	\N	\N	\N	\N	\N	\N	\N
2030-11-06	\N	\N	\N	\N	\N	\N	\N	\N
2030-11-07	\N	\N	\N	\N	\N	\N	\N	\N
2030-11-08	\N	\N	\N	\N	\N	\N	\N	\N
2030-11-09	\N	\N	\N	\N	\N	\N	\N	\N
2030-11-10	\N	\N	\N	\N	\N	\N	\N	\N
2030-11-11	\N	\N	\N	\N	\N	\N	\N	\N
2030-11-12	\N	\N	\N	\N	\N	\N	\N	\N
2030-11-13	\N	\N	\N	\N	\N	\N	\N	\N
2030-11-14	\N	\N	\N	\N	\N	\N	\N	\N
2030-11-15	\N	\N	\N	\N	\N	\N	\N	\N
2030-11-16	\N	\N	\N	\N	\N	\N	\N	\N
2030-11-17	\N	\N	\N	\N	\N	\N	\N	\N
2030-11-18	\N	\N	\N	\N	\N	\N	\N	\N
2030-11-19	\N	\N	\N	\N	\N	\N	\N	\N
2030-11-20	\N	\N	\N	\N	\N	\N	\N	\N
2030-11-21	\N	\N	\N	\N	\N	\N	\N	\N
2030-11-22	\N	\N	\N	\N	\N	\N	\N	\N
2030-11-23	\N	\N	\N	\N	\N	\N	\N	\N
2030-11-24	\N	\N	\N	\N	\N	\N	\N	\N
2030-11-25	\N	\N	\N	\N	\N	\N	\N	\N
2030-11-26	\N	\N	\N	\N	\N	\N	\N	\N
2030-11-27	\N	\N	\N	\N	\N	\N	\N	\N
2030-11-28	\N	\N	\N	\N	\N	\N	\N	\N
2030-11-29	\N	\N	\N	\N	\N	\N	\N	\N
2030-11-30	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-01	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-02	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-03	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-04	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-05	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-06	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-07	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-08	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-09	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-10	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-11	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-12	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-13	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-14	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-15	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-16	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-17	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-18	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-19	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-20	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-21	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-22	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-23	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-24	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-25	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-26	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-27	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-28	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-29	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-30	\N	\N	\N	\N	\N	\N	\N	\N
2030-12-31	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-01	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-02	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-03	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-04	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-05	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-06	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-07	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-08	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-09	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-10	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-11	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-12	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-13	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-14	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-15	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-16	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-17	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-18	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-19	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-20	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-21	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-22	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-23	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-24	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-25	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-26	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-27	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-28	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-29	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-30	\N	\N	\N	\N	\N	\N	\N	\N
2031-01-31	\N	\N	\N	\N	\N	\N	\N	\N
2031-02-01	\N	\N	\N	\N	\N	\N	\N	\N
2031-02-02	\N	\N	\N	\N	\N	\N	\N	\N
2031-02-03	\N	\N	\N	\N	\N	\N	\N	\N
2031-02-04	\N	\N	\N	\N	\N	\N	\N	\N
2031-02-05	\N	\N	\N	\N	\N	\N	\N	\N
2031-02-06	\N	\N	\N	\N	\N	\N	\N	\N
2031-02-07	\N	\N	\N	\N	\N	\N	\N	\N
2031-02-08	\N	\N	\N	\N	\N	\N	\N	\N
2031-02-09	\N	\N	\N	\N	\N	\N	\N	\N
2031-02-10	\N	\N	\N	\N	\N	\N	\N	\N
2031-02-11	\N	\N	\N	\N	\N	\N	\N	\N
2031-02-12	\N	\N	\N	\N	\N	\N	\N	\N
2031-02-13	\N	\N	\N	\N	\N	\N	\N	\N
2031-02-14	\N	\N	\N	\N	\N	\N	\N	\N
2031-02-15	\N	\N	\N	\N	\N	\N	\N	\N
2031-02-16	\N	\N	\N	\N	\N	\N	\N	\N
2031-02-17	\N	\N	\N	\N	\N	\N	\N	\N
2031-02-18	\N	\N	\N	\N	\N	\N	\N	\N
2031-02-19	\N	\N	\N	\N	\N	\N	\N	\N
2031-02-20	\N	\N	\N	\N	\N	\N	\N	\N
2031-02-21	\N	\N	\N	\N	\N	\N	\N	\N
2031-02-22	\N	\N	\N	\N	\N	\N	\N	\N
2031-02-23	\N	\N	\N	\N	\N	\N	\N	\N
2031-02-24	\N	\N	\N	\N	\N	\N	\N	\N
2031-02-25	\N	\N	\N	\N	\N	\N	\N	\N
2031-02-26	\N	\N	\N	\N	\N	\N	\N	\N
2031-02-27	\N	\N	\N	\N	\N	\N	\N	\N
2031-02-28	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-01	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-02	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-03	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-04	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-05	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-06	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-07	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-08	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-09	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-10	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-11	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-12	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-13	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-14	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-15	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-16	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-17	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-18	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-19	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-20	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-21	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-22	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-23	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-24	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-25	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-26	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-27	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-28	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-29	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-30	\N	\N	\N	\N	\N	\N	\N	\N
2031-03-31	\N	\N	\N	\N	\N	\N	\N	\N
2031-04-01	\N	\N	\N	\N	\N	\N	\N	\N
2031-04-02	\N	\N	\N	\N	\N	\N	\N	\N
2031-04-03	\N	\N	\N	\N	\N	\N	\N	\N
2031-04-04	\N	\N	\N	\N	\N	\N	\N	\N
2031-04-05	\N	\N	\N	\N	\N	\N	\N	\N
2031-04-06	\N	\N	\N	\N	\N	\N	\N	\N
2031-04-07	\N	\N	\N	\N	\N	\N	\N	\N
2031-04-08	\N	\N	\N	\N	\N	\N	\N	\N
2031-04-09	\N	\N	\N	\N	\N	\N	\N	\N
2031-04-10	\N	\N	\N	\N	\N	\N	\N	\N
2031-04-11	\N	\N	\N	\N	\N	\N	\N	\N
2031-04-12	\N	\N	\N	\N	\N	\N	\N	\N
2031-04-13	\N	\N	\N	\N	\N	\N	\N	\N
2031-04-14	\N	\N	\N	\N	\N	\N	\N	\N
2031-04-15	\N	\N	\N	\N	\N	\N	\N	\N
2031-04-16	\N	\N	\N	\N	\N	\N	\N	\N
2031-04-17	\N	\N	\N	\N	\N	\N	\N	\N
2031-04-18	\N	\N	\N	\N	\N	\N	\N	\N
2031-04-19	\N	\N	\N	\N	\N	\N	\N	\N
2031-04-20	\N	\N	\N	\N	\N	\N	\N	\N
2031-04-21	\N	\N	\N	\N	\N	\N	\N	\N
2031-04-22	\N	\N	\N	\N	\N	\N	\N	\N
2031-04-23	\N	\N	\N	\N	\N	\N	\N	\N
2031-04-24	\N	\N	\N	\N	\N	\N	\N	\N
2031-04-25	\N	\N	\N	\N	\N	\N	\N	\N
2031-04-26	\N	\N	\N	\N	\N	\N	\N	\N
2031-04-27	\N	\N	\N	\N	\N	\N	\N	\N
2031-04-28	\N	\N	\N	\N	\N	\N	\N	\N
2031-04-29	\N	\N	\N	\N	\N	\N	\N	\N
2031-04-30	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-01	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-02	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-03	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-04	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-05	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-06	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-07	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-08	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-09	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-10	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-11	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-12	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-13	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-14	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-15	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-16	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-17	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-18	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-19	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-20	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-21	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-22	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-23	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-24	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-25	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-26	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-27	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-28	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-29	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-30	\N	\N	\N	\N	\N	\N	\N	\N
2031-05-31	\N	\N	\N	\N	\N	\N	\N	\N
2031-06-01	\N	\N	\N	\N	\N	\N	\N	\N
2031-06-02	\N	\N	\N	\N	\N	\N	\N	\N
2031-06-03	\N	\N	\N	\N	\N	\N	\N	\N
2031-06-04	\N	\N	\N	\N	\N	\N	\N	\N
2031-06-05	\N	\N	\N	\N	\N	\N	\N	\N
2031-06-06	\N	\N	\N	\N	\N	\N	\N	\N
2031-06-07	\N	\N	\N	\N	\N	\N	\N	\N
2031-06-08	\N	\N	\N	\N	\N	\N	\N	\N
2031-06-09	\N	\N	\N	\N	\N	\N	\N	\N
2031-06-10	\N	\N	\N	\N	\N	\N	\N	\N
2031-06-11	\N	\N	\N	\N	\N	\N	\N	\N
2031-06-12	\N	\N	\N	\N	\N	\N	\N	\N
2031-06-13	\N	\N	\N	\N	\N	\N	\N	\N
2031-06-14	\N	\N	\N	\N	\N	\N	\N	\N
2031-06-15	\N	\N	\N	\N	\N	\N	\N	\N
2031-06-16	\N	\N	\N	\N	\N	\N	\N	\N
2031-06-17	\N	\N	\N	\N	\N	\N	\N	\N
2031-06-18	\N	\N	\N	\N	\N	\N	\N	\N
2031-06-19	\N	\N	\N	\N	\N	\N	\N	\N
2031-06-20	\N	\N	\N	\N	\N	\N	\N	\N
2031-06-21	\N	\N	\N	\N	\N	\N	\N	\N
2031-06-22	\N	\N	\N	\N	\N	\N	\N	\N
2031-06-23	\N	\N	\N	\N	\N	\N	\N	\N
2031-06-24	\N	\N	\N	\N	\N	\N	\N	\N
2031-06-25	\N	\N	\N	\N	\N	\N	\N	\N
2031-06-26	\N	\N	\N	\N	\N	\N	\N	\N
2031-06-27	\N	\N	\N	\N	\N	\N	\N	\N
2031-06-28	\N	\N	\N	\N	\N	\N	\N	\N
2031-06-29	\N	\N	\N	\N	\N	\N	\N	\N
2031-06-30	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-01	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-02	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-03	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-04	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-05	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-06	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-07	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-08	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-09	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-10	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-11	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-12	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-13	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-14	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-15	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-16	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-17	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-18	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-19	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-20	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-21	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-22	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-23	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-24	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-25	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-26	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-27	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-28	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-29	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-30	\N	\N	\N	\N	\N	\N	\N	\N
2031-07-31	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-01	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-02	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-03	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-04	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-05	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-06	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-07	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-08	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-09	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-10	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-11	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-12	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-13	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-14	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-15	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-16	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-17	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-18	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-19	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-20	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-21	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-22	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-23	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-24	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-25	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-26	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-27	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-28	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-29	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-30	\N	\N	\N	\N	\N	\N	\N	\N
2031-08-31	\N	\N	\N	\N	\N	\N	\N	\N
2031-09-01	\N	\N	\N	\N	\N	\N	\N	\N
2031-09-02	\N	\N	\N	\N	\N	\N	\N	\N
2031-09-03	\N	\N	\N	\N	\N	\N	\N	\N
2031-09-04	\N	\N	\N	\N	\N	\N	\N	\N
2031-09-05	\N	\N	\N	\N	\N	\N	\N	\N
2031-09-06	\N	\N	\N	\N	\N	\N	\N	\N
2031-09-07	\N	\N	\N	\N	\N	\N	\N	\N
2031-09-08	\N	\N	\N	\N	\N	\N	\N	\N
2031-09-09	\N	\N	\N	\N	\N	\N	\N	\N
2031-09-10	\N	\N	\N	\N	\N	\N	\N	\N
2031-09-11	\N	\N	\N	\N	\N	\N	\N	\N
2031-09-12	\N	\N	\N	\N	\N	\N	\N	\N
2031-09-13	\N	\N	\N	\N	\N	\N	\N	\N
2031-09-14	\N	\N	\N	\N	\N	\N	\N	\N
2031-09-15	\N	\N	\N	\N	\N	\N	\N	\N
2031-09-16	\N	\N	\N	\N	\N	\N	\N	\N
2031-09-17	\N	\N	\N	\N	\N	\N	\N	\N
2031-09-18	\N	\N	\N	\N	\N	\N	\N	\N
2031-09-19	\N	\N	\N	\N	\N	\N	\N	\N
2031-09-20	\N	\N	\N	\N	\N	\N	\N	\N
2031-09-21	\N	\N	\N	\N	\N	\N	\N	\N
2031-09-22	\N	\N	\N	\N	\N	\N	\N	\N
2031-09-23	\N	\N	\N	\N	\N	\N	\N	\N
2031-09-24	\N	\N	\N	\N	\N	\N	\N	\N
2031-09-25	\N	\N	\N	\N	\N	\N	\N	\N
2031-09-26	\N	\N	\N	\N	\N	\N	\N	\N
2031-09-27	\N	\N	\N	\N	\N	\N	\N	\N
2031-09-28	\N	\N	\N	\N	\N	\N	\N	\N
2031-09-29	\N	\N	\N	\N	\N	\N	\N	\N
2031-09-30	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-01	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-02	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-03	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-04	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-05	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-06	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-07	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-08	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-09	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-10	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-11	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-12	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-13	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-14	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-15	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-16	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-17	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-18	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-19	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-20	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-21	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-22	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-23	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-24	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-25	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-26	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-27	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-28	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-29	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-30	\N	\N	\N	\N	\N	\N	\N	\N
2031-10-31	\N	\N	\N	\N	\N	\N	\N	\N
2031-11-01	\N	\N	\N	\N	\N	\N	\N	\N
2031-11-02	\N	\N	\N	\N	\N	\N	\N	\N
2031-11-03	\N	\N	\N	\N	\N	\N	\N	\N
2031-11-04	\N	\N	\N	\N	\N	\N	\N	\N
2031-11-05	\N	\N	\N	\N	\N	\N	\N	\N
2031-11-06	\N	\N	\N	\N	\N	\N	\N	\N
2031-11-07	\N	\N	\N	\N	\N	\N	\N	\N
2031-11-08	\N	\N	\N	\N	\N	\N	\N	\N
2031-11-09	\N	\N	\N	\N	\N	\N	\N	\N
2031-11-10	\N	\N	\N	\N	\N	\N	\N	\N
2031-11-11	\N	\N	\N	\N	\N	\N	\N	\N
2031-11-12	\N	\N	\N	\N	\N	\N	\N	\N
2031-11-13	\N	\N	\N	\N	\N	\N	\N	\N
2031-11-14	\N	\N	\N	\N	\N	\N	\N	\N
2031-11-15	\N	\N	\N	\N	\N	\N	\N	\N
2031-11-16	\N	\N	\N	\N	\N	\N	\N	\N
2031-11-17	\N	\N	\N	\N	\N	\N	\N	\N
2031-11-18	\N	\N	\N	\N	\N	\N	\N	\N
2031-11-19	\N	\N	\N	\N	\N	\N	\N	\N
2031-11-20	\N	\N	\N	\N	\N	\N	\N	\N
2031-11-21	\N	\N	\N	\N	\N	\N	\N	\N
2031-11-22	\N	\N	\N	\N	\N	\N	\N	\N
2031-11-23	\N	\N	\N	\N	\N	\N	\N	\N
2031-11-24	\N	\N	\N	\N	\N	\N	\N	\N
2031-11-25	\N	\N	\N	\N	\N	\N	\N	\N
2031-11-26	\N	\N	\N	\N	\N	\N	\N	\N
2031-11-27	\N	\N	\N	\N	\N	\N	\N	\N
2031-11-28	\N	\N	\N	\N	\N	\N	\N	\N
2031-11-29	\N	\N	\N	\N	\N	\N	\N	\N
2031-11-30	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-01	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-02	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-03	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-04	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-05	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-06	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-07	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-08	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-09	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-10	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-11	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-12	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-13	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-14	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-15	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-16	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-17	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-18	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-19	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-20	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-21	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-22	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-23	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-24	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-25	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-26	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-27	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-28	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-29	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-30	\N	\N	\N	\N	\N	\N	\N	\N
2031-12-31	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-01	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-02	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-03	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-04	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-05	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-06	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-07	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-08	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-09	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-10	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-11	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-12	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-13	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-14	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-15	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-16	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-17	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-18	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-19	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-20	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-21	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-22	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-23	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-24	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-25	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-26	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-27	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-28	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-29	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-30	\N	\N	\N	\N	\N	\N	\N	\N
2032-01-31	\N	\N	\N	\N	\N	\N	\N	\N
2032-02-01	\N	\N	\N	\N	\N	\N	\N	\N
2032-02-02	\N	\N	\N	\N	\N	\N	\N	\N
2032-02-03	\N	\N	\N	\N	\N	\N	\N	\N
2032-02-04	\N	\N	\N	\N	\N	\N	\N	\N
2032-02-05	\N	\N	\N	\N	\N	\N	\N	\N
2032-02-06	\N	\N	\N	\N	\N	\N	\N	\N
2032-02-07	\N	\N	\N	\N	\N	\N	\N	\N
2032-02-08	\N	\N	\N	\N	\N	\N	\N	\N
2032-02-09	\N	\N	\N	\N	\N	\N	\N	\N
2032-02-10	\N	\N	\N	\N	\N	\N	\N	\N
2032-02-11	\N	\N	\N	\N	\N	\N	\N	\N
2032-02-12	\N	\N	\N	\N	\N	\N	\N	\N
2032-02-13	\N	\N	\N	\N	\N	\N	\N	\N
2032-02-14	\N	\N	\N	\N	\N	\N	\N	\N
2032-02-15	\N	\N	\N	\N	\N	\N	\N	\N
2032-02-16	\N	\N	\N	\N	\N	\N	\N	\N
2032-02-17	\N	\N	\N	\N	\N	\N	\N	\N
2032-02-18	\N	\N	\N	\N	\N	\N	\N	\N
2032-02-19	\N	\N	\N	\N	\N	\N	\N	\N
2032-02-20	\N	\N	\N	\N	\N	\N	\N	\N
2032-02-21	\N	\N	\N	\N	\N	\N	\N	\N
2032-02-22	\N	\N	\N	\N	\N	\N	\N	\N
2032-02-23	\N	\N	\N	\N	\N	\N	\N	\N
2032-02-24	\N	\N	\N	\N	\N	\N	\N	\N
2032-02-25	\N	\N	\N	\N	\N	\N	\N	\N
2032-02-26	\N	\N	\N	\N	\N	\N	\N	\N
2032-02-27	\N	\N	\N	\N	\N	\N	\N	\N
2032-02-28	\N	\N	\N	\N	\N	\N	\N	\N
2032-02-29	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-01	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-02	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-03	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-04	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-05	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-06	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-07	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-08	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-09	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-10	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-11	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-12	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-13	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-14	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-15	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-16	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-17	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-18	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-19	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-20	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-21	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-22	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-23	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-24	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-25	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-26	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-27	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-28	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-29	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-30	\N	\N	\N	\N	\N	\N	\N	\N
2032-03-31	\N	\N	\N	\N	\N	\N	\N	\N
2032-04-01	\N	\N	\N	\N	\N	\N	\N	\N
2032-04-02	\N	\N	\N	\N	\N	\N	\N	\N
2032-04-03	\N	\N	\N	\N	\N	\N	\N	\N
2032-04-04	\N	\N	\N	\N	\N	\N	\N	\N
2032-04-05	\N	\N	\N	\N	\N	\N	\N	\N
2032-04-06	\N	\N	\N	\N	\N	\N	\N	\N
2032-04-07	\N	\N	\N	\N	\N	\N	\N	\N
2032-04-08	\N	\N	\N	\N	\N	\N	\N	\N
2032-04-09	\N	\N	\N	\N	\N	\N	\N	\N
2032-04-10	\N	\N	\N	\N	\N	\N	\N	\N
2032-04-11	\N	\N	\N	\N	\N	\N	\N	\N
2032-04-12	\N	\N	\N	\N	\N	\N	\N	\N
2032-04-13	\N	\N	\N	\N	\N	\N	\N	\N
2032-04-14	\N	\N	\N	\N	\N	\N	\N	\N
2032-04-15	\N	\N	\N	\N	\N	\N	\N	\N
2032-04-16	\N	\N	\N	\N	\N	\N	\N	\N
2032-04-17	\N	\N	\N	\N	\N	\N	\N	\N
2032-04-18	\N	\N	\N	\N	\N	\N	\N	\N
2032-04-19	\N	\N	\N	\N	\N	\N	\N	\N
2032-04-20	\N	\N	\N	\N	\N	\N	\N	\N
2032-04-21	\N	\N	\N	\N	\N	\N	\N	\N
2032-04-22	\N	\N	\N	\N	\N	\N	\N	\N
2032-04-23	\N	\N	\N	\N	\N	\N	\N	\N
2032-04-24	\N	\N	\N	\N	\N	\N	\N	\N
2032-04-25	\N	\N	\N	\N	\N	\N	\N	\N
2032-04-26	\N	\N	\N	\N	\N	\N	\N	\N
2032-04-27	\N	\N	\N	\N	\N	\N	\N	\N
2032-04-28	\N	\N	\N	\N	\N	\N	\N	\N
2032-04-29	\N	\N	\N	\N	\N	\N	\N	\N
2032-04-30	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-01	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-02	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-03	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-04	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-05	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-06	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-07	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-08	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-09	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-10	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-11	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-12	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-13	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-14	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-15	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-16	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-17	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-18	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-19	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-20	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-21	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-22	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-23	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-24	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-25	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-26	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-27	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-28	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-29	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-30	\N	\N	\N	\N	\N	\N	\N	\N
2032-05-31	\N	\N	\N	\N	\N	\N	\N	\N
2032-06-01	\N	\N	\N	\N	\N	\N	\N	\N
2032-06-02	\N	\N	\N	\N	\N	\N	\N	\N
2032-06-03	\N	\N	\N	\N	\N	\N	\N	\N
2032-06-04	\N	\N	\N	\N	\N	\N	\N	\N
2032-06-05	\N	\N	\N	\N	\N	\N	\N	\N
2032-06-06	\N	\N	\N	\N	\N	\N	\N	\N
2032-06-07	\N	\N	\N	\N	\N	\N	\N	\N
2032-06-08	\N	\N	\N	\N	\N	\N	\N	\N
2032-06-09	\N	\N	\N	\N	\N	\N	\N	\N
2032-06-10	\N	\N	\N	\N	\N	\N	\N	\N
2032-06-11	\N	\N	\N	\N	\N	\N	\N	\N
2032-06-12	\N	\N	\N	\N	\N	\N	\N	\N
2032-06-13	\N	\N	\N	\N	\N	\N	\N	\N
2032-06-14	\N	\N	\N	\N	\N	\N	\N	\N
2032-06-15	\N	\N	\N	\N	\N	\N	\N	\N
2032-06-16	\N	\N	\N	\N	\N	\N	\N	\N
2032-06-17	\N	\N	\N	\N	\N	\N	\N	\N
2032-06-18	\N	\N	\N	\N	\N	\N	\N	\N
2032-06-19	\N	\N	\N	\N	\N	\N	\N	\N
2032-06-20	\N	\N	\N	\N	\N	\N	\N	\N
2032-06-21	\N	\N	\N	\N	\N	\N	\N	\N
2032-06-22	\N	\N	\N	\N	\N	\N	\N	\N
2032-06-23	\N	\N	\N	\N	\N	\N	\N	\N
2032-06-24	\N	\N	\N	\N	\N	\N	\N	\N
2032-06-25	\N	\N	\N	\N	\N	\N	\N	\N
2032-06-26	\N	\N	\N	\N	\N	\N	\N	\N
2032-06-27	\N	\N	\N	\N	\N	\N	\N	\N
2032-06-28	\N	\N	\N	\N	\N	\N	\N	\N
2032-06-29	\N	\N	\N	\N	\N	\N	\N	\N
2032-06-30	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-01	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-02	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-03	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-04	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-05	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-06	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-07	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-08	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-09	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-10	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-11	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-12	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-13	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-14	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-15	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-16	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-17	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-18	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-19	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-20	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-21	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-22	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-23	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-24	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-25	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-26	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-27	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-28	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-29	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-30	\N	\N	\N	\N	\N	\N	\N	\N
2032-07-31	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-01	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-02	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-03	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-04	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-05	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-06	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-07	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-08	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-09	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-10	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-11	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-12	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-13	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-14	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-15	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-16	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-17	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-18	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-19	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-20	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-21	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-22	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-23	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-24	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-25	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-26	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-27	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-28	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-29	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-30	\N	\N	\N	\N	\N	\N	\N	\N
2032-08-31	\N	\N	\N	\N	\N	\N	\N	\N
2032-09-01	\N	\N	\N	\N	\N	\N	\N	\N
2032-09-02	\N	\N	\N	\N	\N	\N	\N	\N
2032-09-03	\N	\N	\N	\N	\N	\N	\N	\N
2032-09-04	\N	\N	\N	\N	\N	\N	\N	\N
2032-09-05	\N	\N	\N	\N	\N	\N	\N	\N
2032-09-06	\N	\N	\N	\N	\N	\N	\N	\N
2032-09-07	\N	\N	\N	\N	\N	\N	\N	\N
2032-09-08	\N	\N	\N	\N	\N	\N	\N	\N
2032-09-09	\N	\N	\N	\N	\N	\N	\N	\N
2032-09-10	\N	\N	\N	\N	\N	\N	\N	\N
2032-09-11	\N	\N	\N	\N	\N	\N	\N	\N
2032-09-12	\N	\N	\N	\N	\N	\N	\N	\N
2032-09-13	\N	\N	\N	\N	\N	\N	\N	\N
2032-09-14	\N	\N	\N	\N	\N	\N	\N	\N
2032-09-15	\N	\N	\N	\N	\N	\N	\N	\N
2032-09-16	\N	\N	\N	\N	\N	\N	\N	\N
2032-09-17	\N	\N	\N	\N	\N	\N	\N	\N
2032-09-18	\N	\N	\N	\N	\N	\N	\N	\N
2032-09-19	\N	\N	\N	\N	\N	\N	\N	\N
2032-09-20	\N	\N	\N	\N	\N	\N	\N	\N
2032-09-21	\N	\N	\N	\N	\N	\N	\N	\N
2032-09-22	\N	\N	\N	\N	\N	\N	\N	\N
2032-09-23	\N	\N	\N	\N	\N	\N	\N	\N
2032-09-24	\N	\N	\N	\N	\N	\N	\N	\N
2032-09-25	\N	\N	\N	\N	\N	\N	\N	\N
2032-09-26	\N	\N	\N	\N	\N	\N	\N	\N
2032-09-27	\N	\N	\N	\N	\N	\N	\N	\N
2032-09-28	\N	\N	\N	\N	\N	\N	\N	\N
2032-09-29	\N	\N	\N	\N	\N	\N	\N	\N
2032-09-30	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-01	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-02	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-03	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-04	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-05	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-06	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-07	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-08	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-09	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-10	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-11	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-12	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-13	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-14	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-15	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-16	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-17	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-18	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-19	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-20	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-21	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-22	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-23	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-24	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-25	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-26	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-27	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-28	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-29	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-30	\N	\N	\N	\N	\N	\N	\N	\N
2032-10-31	\N	\N	\N	\N	\N	\N	\N	\N
2032-11-01	\N	\N	\N	\N	\N	\N	\N	\N
2032-11-02	\N	\N	\N	\N	\N	\N	\N	\N
2032-11-03	\N	\N	\N	\N	\N	\N	\N	\N
2032-11-04	\N	\N	\N	\N	\N	\N	\N	\N
2032-11-05	\N	\N	\N	\N	\N	\N	\N	\N
2032-11-06	\N	\N	\N	\N	\N	\N	\N	\N
2032-11-07	\N	\N	\N	\N	\N	\N	\N	\N
2032-11-08	\N	\N	\N	\N	\N	\N	\N	\N
2032-11-09	\N	\N	\N	\N	\N	\N	\N	\N
2032-11-10	\N	\N	\N	\N	\N	\N	\N	\N
2032-11-11	\N	\N	\N	\N	\N	\N	\N	\N
2032-11-12	\N	\N	\N	\N	\N	\N	\N	\N
2032-11-13	\N	\N	\N	\N	\N	\N	\N	\N
2032-11-14	\N	\N	\N	\N	\N	\N	\N	\N
2032-11-15	\N	\N	\N	\N	\N	\N	\N	\N
2032-11-16	\N	\N	\N	\N	\N	\N	\N	\N
2032-11-17	\N	\N	\N	\N	\N	\N	\N	\N
2032-11-18	\N	\N	\N	\N	\N	\N	\N	\N
2032-11-19	\N	\N	\N	\N	\N	\N	\N	\N
2032-11-20	\N	\N	\N	\N	\N	\N	\N	\N
2032-11-21	\N	\N	\N	\N	\N	\N	\N	\N
2032-11-22	\N	\N	\N	\N	\N	\N	\N	\N
2032-11-23	\N	\N	\N	\N	\N	\N	\N	\N
2032-11-24	\N	\N	\N	\N	\N	\N	\N	\N
2032-11-25	\N	\N	\N	\N	\N	\N	\N	\N
2032-11-26	\N	\N	\N	\N	\N	\N	\N	\N
2032-11-27	\N	\N	\N	\N	\N	\N	\N	\N
2032-11-28	\N	\N	\N	\N	\N	\N	\N	\N
2032-11-29	\N	\N	\N	\N	\N	\N	\N	\N
2032-11-30	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-01	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-02	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-03	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-04	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-05	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-06	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-07	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-08	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-09	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-10	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-11	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-12	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-13	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-14	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-15	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-16	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-17	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-18	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-19	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-20	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-21	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-22	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-23	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-24	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-25	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-26	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-27	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-28	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-29	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-30	\N	\N	\N	\N	\N	\N	\N	\N
2032-12-31	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-01	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-02	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-03	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-04	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-05	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-06	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-07	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-08	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-09	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-10	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-11	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-12	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-13	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-14	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-15	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-16	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-17	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-18	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-19	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-20	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-21	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-22	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-23	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-24	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-25	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-26	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-27	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-28	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-29	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-30	\N	\N	\N	\N	\N	\N	\N	\N
2033-01-31	\N	\N	\N	\N	\N	\N	\N	\N
2033-02-01	\N	\N	\N	\N	\N	\N	\N	\N
2033-02-02	\N	\N	\N	\N	\N	\N	\N	\N
2033-02-03	\N	\N	\N	\N	\N	\N	\N	\N
2033-02-04	\N	\N	\N	\N	\N	\N	\N	\N
2033-02-05	\N	\N	\N	\N	\N	\N	\N	\N
2033-02-06	\N	\N	\N	\N	\N	\N	\N	\N
2033-02-07	\N	\N	\N	\N	\N	\N	\N	\N
2033-02-08	\N	\N	\N	\N	\N	\N	\N	\N
2033-02-09	\N	\N	\N	\N	\N	\N	\N	\N
2033-02-10	\N	\N	\N	\N	\N	\N	\N	\N
2033-02-11	\N	\N	\N	\N	\N	\N	\N	\N
2033-02-12	\N	\N	\N	\N	\N	\N	\N	\N
2033-02-13	\N	\N	\N	\N	\N	\N	\N	\N
2033-02-14	\N	\N	\N	\N	\N	\N	\N	\N
2033-02-15	\N	\N	\N	\N	\N	\N	\N	\N
2033-02-16	\N	\N	\N	\N	\N	\N	\N	\N
2033-02-17	\N	\N	\N	\N	\N	\N	\N	\N
2033-02-18	\N	\N	\N	\N	\N	\N	\N	\N
2033-02-19	\N	\N	\N	\N	\N	\N	\N	\N
2033-02-20	\N	\N	\N	\N	\N	\N	\N	\N
2033-02-21	\N	\N	\N	\N	\N	\N	\N	\N
2033-02-22	\N	\N	\N	\N	\N	\N	\N	\N
2033-02-23	\N	\N	\N	\N	\N	\N	\N	\N
2033-02-24	\N	\N	\N	\N	\N	\N	\N	\N
2033-02-25	\N	\N	\N	\N	\N	\N	\N	\N
2033-02-26	\N	\N	\N	\N	\N	\N	\N	\N
2033-02-27	\N	\N	\N	\N	\N	\N	\N	\N
2033-02-28	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-01	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-02	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-03	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-04	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-05	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-06	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-07	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-08	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-09	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-10	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-11	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-12	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-13	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-14	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-15	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-16	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-17	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-18	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-19	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-20	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-21	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-22	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-23	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-24	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-25	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-26	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-27	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-28	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-29	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-30	\N	\N	\N	\N	\N	\N	\N	\N
2033-03-31	\N	\N	\N	\N	\N	\N	\N	\N
2033-04-01	\N	\N	\N	\N	\N	\N	\N	\N
2033-04-02	\N	\N	\N	\N	\N	\N	\N	\N
2033-04-03	\N	\N	\N	\N	\N	\N	\N	\N
2033-04-04	\N	\N	\N	\N	\N	\N	\N	\N
2033-04-05	\N	\N	\N	\N	\N	\N	\N	\N
2033-04-06	\N	\N	\N	\N	\N	\N	\N	\N
2033-04-07	\N	\N	\N	\N	\N	\N	\N	\N
2033-04-08	\N	\N	\N	\N	\N	\N	\N	\N
2033-04-09	\N	\N	\N	\N	\N	\N	\N	\N
2033-04-10	\N	\N	\N	\N	\N	\N	\N	\N
2033-04-11	\N	\N	\N	\N	\N	\N	\N	\N
2033-04-12	\N	\N	\N	\N	\N	\N	\N	\N
2033-04-13	\N	\N	\N	\N	\N	\N	\N	\N
2033-04-14	\N	\N	\N	\N	\N	\N	\N	\N
2033-04-15	\N	\N	\N	\N	\N	\N	\N	\N
2033-04-16	\N	\N	\N	\N	\N	\N	\N	\N
2033-04-17	\N	\N	\N	\N	\N	\N	\N	\N
2033-04-18	\N	\N	\N	\N	\N	\N	\N	\N
2033-04-19	\N	\N	\N	\N	\N	\N	\N	\N
2033-04-20	\N	\N	\N	\N	\N	\N	\N	\N
2033-04-21	\N	\N	\N	\N	\N	\N	\N	\N
2033-04-22	\N	\N	\N	\N	\N	\N	\N	\N
2033-04-23	\N	\N	\N	\N	\N	\N	\N	\N
2033-04-24	\N	\N	\N	\N	\N	\N	\N	\N
2033-04-25	\N	\N	\N	\N	\N	\N	\N	\N
2033-04-26	\N	\N	\N	\N	\N	\N	\N	\N
2033-04-27	\N	\N	\N	\N	\N	\N	\N	\N
2033-04-28	\N	\N	\N	\N	\N	\N	\N	\N
2033-04-29	\N	\N	\N	\N	\N	\N	\N	\N
2033-04-30	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-01	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-02	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-03	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-04	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-05	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-06	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-07	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-08	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-09	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-10	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-11	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-12	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-13	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-14	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-15	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-16	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-17	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-18	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-19	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-20	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-21	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-22	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-23	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-24	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-25	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-26	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-27	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-28	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-29	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-30	\N	\N	\N	\N	\N	\N	\N	\N
2033-05-31	\N	\N	\N	\N	\N	\N	\N	\N
2033-06-01	\N	\N	\N	\N	\N	\N	\N	\N
2033-06-02	\N	\N	\N	\N	\N	\N	\N	\N
2033-06-03	\N	\N	\N	\N	\N	\N	\N	\N
2033-06-04	\N	\N	\N	\N	\N	\N	\N	\N
2033-06-05	\N	\N	\N	\N	\N	\N	\N	\N
2033-06-06	\N	\N	\N	\N	\N	\N	\N	\N
2033-06-07	\N	\N	\N	\N	\N	\N	\N	\N
2033-06-08	\N	\N	\N	\N	\N	\N	\N	\N
2033-06-09	\N	\N	\N	\N	\N	\N	\N	\N
2033-06-10	\N	\N	\N	\N	\N	\N	\N	\N
2033-06-11	\N	\N	\N	\N	\N	\N	\N	\N
2033-06-12	\N	\N	\N	\N	\N	\N	\N	\N
2033-06-13	\N	\N	\N	\N	\N	\N	\N	\N
2033-06-14	\N	\N	\N	\N	\N	\N	\N	\N
2033-06-15	\N	\N	\N	\N	\N	\N	\N	\N
2033-06-16	\N	\N	\N	\N	\N	\N	\N	\N
2033-06-17	\N	\N	\N	\N	\N	\N	\N	\N
2033-06-18	\N	\N	\N	\N	\N	\N	\N	\N
2033-06-19	\N	\N	\N	\N	\N	\N	\N	\N
2033-06-20	\N	\N	\N	\N	\N	\N	\N	\N
2033-06-21	\N	\N	\N	\N	\N	\N	\N	\N
2033-06-22	\N	\N	\N	\N	\N	\N	\N	\N
2033-06-23	\N	\N	\N	\N	\N	\N	\N	\N
2033-06-24	\N	\N	\N	\N	\N	\N	\N	\N
2033-06-25	\N	\N	\N	\N	\N	\N	\N	\N
2033-06-26	\N	\N	\N	\N	\N	\N	\N	\N
2033-06-27	\N	\N	\N	\N	\N	\N	\N	\N
2033-06-28	\N	\N	\N	\N	\N	\N	\N	\N
2033-06-29	\N	\N	\N	\N	\N	\N	\N	\N
2033-06-30	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-01	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-02	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-03	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-04	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-05	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-06	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-07	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-08	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-09	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-10	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-11	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-12	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-13	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-14	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-15	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-16	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-17	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-18	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-19	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-20	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-21	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-22	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-23	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-24	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-25	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-26	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-27	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-28	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-29	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-30	\N	\N	\N	\N	\N	\N	\N	\N
2033-07-31	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-01	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-02	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-03	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-04	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-05	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-06	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-07	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-08	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-09	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-10	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-11	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-12	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-13	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-14	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-15	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-16	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-17	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-18	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-19	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-20	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-21	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-22	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-23	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-24	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-25	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-26	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-27	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-28	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-29	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-30	\N	\N	\N	\N	\N	\N	\N	\N
2033-08-31	\N	\N	\N	\N	\N	\N	\N	\N
2033-09-01	\N	\N	\N	\N	\N	\N	\N	\N
2033-09-02	\N	\N	\N	\N	\N	\N	\N	\N
2033-09-03	\N	\N	\N	\N	\N	\N	\N	\N
2033-09-04	\N	\N	\N	\N	\N	\N	\N	\N
2033-09-05	\N	\N	\N	\N	\N	\N	\N	\N
2033-09-06	\N	\N	\N	\N	\N	\N	\N	\N
2033-09-07	\N	\N	\N	\N	\N	\N	\N	\N
2033-09-08	\N	\N	\N	\N	\N	\N	\N	\N
2033-09-09	\N	\N	\N	\N	\N	\N	\N	\N
2033-09-10	\N	\N	\N	\N	\N	\N	\N	\N
2033-09-11	\N	\N	\N	\N	\N	\N	\N	\N
2033-09-12	\N	\N	\N	\N	\N	\N	\N	\N
2033-09-13	\N	\N	\N	\N	\N	\N	\N	\N
2033-09-14	\N	\N	\N	\N	\N	\N	\N	\N
2033-09-15	\N	\N	\N	\N	\N	\N	\N	\N
2033-09-16	\N	\N	\N	\N	\N	\N	\N	\N
2033-09-17	\N	\N	\N	\N	\N	\N	\N	\N
2033-09-18	\N	\N	\N	\N	\N	\N	\N	\N
2033-09-19	\N	\N	\N	\N	\N	\N	\N	\N
2033-09-20	\N	\N	\N	\N	\N	\N	\N	\N
2033-09-21	\N	\N	\N	\N	\N	\N	\N	\N
2033-09-22	\N	\N	\N	\N	\N	\N	\N	\N
2033-09-23	\N	\N	\N	\N	\N	\N	\N	\N
2033-09-24	\N	\N	\N	\N	\N	\N	\N	\N
2033-09-25	\N	\N	\N	\N	\N	\N	\N	\N
2033-09-26	\N	\N	\N	\N	\N	\N	\N	\N
2033-09-27	\N	\N	\N	\N	\N	\N	\N	\N
2033-09-28	\N	\N	\N	\N	\N	\N	\N	\N
2033-09-29	\N	\N	\N	\N	\N	\N	\N	\N
2033-09-30	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-01	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-02	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-03	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-04	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-05	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-06	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-07	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-08	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-09	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-10	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-11	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-12	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-13	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-14	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-15	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-16	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-17	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-18	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-19	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-20	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-21	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-22	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-23	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-24	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-25	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-26	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-27	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-28	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-29	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-30	\N	\N	\N	\N	\N	\N	\N	\N
2033-10-31	\N	\N	\N	\N	\N	\N	\N	\N
2033-11-01	\N	\N	\N	\N	\N	\N	\N	\N
2033-11-02	\N	\N	\N	\N	\N	\N	\N	\N
2033-11-03	\N	\N	\N	\N	\N	\N	\N	\N
2033-11-04	\N	\N	\N	\N	\N	\N	\N	\N
2033-11-05	\N	\N	\N	\N	\N	\N	\N	\N
2033-11-06	\N	\N	\N	\N	\N	\N	\N	\N
2033-11-07	\N	\N	\N	\N	\N	\N	\N	\N
2033-11-08	\N	\N	\N	\N	\N	\N	\N	\N
2033-11-09	\N	\N	\N	\N	\N	\N	\N	\N
2033-11-10	\N	\N	\N	\N	\N	\N	\N	\N
2033-11-11	\N	\N	\N	\N	\N	\N	\N	\N
2033-11-12	\N	\N	\N	\N	\N	\N	\N	\N
2033-11-13	\N	\N	\N	\N	\N	\N	\N	\N
2033-11-14	\N	\N	\N	\N	\N	\N	\N	\N
2033-11-15	\N	\N	\N	\N	\N	\N	\N	\N
2033-11-16	\N	\N	\N	\N	\N	\N	\N	\N
2033-11-17	\N	\N	\N	\N	\N	\N	\N	\N
2033-11-18	\N	\N	\N	\N	\N	\N	\N	\N
2033-11-19	\N	\N	\N	\N	\N	\N	\N	\N
2033-11-20	\N	\N	\N	\N	\N	\N	\N	\N
2033-11-21	\N	\N	\N	\N	\N	\N	\N	\N
2033-11-22	\N	\N	\N	\N	\N	\N	\N	\N
2033-11-23	\N	\N	\N	\N	\N	\N	\N	\N
2033-11-24	\N	\N	\N	\N	\N	\N	\N	\N
2033-11-25	\N	\N	\N	\N	\N	\N	\N	\N
2033-11-26	\N	\N	\N	\N	\N	\N	\N	\N
2033-11-27	\N	\N	\N	\N	\N	\N	\N	\N
2033-11-28	\N	\N	\N	\N	\N	\N	\N	\N
2033-11-29	\N	\N	\N	\N	\N	\N	\N	\N
2033-11-30	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-01	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-02	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-03	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-04	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-05	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-06	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-07	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-08	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-09	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-10	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-11	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-12	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-13	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-14	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-15	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-16	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-17	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-18	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-19	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-20	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-21	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-22	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-23	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-24	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-25	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-26	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-27	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-28	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-29	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-30	\N	\N	\N	\N	\N	\N	\N	\N
2033-12-31	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-01	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-02	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-03	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-04	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-05	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-06	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-07	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-08	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-09	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-10	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-11	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-12	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-13	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-14	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-15	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-16	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-17	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-18	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-19	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-20	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-21	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-22	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-23	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-24	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-25	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-26	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-27	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-28	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-29	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-30	\N	\N	\N	\N	\N	\N	\N	\N
2034-01-31	\N	\N	\N	\N	\N	\N	\N	\N
2034-02-01	\N	\N	\N	\N	\N	\N	\N	\N
2034-02-02	\N	\N	\N	\N	\N	\N	\N	\N
2034-02-03	\N	\N	\N	\N	\N	\N	\N	\N
2034-02-04	\N	\N	\N	\N	\N	\N	\N	\N
2034-02-05	\N	\N	\N	\N	\N	\N	\N	\N
2034-02-06	\N	\N	\N	\N	\N	\N	\N	\N
2034-02-07	\N	\N	\N	\N	\N	\N	\N	\N
2034-02-08	\N	\N	\N	\N	\N	\N	\N	\N
2034-02-09	\N	\N	\N	\N	\N	\N	\N	\N
2034-02-10	\N	\N	\N	\N	\N	\N	\N	\N
2034-02-11	\N	\N	\N	\N	\N	\N	\N	\N
2034-02-12	\N	\N	\N	\N	\N	\N	\N	\N
2034-02-13	\N	\N	\N	\N	\N	\N	\N	\N
2034-02-14	\N	\N	\N	\N	\N	\N	\N	\N
2034-02-15	\N	\N	\N	\N	\N	\N	\N	\N
2034-02-16	\N	\N	\N	\N	\N	\N	\N	\N
2034-02-17	\N	\N	\N	\N	\N	\N	\N	\N
2034-02-18	\N	\N	\N	\N	\N	\N	\N	\N
2034-02-19	\N	\N	\N	\N	\N	\N	\N	\N
2034-02-20	\N	\N	\N	\N	\N	\N	\N	\N
2034-02-21	\N	\N	\N	\N	\N	\N	\N	\N
2034-02-22	\N	\N	\N	\N	\N	\N	\N	\N
2034-02-23	\N	\N	\N	\N	\N	\N	\N	\N
2034-02-24	\N	\N	\N	\N	\N	\N	\N	\N
2034-02-25	\N	\N	\N	\N	\N	\N	\N	\N
2034-02-26	\N	\N	\N	\N	\N	\N	\N	\N
2034-02-27	\N	\N	\N	\N	\N	\N	\N	\N
2034-02-28	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-01	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-02	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-03	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-04	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-05	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-06	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-07	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-08	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-09	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-10	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-11	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-12	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-13	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-14	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-15	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-16	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-17	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-18	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-19	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-20	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-21	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-22	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-23	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-24	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-25	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-26	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-27	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-28	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-29	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-30	\N	\N	\N	\N	\N	\N	\N	\N
2034-03-31	\N	\N	\N	\N	\N	\N	\N	\N
2034-04-01	\N	\N	\N	\N	\N	\N	\N	\N
2034-04-02	\N	\N	\N	\N	\N	\N	\N	\N
2034-04-03	\N	\N	\N	\N	\N	\N	\N	\N
2034-04-04	\N	\N	\N	\N	\N	\N	\N	\N
2034-04-05	\N	\N	\N	\N	\N	\N	\N	\N
2034-04-06	\N	\N	\N	\N	\N	\N	\N	\N
2034-04-07	\N	\N	\N	\N	\N	\N	\N	\N
2034-04-08	\N	\N	\N	\N	\N	\N	\N	\N
2034-04-09	\N	\N	\N	\N	\N	\N	\N	\N
2034-04-10	\N	\N	\N	\N	\N	\N	\N	\N
2034-04-11	\N	\N	\N	\N	\N	\N	\N	\N
2034-04-12	\N	\N	\N	\N	\N	\N	\N	\N
2034-04-13	\N	\N	\N	\N	\N	\N	\N	\N
2034-04-14	\N	\N	\N	\N	\N	\N	\N	\N
2034-04-15	\N	\N	\N	\N	\N	\N	\N	\N
2034-04-16	\N	\N	\N	\N	\N	\N	\N	\N
2034-04-17	\N	\N	\N	\N	\N	\N	\N	\N
2034-04-18	\N	\N	\N	\N	\N	\N	\N	\N
2034-04-19	\N	\N	\N	\N	\N	\N	\N	\N
2034-04-20	\N	\N	\N	\N	\N	\N	\N	\N
2034-04-21	\N	\N	\N	\N	\N	\N	\N	\N
2034-04-22	\N	\N	\N	\N	\N	\N	\N	\N
2034-04-23	\N	\N	\N	\N	\N	\N	\N	\N
2034-04-24	\N	\N	\N	\N	\N	\N	\N	\N
2034-04-25	\N	\N	\N	\N	\N	\N	\N	\N
2034-04-26	\N	\N	\N	\N	\N	\N	\N	\N
2034-04-27	\N	\N	\N	\N	\N	\N	\N	\N
2034-04-28	\N	\N	\N	\N	\N	\N	\N	\N
2034-04-29	\N	\N	\N	\N	\N	\N	\N	\N
2034-04-30	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-01	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-02	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-03	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-04	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-05	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-06	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-07	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-08	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-09	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-10	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-11	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-12	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-13	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-14	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-15	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-16	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-17	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-18	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-19	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-20	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-21	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-22	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-23	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-24	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-25	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-26	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-27	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-28	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-29	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-30	\N	\N	\N	\N	\N	\N	\N	\N
2034-05-31	\N	\N	\N	\N	\N	\N	\N	\N
2034-06-01	\N	\N	\N	\N	\N	\N	\N	\N
2034-06-02	\N	\N	\N	\N	\N	\N	\N	\N
2034-06-03	\N	\N	\N	\N	\N	\N	\N	\N
2034-06-04	\N	\N	\N	\N	\N	\N	\N	\N
2034-06-05	\N	\N	\N	\N	\N	\N	\N	\N
2034-06-06	\N	\N	\N	\N	\N	\N	\N	\N
2034-06-07	\N	\N	\N	\N	\N	\N	\N	\N
2034-06-08	\N	\N	\N	\N	\N	\N	\N	\N
2034-06-09	\N	\N	\N	\N	\N	\N	\N	\N
2034-06-10	\N	\N	\N	\N	\N	\N	\N	\N
2034-06-11	\N	\N	\N	\N	\N	\N	\N	\N
2034-06-12	\N	\N	\N	\N	\N	\N	\N	\N
2034-06-13	\N	\N	\N	\N	\N	\N	\N	\N
2034-06-14	\N	\N	\N	\N	\N	\N	\N	\N
2034-06-15	\N	\N	\N	\N	\N	\N	\N	\N
2034-06-16	\N	\N	\N	\N	\N	\N	\N	\N
2034-06-17	\N	\N	\N	\N	\N	\N	\N	\N
2034-06-18	\N	\N	\N	\N	\N	\N	\N	\N
2034-06-19	\N	\N	\N	\N	\N	\N	\N	\N
2034-06-20	\N	\N	\N	\N	\N	\N	\N	\N
2034-06-21	\N	\N	\N	\N	\N	\N	\N	\N
2034-06-22	\N	\N	\N	\N	\N	\N	\N	\N
2034-06-23	\N	\N	\N	\N	\N	\N	\N	\N
2034-06-24	\N	\N	\N	\N	\N	\N	\N	\N
2034-06-25	\N	\N	\N	\N	\N	\N	\N	\N
2034-06-26	\N	\N	\N	\N	\N	\N	\N	\N
2034-06-27	\N	\N	\N	\N	\N	\N	\N	\N
2034-06-28	\N	\N	\N	\N	\N	\N	\N	\N
2034-06-29	\N	\N	\N	\N	\N	\N	\N	\N
2034-06-30	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-01	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-02	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-03	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-04	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-05	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-06	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-07	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-08	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-09	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-10	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-11	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-12	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-13	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-14	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-15	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-16	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-17	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-18	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-19	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-20	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-21	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-22	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-23	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-24	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-25	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-26	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-27	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-28	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-29	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-30	\N	\N	\N	\N	\N	\N	\N	\N
2034-07-31	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-01	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-02	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-03	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-04	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-05	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-06	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-07	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-08	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-09	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-10	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-11	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-12	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-13	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-14	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-15	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-16	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-17	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-18	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-19	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-20	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-21	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-22	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-23	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-24	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-25	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-26	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-27	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-28	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-29	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-30	\N	\N	\N	\N	\N	\N	\N	\N
2034-08-31	\N	\N	\N	\N	\N	\N	\N	\N
2034-09-01	\N	\N	\N	\N	\N	\N	\N	\N
2034-09-02	\N	\N	\N	\N	\N	\N	\N	\N
2034-09-03	\N	\N	\N	\N	\N	\N	\N	\N
2034-09-04	\N	\N	\N	\N	\N	\N	\N	\N
2034-09-05	\N	\N	\N	\N	\N	\N	\N	\N
2034-09-06	\N	\N	\N	\N	\N	\N	\N	\N
2034-09-07	\N	\N	\N	\N	\N	\N	\N	\N
2034-09-08	\N	\N	\N	\N	\N	\N	\N	\N
2034-09-09	\N	\N	\N	\N	\N	\N	\N	\N
2034-09-10	\N	\N	\N	\N	\N	\N	\N	\N
2034-09-11	\N	\N	\N	\N	\N	\N	\N	\N
2034-09-12	\N	\N	\N	\N	\N	\N	\N	\N
2034-09-13	\N	\N	\N	\N	\N	\N	\N	\N
2034-09-14	\N	\N	\N	\N	\N	\N	\N	\N
2034-09-15	\N	\N	\N	\N	\N	\N	\N	\N
2034-09-16	\N	\N	\N	\N	\N	\N	\N	\N
2034-09-17	\N	\N	\N	\N	\N	\N	\N	\N
2034-09-18	\N	\N	\N	\N	\N	\N	\N	\N
2034-09-19	\N	\N	\N	\N	\N	\N	\N	\N
2034-09-20	\N	\N	\N	\N	\N	\N	\N	\N
2034-09-21	\N	\N	\N	\N	\N	\N	\N	\N
2034-09-22	\N	\N	\N	\N	\N	\N	\N	\N
2034-09-23	\N	\N	\N	\N	\N	\N	\N	\N
2034-09-24	\N	\N	\N	\N	\N	\N	\N	\N
2034-09-25	\N	\N	\N	\N	\N	\N	\N	\N
2034-09-26	\N	\N	\N	\N	\N	\N	\N	\N
2034-09-27	\N	\N	\N	\N	\N	\N	\N	\N
2034-09-28	\N	\N	\N	\N	\N	\N	\N	\N
2034-09-29	\N	\N	\N	\N	\N	\N	\N	\N
2034-09-30	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-01	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-02	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-03	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-04	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-05	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-06	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-07	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-08	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-09	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-10	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-11	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-12	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-13	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-14	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-15	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-16	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-17	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-18	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-19	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-20	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-21	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-22	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-23	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-24	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-25	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-26	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-27	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-28	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-29	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-30	\N	\N	\N	\N	\N	\N	\N	\N
2034-10-31	\N	\N	\N	\N	\N	\N	\N	\N
2034-11-01	\N	\N	\N	\N	\N	\N	\N	\N
2034-11-02	\N	\N	\N	\N	\N	\N	\N	\N
2034-11-03	\N	\N	\N	\N	\N	\N	\N	\N
2034-11-04	\N	\N	\N	\N	\N	\N	\N	\N
2034-11-05	\N	\N	\N	\N	\N	\N	\N	\N
2034-11-06	\N	\N	\N	\N	\N	\N	\N	\N
2034-11-07	\N	\N	\N	\N	\N	\N	\N	\N
2034-11-08	\N	\N	\N	\N	\N	\N	\N	\N
2034-11-09	\N	\N	\N	\N	\N	\N	\N	\N
2034-11-10	\N	\N	\N	\N	\N	\N	\N	\N
2034-11-11	\N	\N	\N	\N	\N	\N	\N	\N
2034-11-12	\N	\N	\N	\N	\N	\N	\N	\N
2034-11-13	\N	\N	\N	\N	\N	\N	\N	\N
2034-11-14	\N	\N	\N	\N	\N	\N	\N	\N
2034-11-15	\N	\N	\N	\N	\N	\N	\N	\N
2034-11-16	\N	\N	\N	\N	\N	\N	\N	\N
2034-11-17	\N	\N	\N	\N	\N	\N	\N	\N
2034-11-18	\N	\N	\N	\N	\N	\N	\N	\N
2034-11-19	\N	\N	\N	\N	\N	\N	\N	\N
2034-11-20	\N	\N	\N	\N	\N	\N	\N	\N
2034-11-21	\N	\N	\N	\N	\N	\N	\N	\N
2034-11-22	\N	\N	\N	\N	\N	\N	\N	\N
2034-11-23	\N	\N	\N	\N	\N	\N	\N	\N
2034-11-24	\N	\N	\N	\N	\N	\N	\N	\N
2034-11-25	\N	\N	\N	\N	\N	\N	\N	\N
2034-11-26	\N	\N	\N	\N	\N	\N	\N	\N
2034-11-27	\N	\N	\N	\N	\N	\N	\N	\N
2034-11-28	\N	\N	\N	\N	\N	\N	\N	\N
2034-11-29	\N	\N	\N	\N	\N	\N	\N	\N
2034-11-30	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-01	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-02	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-03	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-04	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-05	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-06	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-07	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-08	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-09	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-10	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-11	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-12	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-13	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-14	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-15	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-16	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-17	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-18	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-19	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-20	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-21	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-22	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-23	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-24	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-25	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-26	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-27	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-28	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-29	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-30	\N	\N	\N	\N	\N	\N	\N	\N
2034-12-31	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-01	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-02	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-03	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-04	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-05	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-06	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-07	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-08	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-09	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-10	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-11	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-12	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-13	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-14	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-15	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-16	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-17	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-18	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-19	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-20	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-21	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-22	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-23	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-24	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-25	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-26	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-27	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-28	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-29	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-30	\N	\N	\N	\N	\N	\N	\N	\N
2035-01-31	\N	\N	\N	\N	\N	\N	\N	\N
2035-02-01	\N	\N	\N	\N	\N	\N	\N	\N
2035-02-02	\N	\N	\N	\N	\N	\N	\N	\N
2035-02-03	\N	\N	\N	\N	\N	\N	\N	\N
2035-02-04	\N	\N	\N	\N	\N	\N	\N	\N
2035-02-05	\N	\N	\N	\N	\N	\N	\N	\N
2035-02-06	\N	\N	\N	\N	\N	\N	\N	\N
2035-02-07	\N	\N	\N	\N	\N	\N	\N	\N
2035-02-08	\N	\N	\N	\N	\N	\N	\N	\N
2035-02-09	\N	\N	\N	\N	\N	\N	\N	\N
2035-02-10	\N	\N	\N	\N	\N	\N	\N	\N
2035-02-11	\N	\N	\N	\N	\N	\N	\N	\N
2035-02-12	\N	\N	\N	\N	\N	\N	\N	\N
2035-02-13	\N	\N	\N	\N	\N	\N	\N	\N
2035-02-14	\N	\N	\N	\N	\N	\N	\N	\N
2035-02-15	\N	\N	\N	\N	\N	\N	\N	\N
2035-02-16	\N	\N	\N	\N	\N	\N	\N	\N
2035-02-17	\N	\N	\N	\N	\N	\N	\N	\N
2035-02-18	\N	\N	\N	\N	\N	\N	\N	\N
2035-02-19	\N	\N	\N	\N	\N	\N	\N	\N
2035-02-20	\N	\N	\N	\N	\N	\N	\N	\N
2035-02-21	\N	\N	\N	\N	\N	\N	\N	\N
2035-02-22	\N	\N	\N	\N	\N	\N	\N	\N
2035-02-23	\N	\N	\N	\N	\N	\N	\N	\N
2035-02-24	\N	\N	\N	\N	\N	\N	\N	\N
2035-02-25	\N	\N	\N	\N	\N	\N	\N	\N
2035-02-26	\N	\N	\N	\N	\N	\N	\N	\N
2035-02-27	\N	\N	\N	\N	\N	\N	\N	\N
2035-02-28	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-01	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-02	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-03	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-04	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-05	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-06	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-07	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-08	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-09	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-10	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-11	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-12	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-13	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-14	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-15	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-16	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-17	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-18	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-19	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-20	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-21	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-22	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-23	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-24	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-25	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-26	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-27	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-28	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-29	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-30	\N	\N	\N	\N	\N	\N	\N	\N
2035-03-31	\N	\N	\N	\N	\N	\N	\N	\N
2035-04-01	\N	\N	\N	\N	\N	\N	\N	\N
2035-04-02	\N	\N	\N	\N	\N	\N	\N	\N
2035-04-03	\N	\N	\N	\N	\N	\N	\N	\N
2035-04-04	\N	\N	\N	\N	\N	\N	\N	\N
2035-04-05	\N	\N	\N	\N	\N	\N	\N	\N
2035-04-06	\N	\N	\N	\N	\N	\N	\N	\N
2035-04-07	\N	\N	\N	\N	\N	\N	\N	\N
2035-04-08	\N	\N	\N	\N	\N	\N	\N	\N
2035-04-09	\N	\N	\N	\N	\N	\N	\N	\N
2035-04-10	\N	\N	\N	\N	\N	\N	\N	\N
2035-04-11	\N	\N	\N	\N	\N	\N	\N	\N
2035-04-12	\N	\N	\N	\N	\N	\N	\N	\N
2035-04-13	\N	\N	\N	\N	\N	\N	\N	\N
2035-04-14	\N	\N	\N	\N	\N	\N	\N	\N
2035-04-15	\N	\N	\N	\N	\N	\N	\N	\N
2035-04-16	\N	\N	\N	\N	\N	\N	\N	\N
2035-04-17	\N	\N	\N	\N	\N	\N	\N	\N
2035-04-18	\N	\N	\N	\N	\N	\N	\N	\N
2035-04-19	\N	\N	\N	\N	\N	\N	\N	\N
2035-04-20	\N	\N	\N	\N	\N	\N	\N	\N
2035-04-21	\N	\N	\N	\N	\N	\N	\N	\N
2035-04-22	\N	\N	\N	\N	\N	\N	\N	\N
2035-04-23	\N	\N	\N	\N	\N	\N	\N	\N
2035-04-24	\N	\N	\N	\N	\N	\N	\N	\N
2035-04-25	\N	\N	\N	\N	\N	\N	\N	\N
2035-04-26	\N	\N	\N	\N	\N	\N	\N	\N
2035-04-27	\N	\N	\N	\N	\N	\N	\N	\N
2035-04-28	\N	\N	\N	\N	\N	\N	\N	\N
2035-04-29	\N	\N	\N	\N	\N	\N	\N	\N
2035-04-30	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-01	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-02	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-03	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-04	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-05	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-06	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-07	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-08	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-09	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-10	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-11	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-12	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-13	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-14	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-15	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-16	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-17	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-18	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-19	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-20	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-21	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-22	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-23	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-24	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-25	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-26	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-27	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-28	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-29	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-30	\N	\N	\N	\N	\N	\N	\N	\N
2035-05-31	\N	\N	\N	\N	\N	\N	\N	\N
2035-06-01	\N	\N	\N	\N	\N	\N	\N	\N
2035-06-02	\N	\N	\N	\N	\N	\N	\N	\N
2035-06-03	\N	\N	\N	\N	\N	\N	\N	\N
2035-06-04	\N	\N	\N	\N	\N	\N	\N	\N
2035-06-05	\N	\N	\N	\N	\N	\N	\N	\N
2035-06-06	\N	\N	\N	\N	\N	\N	\N	\N
2035-06-07	\N	\N	\N	\N	\N	\N	\N	\N
2035-06-08	\N	\N	\N	\N	\N	\N	\N	\N
2035-06-09	\N	\N	\N	\N	\N	\N	\N	\N
2035-06-10	\N	\N	\N	\N	\N	\N	\N	\N
2035-06-11	\N	\N	\N	\N	\N	\N	\N	\N
2035-06-12	\N	\N	\N	\N	\N	\N	\N	\N
2035-06-13	\N	\N	\N	\N	\N	\N	\N	\N
2035-06-14	\N	\N	\N	\N	\N	\N	\N	\N
2035-06-15	\N	\N	\N	\N	\N	\N	\N	\N
2035-06-16	\N	\N	\N	\N	\N	\N	\N	\N
2035-06-17	\N	\N	\N	\N	\N	\N	\N	\N
2035-06-18	\N	\N	\N	\N	\N	\N	\N	\N
2035-06-19	\N	\N	\N	\N	\N	\N	\N	\N
2035-06-20	\N	\N	\N	\N	\N	\N	\N	\N
2035-06-21	\N	\N	\N	\N	\N	\N	\N	\N
2035-06-22	\N	\N	\N	\N	\N	\N	\N	\N
2035-06-23	\N	\N	\N	\N	\N	\N	\N	\N
2035-06-24	\N	\N	\N	\N	\N	\N	\N	\N
2035-06-25	\N	\N	\N	\N	\N	\N	\N	\N
2035-06-26	\N	\N	\N	\N	\N	\N	\N	\N
2035-06-27	\N	\N	\N	\N	\N	\N	\N	\N
2035-06-28	\N	\N	\N	\N	\N	\N	\N	\N
2035-06-29	\N	\N	\N	\N	\N	\N	\N	\N
2035-06-30	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-01	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-02	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-03	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-04	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-05	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-06	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-07	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-08	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-09	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-10	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-11	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-12	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-13	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-14	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-15	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-16	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-17	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-18	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-19	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-20	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-21	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-22	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-23	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-24	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-25	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-26	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-27	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-28	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-29	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-30	\N	\N	\N	\N	\N	\N	\N	\N
2035-07-31	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-01	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-02	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-03	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-04	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-05	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-06	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-07	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-08	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-09	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-10	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-11	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-12	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-13	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-14	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-15	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-16	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-17	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-18	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-19	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-20	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-21	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-22	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-23	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-24	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-25	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-26	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-27	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-28	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-29	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-30	\N	\N	\N	\N	\N	\N	\N	\N
2035-08-31	\N	\N	\N	\N	\N	\N	\N	\N
2035-09-01	\N	\N	\N	\N	\N	\N	\N	\N
2035-09-02	\N	\N	\N	\N	\N	\N	\N	\N
2035-09-03	\N	\N	\N	\N	\N	\N	\N	\N
2035-09-04	\N	\N	\N	\N	\N	\N	\N	\N
2035-09-05	\N	\N	\N	\N	\N	\N	\N	\N
2035-09-06	\N	\N	\N	\N	\N	\N	\N	\N
2035-09-07	\N	\N	\N	\N	\N	\N	\N	\N
2035-09-08	\N	\N	\N	\N	\N	\N	\N	\N
2035-09-09	\N	\N	\N	\N	\N	\N	\N	\N
2035-09-10	\N	\N	\N	\N	\N	\N	\N	\N
2035-09-11	\N	\N	\N	\N	\N	\N	\N	\N
2035-09-12	\N	\N	\N	\N	\N	\N	\N	\N
2035-09-13	\N	\N	\N	\N	\N	\N	\N	\N
2035-09-14	\N	\N	\N	\N	\N	\N	\N	\N
2035-09-15	\N	\N	\N	\N	\N	\N	\N	\N
2035-09-16	\N	\N	\N	\N	\N	\N	\N	\N
2035-09-17	\N	\N	\N	\N	\N	\N	\N	\N
2035-09-18	\N	\N	\N	\N	\N	\N	\N	\N
2035-09-19	\N	\N	\N	\N	\N	\N	\N	\N
2035-09-20	\N	\N	\N	\N	\N	\N	\N	\N
2035-09-21	\N	\N	\N	\N	\N	\N	\N	\N
2035-09-22	\N	\N	\N	\N	\N	\N	\N	\N
2035-09-23	\N	\N	\N	\N	\N	\N	\N	\N
2035-09-24	\N	\N	\N	\N	\N	\N	\N	\N
2035-09-25	\N	\N	\N	\N	\N	\N	\N	\N
2035-09-26	\N	\N	\N	\N	\N	\N	\N	\N
2035-09-27	\N	\N	\N	\N	\N	\N	\N	\N
2035-09-28	\N	\N	\N	\N	\N	\N	\N	\N
2035-09-29	\N	\N	\N	\N	\N	\N	\N	\N
2035-09-30	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-01	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-02	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-03	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-04	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-05	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-06	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-07	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-08	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-09	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-10	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-11	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-12	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-13	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-14	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-15	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-16	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-17	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-18	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-19	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-20	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-21	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-22	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-23	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-24	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-25	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-26	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-27	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-28	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-29	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-30	\N	\N	\N	\N	\N	\N	\N	\N
2035-10-31	\N	\N	\N	\N	\N	\N	\N	\N
2035-11-01	\N	\N	\N	\N	\N	\N	\N	\N
2035-11-02	\N	\N	\N	\N	\N	\N	\N	\N
2035-11-03	\N	\N	\N	\N	\N	\N	\N	\N
2035-11-04	\N	\N	\N	\N	\N	\N	\N	\N
2035-11-05	\N	\N	\N	\N	\N	\N	\N	\N
2035-11-06	\N	\N	\N	\N	\N	\N	\N	\N
2035-11-07	\N	\N	\N	\N	\N	\N	\N	\N
2035-11-08	\N	\N	\N	\N	\N	\N	\N	\N
2035-11-09	\N	\N	\N	\N	\N	\N	\N	\N
2035-11-10	\N	\N	\N	\N	\N	\N	\N	\N
2035-11-11	\N	\N	\N	\N	\N	\N	\N	\N
2035-11-12	\N	\N	\N	\N	\N	\N	\N	\N
2035-11-13	\N	\N	\N	\N	\N	\N	\N	\N
2035-11-14	\N	\N	\N	\N	\N	\N	\N	\N
2035-11-15	\N	\N	\N	\N	\N	\N	\N	\N
2035-11-16	\N	\N	\N	\N	\N	\N	\N	\N
2035-11-17	\N	\N	\N	\N	\N	\N	\N	\N
2035-11-18	\N	\N	\N	\N	\N	\N	\N	\N
2035-11-19	\N	\N	\N	\N	\N	\N	\N	\N
2035-11-20	\N	\N	\N	\N	\N	\N	\N	\N
2035-11-21	\N	\N	\N	\N	\N	\N	\N	\N
2035-11-22	\N	\N	\N	\N	\N	\N	\N	\N
2035-11-23	\N	\N	\N	\N	\N	\N	\N	\N
2035-11-24	\N	\N	\N	\N	\N	\N	\N	\N
2035-11-25	\N	\N	\N	\N	\N	\N	\N	\N
2035-11-26	\N	\N	\N	\N	\N	\N	\N	\N
2035-11-27	\N	\N	\N	\N	\N	\N	\N	\N
2035-11-28	\N	\N	\N	\N	\N	\N	\N	\N
2035-11-29	\N	\N	\N	\N	\N	\N	\N	\N
2035-11-30	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-01	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-02	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-03	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-04	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-05	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-06	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-07	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-08	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-09	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-10	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-11	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-12	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-13	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-14	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-15	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-16	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-17	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-18	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-19	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-20	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-21	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-22	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-23	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-24	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-25	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-26	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-27	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-28	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-29	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-30	\N	\N	\N	\N	\N	\N	\N	\N
2035-12-31	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-01	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-02	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-03	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-04	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-05	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-06	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-07	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-08	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-09	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-10	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-11	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-12	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-13	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-14	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-15	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-16	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-17	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-18	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-19	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-20	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-21	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-22	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-23	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-24	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-25	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-26	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-27	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-28	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-29	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-30	\N	\N	\N	\N	\N	\N	\N	\N
2036-01-31	\N	\N	\N	\N	\N	\N	\N	\N
2036-02-01	\N	\N	\N	\N	\N	\N	\N	\N
2036-02-02	\N	\N	\N	\N	\N	\N	\N	\N
2036-02-03	\N	\N	\N	\N	\N	\N	\N	\N
2036-02-04	\N	\N	\N	\N	\N	\N	\N	\N
2036-02-05	\N	\N	\N	\N	\N	\N	\N	\N
2036-02-06	\N	\N	\N	\N	\N	\N	\N	\N
2036-02-07	\N	\N	\N	\N	\N	\N	\N	\N
2036-02-08	\N	\N	\N	\N	\N	\N	\N	\N
2036-02-09	\N	\N	\N	\N	\N	\N	\N	\N
2036-02-10	\N	\N	\N	\N	\N	\N	\N	\N
2036-02-11	\N	\N	\N	\N	\N	\N	\N	\N
2036-02-12	\N	\N	\N	\N	\N	\N	\N	\N
2036-02-13	\N	\N	\N	\N	\N	\N	\N	\N
2036-02-14	\N	\N	\N	\N	\N	\N	\N	\N
2036-02-15	\N	\N	\N	\N	\N	\N	\N	\N
2036-02-16	\N	\N	\N	\N	\N	\N	\N	\N
2036-02-17	\N	\N	\N	\N	\N	\N	\N	\N
2036-02-18	\N	\N	\N	\N	\N	\N	\N	\N
2036-02-19	\N	\N	\N	\N	\N	\N	\N	\N
2036-02-20	\N	\N	\N	\N	\N	\N	\N	\N
2036-02-21	\N	\N	\N	\N	\N	\N	\N	\N
2036-02-22	\N	\N	\N	\N	\N	\N	\N	\N
2036-02-23	\N	\N	\N	\N	\N	\N	\N	\N
2036-02-24	\N	\N	\N	\N	\N	\N	\N	\N
2036-02-25	\N	\N	\N	\N	\N	\N	\N	\N
2036-02-26	\N	\N	\N	\N	\N	\N	\N	\N
2036-02-27	\N	\N	\N	\N	\N	\N	\N	\N
2036-02-28	\N	\N	\N	\N	\N	\N	\N	\N
2036-02-29	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-01	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-02	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-03	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-04	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-05	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-06	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-07	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-08	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-09	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-10	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-11	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-12	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-13	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-14	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-15	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-16	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-17	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-18	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-19	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-20	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-21	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-22	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-23	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-24	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-25	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-26	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-27	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-28	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-29	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-30	\N	\N	\N	\N	\N	\N	\N	\N
2036-03-31	\N	\N	\N	\N	\N	\N	\N	\N
2036-04-01	\N	\N	\N	\N	\N	\N	\N	\N
2036-04-02	\N	\N	\N	\N	\N	\N	\N	\N
2036-04-03	\N	\N	\N	\N	\N	\N	\N	\N
2036-04-04	\N	\N	\N	\N	\N	\N	\N	\N
2036-04-05	\N	\N	\N	\N	\N	\N	\N	\N
2036-04-06	\N	\N	\N	\N	\N	\N	\N	\N
2036-04-07	\N	\N	\N	\N	\N	\N	\N	\N
2036-04-08	\N	\N	\N	\N	\N	\N	\N	\N
2036-04-09	\N	\N	\N	\N	\N	\N	\N	\N
2036-04-10	\N	\N	\N	\N	\N	\N	\N	\N
2036-04-11	\N	\N	\N	\N	\N	\N	\N	\N
2036-04-12	\N	\N	\N	\N	\N	\N	\N	\N
2036-04-13	\N	\N	\N	\N	\N	\N	\N	\N
2036-04-14	\N	\N	\N	\N	\N	\N	\N	\N
2036-04-15	\N	\N	\N	\N	\N	\N	\N	\N
2036-04-16	\N	\N	\N	\N	\N	\N	\N	\N
2036-04-17	\N	\N	\N	\N	\N	\N	\N	\N
2036-04-18	\N	\N	\N	\N	\N	\N	\N	\N
2036-04-19	\N	\N	\N	\N	\N	\N	\N	\N
2036-04-20	\N	\N	\N	\N	\N	\N	\N	\N
2036-04-21	\N	\N	\N	\N	\N	\N	\N	\N
2036-04-22	\N	\N	\N	\N	\N	\N	\N	\N
2036-04-23	\N	\N	\N	\N	\N	\N	\N	\N
2036-04-24	\N	\N	\N	\N	\N	\N	\N	\N
2036-04-25	\N	\N	\N	\N	\N	\N	\N	\N
2036-04-26	\N	\N	\N	\N	\N	\N	\N	\N
2036-04-27	\N	\N	\N	\N	\N	\N	\N	\N
2036-04-28	\N	\N	\N	\N	\N	\N	\N	\N
2036-04-29	\N	\N	\N	\N	\N	\N	\N	\N
2036-04-30	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-01	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-02	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-03	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-04	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-05	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-06	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-07	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-08	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-09	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-10	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-11	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-12	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-13	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-14	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-15	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-16	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-17	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-18	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-19	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-20	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-21	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-22	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-23	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-24	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-25	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-26	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-27	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-28	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-29	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-30	\N	\N	\N	\N	\N	\N	\N	\N
2036-05-31	\N	\N	\N	\N	\N	\N	\N	\N
2036-06-01	\N	\N	\N	\N	\N	\N	\N	\N
2036-06-02	\N	\N	\N	\N	\N	\N	\N	\N
2036-06-03	\N	\N	\N	\N	\N	\N	\N	\N
2036-06-04	\N	\N	\N	\N	\N	\N	\N	\N
2036-06-05	\N	\N	\N	\N	\N	\N	\N	\N
2036-06-06	\N	\N	\N	\N	\N	\N	\N	\N
2036-06-07	\N	\N	\N	\N	\N	\N	\N	\N
2036-06-08	\N	\N	\N	\N	\N	\N	\N	\N
2036-06-09	\N	\N	\N	\N	\N	\N	\N	\N
2036-06-10	\N	\N	\N	\N	\N	\N	\N	\N
2036-06-11	\N	\N	\N	\N	\N	\N	\N	\N
2036-06-12	\N	\N	\N	\N	\N	\N	\N	\N
2036-06-13	\N	\N	\N	\N	\N	\N	\N	\N
2036-06-14	\N	\N	\N	\N	\N	\N	\N	\N
2036-06-15	\N	\N	\N	\N	\N	\N	\N	\N
2036-06-16	\N	\N	\N	\N	\N	\N	\N	\N
2036-06-17	\N	\N	\N	\N	\N	\N	\N	\N
2036-06-18	\N	\N	\N	\N	\N	\N	\N	\N
2036-06-19	\N	\N	\N	\N	\N	\N	\N	\N
2036-06-20	\N	\N	\N	\N	\N	\N	\N	\N
2036-06-21	\N	\N	\N	\N	\N	\N	\N	\N
2036-06-22	\N	\N	\N	\N	\N	\N	\N	\N
2036-06-23	\N	\N	\N	\N	\N	\N	\N	\N
2036-06-24	\N	\N	\N	\N	\N	\N	\N	\N
2036-06-25	\N	\N	\N	\N	\N	\N	\N	\N
2036-06-26	\N	\N	\N	\N	\N	\N	\N	\N
2036-06-27	\N	\N	\N	\N	\N	\N	\N	\N
2036-06-28	\N	\N	\N	\N	\N	\N	\N	\N
2036-06-29	\N	\N	\N	\N	\N	\N	\N	\N
2036-06-30	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-01	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-02	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-03	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-04	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-05	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-06	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-07	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-08	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-09	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-10	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-11	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-12	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-13	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-14	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-15	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-16	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-17	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-18	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-19	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-20	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-21	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-22	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-23	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-24	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-25	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-26	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-27	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-28	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-29	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-30	\N	\N	\N	\N	\N	\N	\N	\N
2036-07-31	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-01	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-02	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-03	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-04	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-05	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-06	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-07	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-08	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-09	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-10	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-11	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-12	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-13	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-14	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-15	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-16	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-17	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-18	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-19	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-20	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-21	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-22	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-23	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-24	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-25	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-26	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-27	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-28	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-29	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-30	\N	\N	\N	\N	\N	\N	\N	\N
2036-08-31	\N	\N	\N	\N	\N	\N	\N	\N
2036-09-01	\N	\N	\N	\N	\N	\N	\N	\N
2036-09-02	\N	\N	\N	\N	\N	\N	\N	\N
2036-09-03	\N	\N	\N	\N	\N	\N	\N	\N
2036-09-04	\N	\N	\N	\N	\N	\N	\N	\N
2036-09-05	\N	\N	\N	\N	\N	\N	\N	\N
2036-09-06	\N	\N	\N	\N	\N	\N	\N	\N
2036-09-07	\N	\N	\N	\N	\N	\N	\N	\N
2036-09-08	\N	\N	\N	\N	\N	\N	\N	\N
2036-09-09	\N	\N	\N	\N	\N	\N	\N	\N
2036-09-10	\N	\N	\N	\N	\N	\N	\N	\N
2036-09-11	\N	\N	\N	\N	\N	\N	\N	\N
2036-09-12	\N	\N	\N	\N	\N	\N	\N	\N
2036-09-13	\N	\N	\N	\N	\N	\N	\N	\N
2036-09-14	\N	\N	\N	\N	\N	\N	\N	\N
2036-09-15	\N	\N	\N	\N	\N	\N	\N	\N
2036-09-16	\N	\N	\N	\N	\N	\N	\N	\N
2036-09-17	\N	\N	\N	\N	\N	\N	\N	\N
2036-09-18	\N	\N	\N	\N	\N	\N	\N	\N
2036-09-19	\N	\N	\N	\N	\N	\N	\N	\N
2036-09-20	\N	\N	\N	\N	\N	\N	\N	\N
2036-09-21	\N	\N	\N	\N	\N	\N	\N	\N
2036-09-22	\N	\N	\N	\N	\N	\N	\N	\N
2036-09-23	\N	\N	\N	\N	\N	\N	\N	\N
2036-09-24	\N	\N	\N	\N	\N	\N	\N	\N
2036-09-25	\N	\N	\N	\N	\N	\N	\N	\N
2036-09-26	\N	\N	\N	\N	\N	\N	\N	\N
2036-09-27	\N	\N	\N	\N	\N	\N	\N	\N
2036-09-28	\N	\N	\N	\N	\N	\N	\N	\N
2036-09-29	\N	\N	\N	\N	\N	\N	\N	\N
2036-09-30	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-01	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-02	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-03	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-04	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-05	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-06	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-07	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-08	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-09	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-10	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-11	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-12	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-13	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-14	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-15	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-16	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-17	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-18	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-19	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-20	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-21	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-22	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-23	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-24	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-25	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-26	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-27	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-28	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-29	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-30	\N	\N	\N	\N	\N	\N	\N	\N
2036-10-31	\N	\N	\N	\N	\N	\N	\N	\N
2036-11-01	\N	\N	\N	\N	\N	\N	\N	\N
2036-11-02	\N	\N	\N	\N	\N	\N	\N	\N
2036-11-03	\N	\N	\N	\N	\N	\N	\N	\N
2036-11-04	\N	\N	\N	\N	\N	\N	\N	\N
2036-11-05	\N	\N	\N	\N	\N	\N	\N	\N
2036-11-06	\N	\N	\N	\N	\N	\N	\N	\N
2036-11-07	\N	\N	\N	\N	\N	\N	\N	\N
2036-11-08	\N	\N	\N	\N	\N	\N	\N	\N
2036-11-09	\N	\N	\N	\N	\N	\N	\N	\N
2036-11-10	\N	\N	\N	\N	\N	\N	\N	\N
2036-11-11	\N	\N	\N	\N	\N	\N	\N	\N
2036-11-12	\N	\N	\N	\N	\N	\N	\N	\N
2036-11-13	\N	\N	\N	\N	\N	\N	\N	\N
2036-11-14	\N	\N	\N	\N	\N	\N	\N	\N
2036-11-15	\N	\N	\N	\N	\N	\N	\N	\N
2036-11-16	\N	\N	\N	\N	\N	\N	\N	\N
2036-11-17	\N	\N	\N	\N	\N	\N	\N	\N
2036-11-18	\N	\N	\N	\N	\N	\N	\N	\N
2036-11-19	\N	\N	\N	\N	\N	\N	\N	\N
2036-11-20	\N	\N	\N	\N	\N	\N	\N	\N
2036-11-21	\N	\N	\N	\N	\N	\N	\N	\N
2036-11-22	\N	\N	\N	\N	\N	\N	\N	\N
2036-11-23	\N	\N	\N	\N	\N	\N	\N	\N
2036-11-24	\N	\N	\N	\N	\N	\N	\N	\N
2036-11-25	\N	\N	\N	\N	\N	\N	\N	\N
2036-11-26	\N	\N	\N	\N	\N	\N	\N	\N
2036-11-27	\N	\N	\N	\N	\N	\N	\N	\N
2036-11-28	\N	\N	\N	\N	\N	\N	\N	\N
2036-11-29	\N	\N	\N	\N	\N	\N	\N	\N
2036-11-30	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-01	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-02	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-03	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-04	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-05	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-06	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-07	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-08	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-09	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-10	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-11	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-12	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-13	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-14	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-15	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-16	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-17	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-18	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-19	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-20	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-21	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-22	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-23	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-24	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-25	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-26	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-27	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-28	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-29	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-30	\N	\N	\N	\N	\N	\N	\N	\N
2036-12-31	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-01	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-02	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-03	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-04	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-05	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-06	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-07	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-08	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-09	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-10	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-11	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-12	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-13	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-14	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-15	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-16	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-17	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-18	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-19	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-20	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-21	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-22	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-23	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-24	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-25	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-26	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-27	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-28	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-29	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-30	\N	\N	\N	\N	\N	\N	\N	\N
2037-01-31	\N	\N	\N	\N	\N	\N	\N	\N
2037-02-01	\N	\N	\N	\N	\N	\N	\N	\N
2037-02-02	\N	\N	\N	\N	\N	\N	\N	\N
2037-02-03	\N	\N	\N	\N	\N	\N	\N	\N
2037-02-04	\N	\N	\N	\N	\N	\N	\N	\N
2037-02-05	\N	\N	\N	\N	\N	\N	\N	\N
2037-02-06	\N	\N	\N	\N	\N	\N	\N	\N
2037-02-07	\N	\N	\N	\N	\N	\N	\N	\N
2037-02-08	\N	\N	\N	\N	\N	\N	\N	\N
2037-02-09	\N	\N	\N	\N	\N	\N	\N	\N
2037-02-10	\N	\N	\N	\N	\N	\N	\N	\N
2037-02-11	\N	\N	\N	\N	\N	\N	\N	\N
2037-02-12	\N	\N	\N	\N	\N	\N	\N	\N
2037-02-13	\N	\N	\N	\N	\N	\N	\N	\N
2037-02-14	\N	\N	\N	\N	\N	\N	\N	\N
2037-02-15	\N	\N	\N	\N	\N	\N	\N	\N
2037-02-16	\N	\N	\N	\N	\N	\N	\N	\N
2037-02-17	\N	\N	\N	\N	\N	\N	\N	\N
2037-02-18	\N	\N	\N	\N	\N	\N	\N	\N
2037-02-19	\N	\N	\N	\N	\N	\N	\N	\N
2037-02-20	\N	\N	\N	\N	\N	\N	\N	\N
2037-02-21	\N	\N	\N	\N	\N	\N	\N	\N
2037-02-22	\N	\N	\N	\N	\N	\N	\N	\N
2037-02-23	\N	\N	\N	\N	\N	\N	\N	\N
2037-02-24	\N	\N	\N	\N	\N	\N	\N	\N
2037-02-25	\N	\N	\N	\N	\N	\N	\N	\N
2037-02-26	\N	\N	\N	\N	\N	\N	\N	\N
2037-02-27	\N	\N	\N	\N	\N	\N	\N	\N
2037-02-28	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-01	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-02	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-03	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-04	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-05	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-06	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-07	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-08	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-09	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-10	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-11	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-12	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-13	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-14	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-15	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-16	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-17	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-18	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-19	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-20	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-21	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-22	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-23	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-24	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-25	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-26	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-27	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-28	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-29	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-30	\N	\N	\N	\N	\N	\N	\N	\N
2037-03-31	\N	\N	\N	\N	\N	\N	\N	\N
2037-04-01	\N	\N	\N	\N	\N	\N	\N	\N
2037-04-02	\N	\N	\N	\N	\N	\N	\N	\N
2037-04-03	\N	\N	\N	\N	\N	\N	\N	\N
2037-04-04	\N	\N	\N	\N	\N	\N	\N	\N
2037-04-05	\N	\N	\N	\N	\N	\N	\N	\N
2037-04-06	\N	\N	\N	\N	\N	\N	\N	\N
2037-04-07	\N	\N	\N	\N	\N	\N	\N	\N
2037-04-08	\N	\N	\N	\N	\N	\N	\N	\N
2037-04-09	\N	\N	\N	\N	\N	\N	\N	\N
2037-04-10	\N	\N	\N	\N	\N	\N	\N	\N
2037-04-11	\N	\N	\N	\N	\N	\N	\N	\N
2037-04-12	\N	\N	\N	\N	\N	\N	\N	\N
2037-04-13	\N	\N	\N	\N	\N	\N	\N	\N
2037-04-14	\N	\N	\N	\N	\N	\N	\N	\N
2037-04-15	\N	\N	\N	\N	\N	\N	\N	\N
2037-04-16	\N	\N	\N	\N	\N	\N	\N	\N
2037-04-17	\N	\N	\N	\N	\N	\N	\N	\N
2037-04-18	\N	\N	\N	\N	\N	\N	\N	\N
2037-04-19	\N	\N	\N	\N	\N	\N	\N	\N
2037-04-20	\N	\N	\N	\N	\N	\N	\N	\N
2037-04-21	\N	\N	\N	\N	\N	\N	\N	\N
2037-04-22	\N	\N	\N	\N	\N	\N	\N	\N
2037-04-23	\N	\N	\N	\N	\N	\N	\N	\N
2037-04-24	\N	\N	\N	\N	\N	\N	\N	\N
2037-04-25	\N	\N	\N	\N	\N	\N	\N	\N
2037-04-26	\N	\N	\N	\N	\N	\N	\N	\N
2037-04-27	\N	\N	\N	\N	\N	\N	\N	\N
2037-04-28	\N	\N	\N	\N	\N	\N	\N	\N
2037-04-29	\N	\N	\N	\N	\N	\N	\N	\N
2037-04-30	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-01	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-02	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-03	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-04	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-05	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-06	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-07	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-08	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-09	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-10	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-11	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-12	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-13	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-14	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-15	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-16	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-17	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-18	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-19	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-20	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-21	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-22	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-23	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-24	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-25	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-26	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-27	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-28	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-29	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-30	\N	\N	\N	\N	\N	\N	\N	\N
2037-05-31	\N	\N	\N	\N	\N	\N	\N	\N
2037-06-01	\N	\N	\N	\N	\N	\N	\N	\N
2037-06-02	\N	\N	\N	\N	\N	\N	\N	\N
2037-06-03	\N	\N	\N	\N	\N	\N	\N	\N
2037-06-04	\N	\N	\N	\N	\N	\N	\N	\N
2037-06-05	\N	\N	\N	\N	\N	\N	\N	\N
2037-06-06	\N	\N	\N	\N	\N	\N	\N	\N
2037-06-07	\N	\N	\N	\N	\N	\N	\N	\N
2037-06-08	\N	\N	\N	\N	\N	\N	\N	\N
2037-06-09	\N	\N	\N	\N	\N	\N	\N	\N
2037-06-10	\N	\N	\N	\N	\N	\N	\N	\N
2037-06-11	\N	\N	\N	\N	\N	\N	\N	\N
2037-06-12	\N	\N	\N	\N	\N	\N	\N	\N
2037-06-13	\N	\N	\N	\N	\N	\N	\N	\N
2037-06-14	\N	\N	\N	\N	\N	\N	\N	\N
2037-06-15	\N	\N	\N	\N	\N	\N	\N	\N
2037-06-16	\N	\N	\N	\N	\N	\N	\N	\N
2037-06-17	\N	\N	\N	\N	\N	\N	\N	\N
2037-06-18	\N	\N	\N	\N	\N	\N	\N	\N
2037-06-19	\N	\N	\N	\N	\N	\N	\N	\N
2037-06-20	\N	\N	\N	\N	\N	\N	\N	\N
2037-06-21	\N	\N	\N	\N	\N	\N	\N	\N
2037-06-22	\N	\N	\N	\N	\N	\N	\N	\N
2037-06-23	\N	\N	\N	\N	\N	\N	\N	\N
2037-06-24	\N	\N	\N	\N	\N	\N	\N	\N
2037-06-25	\N	\N	\N	\N	\N	\N	\N	\N
2037-06-26	\N	\N	\N	\N	\N	\N	\N	\N
2037-06-27	\N	\N	\N	\N	\N	\N	\N	\N
2037-06-28	\N	\N	\N	\N	\N	\N	\N	\N
2037-06-29	\N	\N	\N	\N	\N	\N	\N	\N
2037-06-30	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-01	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-02	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-03	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-04	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-05	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-06	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-07	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-08	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-09	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-10	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-11	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-12	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-13	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-14	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-15	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-16	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-17	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-18	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-19	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-20	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-21	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-22	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-23	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-24	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-25	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-26	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-27	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-28	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-29	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-30	\N	\N	\N	\N	\N	\N	\N	\N
2037-07-31	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-01	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-02	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-03	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-04	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-05	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-06	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-07	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-08	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-09	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-10	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-11	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-12	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-13	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-14	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-15	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-16	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-17	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-18	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-19	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-20	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-21	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-22	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-23	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-24	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-25	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-26	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-27	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-28	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-29	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-30	\N	\N	\N	\N	\N	\N	\N	\N
2037-08-31	\N	\N	\N	\N	\N	\N	\N	\N
2037-09-01	\N	\N	\N	\N	\N	\N	\N	\N
2037-09-02	\N	\N	\N	\N	\N	\N	\N	\N
2037-09-03	\N	\N	\N	\N	\N	\N	\N	\N
2037-09-04	\N	\N	\N	\N	\N	\N	\N	\N
2037-09-05	\N	\N	\N	\N	\N	\N	\N	\N
2037-09-06	\N	\N	\N	\N	\N	\N	\N	\N
2037-09-07	\N	\N	\N	\N	\N	\N	\N	\N
2037-09-08	\N	\N	\N	\N	\N	\N	\N	\N
2037-09-09	\N	\N	\N	\N	\N	\N	\N	\N
2037-09-10	\N	\N	\N	\N	\N	\N	\N	\N
2037-09-11	\N	\N	\N	\N	\N	\N	\N	\N
2037-09-12	\N	\N	\N	\N	\N	\N	\N	\N
2037-09-13	\N	\N	\N	\N	\N	\N	\N	\N
2037-09-14	\N	\N	\N	\N	\N	\N	\N	\N
2037-09-15	\N	\N	\N	\N	\N	\N	\N	\N
2037-09-16	\N	\N	\N	\N	\N	\N	\N	\N
2037-09-17	\N	\N	\N	\N	\N	\N	\N	\N
2037-09-18	\N	\N	\N	\N	\N	\N	\N	\N
2037-09-19	\N	\N	\N	\N	\N	\N	\N	\N
2037-09-20	\N	\N	\N	\N	\N	\N	\N	\N
2037-09-21	\N	\N	\N	\N	\N	\N	\N	\N
2037-09-22	\N	\N	\N	\N	\N	\N	\N	\N
2037-09-23	\N	\N	\N	\N	\N	\N	\N	\N
2037-09-24	\N	\N	\N	\N	\N	\N	\N	\N
2037-09-25	\N	\N	\N	\N	\N	\N	\N	\N
2037-09-26	\N	\N	\N	\N	\N	\N	\N	\N
2037-09-27	\N	\N	\N	\N	\N	\N	\N	\N
2037-09-28	\N	\N	\N	\N	\N	\N	\N	\N
2037-09-29	\N	\N	\N	\N	\N	\N	\N	\N
2037-09-30	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-01	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-02	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-03	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-04	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-05	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-06	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-07	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-08	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-09	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-10	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-11	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-12	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-13	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-14	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-15	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-16	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-17	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-18	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-19	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-20	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-21	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-22	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-23	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-24	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-25	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-26	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-27	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-28	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-29	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-30	\N	\N	\N	\N	\N	\N	\N	\N
2037-10-31	\N	\N	\N	\N	\N	\N	\N	\N
2037-11-01	\N	\N	\N	\N	\N	\N	\N	\N
2037-11-02	\N	\N	\N	\N	\N	\N	\N	\N
2037-11-03	\N	\N	\N	\N	\N	\N	\N	\N
2037-11-04	\N	\N	\N	\N	\N	\N	\N	\N
2037-11-05	\N	\N	\N	\N	\N	\N	\N	\N
2037-11-06	\N	\N	\N	\N	\N	\N	\N	\N
2037-11-07	\N	\N	\N	\N	\N	\N	\N	\N
2037-11-08	\N	\N	\N	\N	\N	\N	\N	\N
2037-11-09	\N	\N	\N	\N	\N	\N	\N	\N
2037-11-10	\N	\N	\N	\N	\N	\N	\N	\N
2037-11-11	\N	\N	\N	\N	\N	\N	\N	\N
2037-11-12	\N	\N	\N	\N	\N	\N	\N	\N
2037-11-13	\N	\N	\N	\N	\N	\N	\N	\N
2037-11-14	\N	\N	\N	\N	\N	\N	\N	\N
2037-11-15	\N	\N	\N	\N	\N	\N	\N	\N
2037-11-16	\N	\N	\N	\N	\N	\N	\N	\N
2037-11-17	\N	\N	\N	\N	\N	\N	\N	\N
2037-11-18	\N	\N	\N	\N	\N	\N	\N	\N
2037-11-19	\N	\N	\N	\N	\N	\N	\N	\N
2037-11-20	\N	\N	\N	\N	\N	\N	\N	\N
2037-11-21	\N	\N	\N	\N	\N	\N	\N	\N
2037-11-22	\N	\N	\N	\N	\N	\N	\N	\N
2037-11-23	\N	\N	\N	\N	\N	\N	\N	\N
2037-11-24	\N	\N	\N	\N	\N	\N	\N	\N
2037-11-25	\N	\N	\N	\N	\N	\N	\N	\N
2037-11-26	\N	\N	\N	\N	\N	\N	\N	\N
2037-11-27	\N	\N	\N	\N	\N	\N	\N	\N
2037-11-28	\N	\N	\N	\N	\N	\N	\N	\N
2037-11-29	\N	\N	\N	\N	\N	\N	\N	\N
2037-11-30	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-01	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-02	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-03	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-04	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-05	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-06	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-07	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-08	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-09	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-10	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-11	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-12	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-13	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-14	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-15	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-16	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-17	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-18	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-19	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-20	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-21	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-22	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-23	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-24	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-25	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-26	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-27	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-28	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-29	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-30	\N	\N	\N	\N	\N	\N	\N	\N
2037-12-31	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-01	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-02	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-03	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-04	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-05	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-06	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-07	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-08	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-09	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-10	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-11	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-12	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-13	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-14	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-15	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-16	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-17	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-18	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-19	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-20	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-21	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-22	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-23	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-24	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-25	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-26	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-27	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-28	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-29	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-30	\N	\N	\N	\N	\N	\N	\N	\N
2038-01-31	\N	\N	\N	\N	\N	\N	\N	\N
2038-02-01	\N	\N	\N	\N	\N	\N	\N	\N
2038-02-02	\N	\N	\N	\N	\N	\N	\N	\N
2038-02-03	\N	\N	\N	\N	\N	\N	\N	\N
2038-02-04	\N	\N	\N	\N	\N	\N	\N	\N
2038-02-05	\N	\N	\N	\N	\N	\N	\N	\N
2038-02-06	\N	\N	\N	\N	\N	\N	\N	\N
2038-02-07	\N	\N	\N	\N	\N	\N	\N	\N
2038-02-08	\N	\N	\N	\N	\N	\N	\N	\N
2038-02-09	\N	\N	\N	\N	\N	\N	\N	\N
2038-02-10	\N	\N	\N	\N	\N	\N	\N	\N
2038-02-11	\N	\N	\N	\N	\N	\N	\N	\N
2038-02-12	\N	\N	\N	\N	\N	\N	\N	\N
2038-02-13	\N	\N	\N	\N	\N	\N	\N	\N
2038-02-14	\N	\N	\N	\N	\N	\N	\N	\N
2038-02-15	\N	\N	\N	\N	\N	\N	\N	\N
2038-02-16	\N	\N	\N	\N	\N	\N	\N	\N
2038-02-17	\N	\N	\N	\N	\N	\N	\N	\N
2038-02-18	\N	\N	\N	\N	\N	\N	\N	\N
2038-02-19	\N	\N	\N	\N	\N	\N	\N	\N
2038-02-20	\N	\N	\N	\N	\N	\N	\N	\N
2038-02-21	\N	\N	\N	\N	\N	\N	\N	\N
2038-02-22	\N	\N	\N	\N	\N	\N	\N	\N
2038-02-23	\N	\N	\N	\N	\N	\N	\N	\N
2038-02-24	\N	\N	\N	\N	\N	\N	\N	\N
2038-02-25	\N	\N	\N	\N	\N	\N	\N	\N
2038-02-26	\N	\N	\N	\N	\N	\N	\N	\N
2038-02-27	\N	\N	\N	\N	\N	\N	\N	\N
2038-02-28	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-01	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-02	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-03	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-04	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-05	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-06	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-07	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-08	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-09	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-10	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-11	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-12	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-13	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-14	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-15	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-16	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-17	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-18	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-19	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-20	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-21	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-22	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-23	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-24	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-25	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-26	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-27	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-28	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-29	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-30	\N	\N	\N	\N	\N	\N	\N	\N
2038-03-31	\N	\N	\N	\N	\N	\N	\N	\N
2038-04-01	\N	\N	\N	\N	\N	\N	\N	\N
2038-04-02	\N	\N	\N	\N	\N	\N	\N	\N
2038-04-03	\N	\N	\N	\N	\N	\N	\N	\N
2038-04-04	\N	\N	\N	\N	\N	\N	\N	\N
2038-04-05	\N	\N	\N	\N	\N	\N	\N	\N
2038-04-06	\N	\N	\N	\N	\N	\N	\N	\N
2038-04-07	\N	\N	\N	\N	\N	\N	\N	\N
2038-04-08	\N	\N	\N	\N	\N	\N	\N	\N
2038-04-09	\N	\N	\N	\N	\N	\N	\N	\N
2038-04-10	\N	\N	\N	\N	\N	\N	\N	\N
2038-04-11	\N	\N	\N	\N	\N	\N	\N	\N
2038-04-12	\N	\N	\N	\N	\N	\N	\N	\N
2038-04-13	\N	\N	\N	\N	\N	\N	\N	\N
2038-04-14	\N	\N	\N	\N	\N	\N	\N	\N
2038-04-15	\N	\N	\N	\N	\N	\N	\N	\N
2038-04-16	\N	\N	\N	\N	\N	\N	\N	\N
2038-04-17	\N	\N	\N	\N	\N	\N	\N	\N
2038-04-18	\N	\N	\N	\N	\N	\N	\N	\N
2038-04-19	\N	\N	\N	\N	\N	\N	\N	\N
2038-04-20	\N	\N	\N	\N	\N	\N	\N	\N
2038-04-21	\N	\N	\N	\N	\N	\N	\N	\N
2038-04-22	\N	\N	\N	\N	\N	\N	\N	\N
2038-04-23	\N	\N	\N	\N	\N	\N	\N	\N
2038-04-24	\N	\N	\N	\N	\N	\N	\N	\N
2038-04-25	\N	\N	\N	\N	\N	\N	\N	\N
2038-04-26	\N	\N	\N	\N	\N	\N	\N	\N
2038-04-27	\N	\N	\N	\N	\N	\N	\N	\N
2038-04-28	\N	\N	\N	\N	\N	\N	\N	\N
2038-04-29	\N	\N	\N	\N	\N	\N	\N	\N
2038-04-30	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-01	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-02	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-03	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-04	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-05	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-06	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-07	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-08	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-09	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-10	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-11	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-12	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-13	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-14	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-15	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-16	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-17	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-18	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-19	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-20	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-21	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-22	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-23	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-24	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-25	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-26	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-27	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-28	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-29	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-30	\N	\N	\N	\N	\N	\N	\N	\N
2038-05-31	\N	\N	\N	\N	\N	\N	\N	\N
2038-06-01	\N	\N	\N	\N	\N	\N	\N	\N
2038-06-02	\N	\N	\N	\N	\N	\N	\N	\N
2038-06-03	\N	\N	\N	\N	\N	\N	\N	\N
2038-06-04	\N	\N	\N	\N	\N	\N	\N	\N
2038-06-05	\N	\N	\N	\N	\N	\N	\N	\N
2038-06-06	\N	\N	\N	\N	\N	\N	\N	\N
2038-06-07	\N	\N	\N	\N	\N	\N	\N	\N
2038-06-08	\N	\N	\N	\N	\N	\N	\N	\N
2038-06-09	\N	\N	\N	\N	\N	\N	\N	\N
2038-06-10	\N	\N	\N	\N	\N	\N	\N	\N
2038-06-11	\N	\N	\N	\N	\N	\N	\N	\N
2038-06-12	\N	\N	\N	\N	\N	\N	\N	\N
2038-06-13	\N	\N	\N	\N	\N	\N	\N	\N
2038-06-14	\N	\N	\N	\N	\N	\N	\N	\N
2038-06-15	\N	\N	\N	\N	\N	\N	\N	\N
2038-06-16	\N	\N	\N	\N	\N	\N	\N	\N
2038-06-17	\N	\N	\N	\N	\N	\N	\N	\N
2038-06-18	\N	\N	\N	\N	\N	\N	\N	\N
2038-06-19	\N	\N	\N	\N	\N	\N	\N	\N
2038-06-20	\N	\N	\N	\N	\N	\N	\N	\N
2038-06-21	\N	\N	\N	\N	\N	\N	\N	\N
2038-06-22	\N	\N	\N	\N	\N	\N	\N	\N
2038-06-23	\N	\N	\N	\N	\N	\N	\N	\N
2038-06-24	\N	\N	\N	\N	\N	\N	\N	\N
2038-06-25	\N	\N	\N	\N	\N	\N	\N	\N
2038-06-26	\N	\N	\N	\N	\N	\N	\N	\N
2038-06-27	\N	\N	\N	\N	\N	\N	\N	\N
2038-06-28	\N	\N	\N	\N	\N	\N	\N	\N
2038-06-29	\N	\N	\N	\N	\N	\N	\N	\N
2038-06-30	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-01	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-02	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-03	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-04	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-05	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-06	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-07	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-08	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-09	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-10	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-11	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-12	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-13	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-14	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-15	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-16	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-17	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-18	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-19	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-20	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-21	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-22	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-23	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-24	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-25	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-26	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-27	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-28	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-29	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-30	\N	\N	\N	\N	\N	\N	\N	\N
2038-07-31	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-01	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-02	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-03	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-04	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-05	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-06	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-07	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-08	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-09	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-10	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-11	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-12	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-13	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-14	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-15	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-16	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-17	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-18	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-19	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-20	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-21	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-22	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-23	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-24	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-25	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-26	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-27	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-28	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-29	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-30	\N	\N	\N	\N	\N	\N	\N	\N
2038-08-31	\N	\N	\N	\N	\N	\N	\N	\N
2038-09-01	\N	\N	\N	\N	\N	\N	\N	\N
2038-09-02	\N	\N	\N	\N	\N	\N	\N	\N
2038-09-03	\N	\N	\N	\N	\N	\N	\N	\N
2038-09-04	\N	\N	\N	\N	\N	\N	\N	\N
2038-09-05	\N	\N	\N	\N	\N	\N	\N	\N
2038-09-06	\N	\N	\N	\N	\N	\N	\N	\N
2038-09-07	\N	\N	\N	\N	\N	\N	\N	\N
2038-09-08	\N	\N	\N	\N	\N	\N	\N	\N
2038-09-09	\N	\N	\N	\N	\N	\N	\N	\N
2038-09-10	\N	\N	\N	\N	\N	\N	\N	\N
2038-09-11	\N	\N	\N	\N	\N	\N	\N	\N
2038-09-12	\N	\N	\N	\N	\N	\N	\N	\N
2038-09-13	\N	\N	\N	\N	\N	\N	\N	\N
2038-09-14	\N	\N	\N	\N	\N	\N	\N	\N
2038-09-15	\N	\N	\N	\N	\N	\N	\N	\N
2038-09-16	\N	\N	\N	\N	\N	\N	\N	\N
2038-09-17	\N	\N	\N	\N	\N	\N	\N	\N
2038-09-18	\N	\N	\N	\N	\N	\N	\N	\N
2038-09-19	\N	\N	\N	\N	\N	\N	\N	\N
2038-09-20	\N	\N	\N	\N	\N	\N	\N	\N
2038-09-21	\N	\N	\N	\N	\N	\N	\N	\N
2038-09-22	\N	\N	\N	\N	\N	\N	\N	\N
2038-09-23	\N	\N	\N	\N	\N	\N	\N	\N
2038-09-24	\N	\N	\N	\N	\N	\N	\N	\N
2038-09-25	\N	\N	\N	\N	\N	\N	\N	\N
2038-09-26	\N	\N	\N	\N	\N	\N	\N	\N
2038-09-27	\N	\N	\N	\N	\N	\N	\N	\N
2038-09-28	\N	\N	\N	\N	\N	\N	\N	\N
2038-09-29	\N	\N	\N	\N	\N	\N	\N	\N
2038-09-30	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-01	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-02	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-03	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-04	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-05	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-06	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-07	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-08	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-09	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-10	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-11	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-12	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-13	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-14	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-15	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-16	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-17	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-18	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-19	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-20	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-21	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-22	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-23	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-24	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-25	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-26	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-27	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-28	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-29	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-30	\N	\N	\N	\N	\N	\N	\N	\N
2038-10-31	\N	\N	\N	\N	\N	\N	\N	\N
2038-11-01	\N	\N	\N	\N	\N	\N	\N	\N
2038-11-02	\N	\N	\N	\N	\N	\N	\N	\N
2038-11-03	\N	\N	\N	\N	\N	\N	\N	\N
2038-11-04	\N	\N	\N	\N	\N	\N	\N	\N
2038-11-05	\N	\N	\N	\N	\N	\N	\N	\N
2038-11-06	\N	\N	\N	\N	\N	\N	\N	\N
2038-11-07	\N	\N	\N	\N	\N	\N	\N	\N
2038-11-08	\N	\N	\N	\N	\N	\N	\N	\N
2038-11-09	\N	\N	\N	\N	\N	\N	\N	\N
2038-11-10	\N	\N	\N	\N	\N	\N	\N	\N
2038-11-11	\N	\N	\N	\N	\N	\N	\N	\N
2038-11-12	\N	\N	\N	\N	\N	\N	\N	\N
2038-11-13	\N	\N	\N	\N	\N	\N	\N	\N
2038-11-14	\N	\N	\N	\N	\N	\N	\N	\N
2038-11-15	\N	\N	\N	\N	\N	\N	\N	\N
2038-11-16	\N	\N	\N	\N	\N	\N	\N	\N
2038-11-17	\N	\N	\N	\N	\N	\N	\N	\N
2038-11-18	\N	\N	\N	\N	\N	\N	\N	\N
2038-11-19	\N	\N	\N	\N	\N	\N	\N	\N
2038-11-20	\N	\N	\N	\N	\N	\N	\N	\N
2038-11-21	\N	\N	\N	\N	\N	\N	\N	\N
2038-11-22	\N	\N	\N	\N	\N	\N	\N	\N
2038-11-23	\N	\N	\N	\N	\N	\N	\N	\N
2038-11-24	\N	\N	\N	\N	\N	\N	\N	\N
2038-11-25	\N	\N	\N	\N	\N	\N	\N	\N
2038-11-26	\N	\N	\N	\N	\N	\N	\N	\N
2038-11-27	\N	\N	\N	\N	\N	\N	\N	\N
2038-11-28	\N	\N	\N	\N	\N	\N	\N	\N
2038-11-29	\N	\N	\N	\N	\N	\N	\N	\N
2038-11-30	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-01	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-02	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-03	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-04	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-05	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-06	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-07	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-08	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-09	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-10	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-11	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-12	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-13	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-14	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-15	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-16	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-17	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-18	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-19	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-20	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-21	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-22	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-23	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-24	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-25	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-26	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-27	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-28	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-29	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-30	\N	\N	\N	\N	\N	\N	\N	\N
2038-12-31	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-01	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-02	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-03	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-04	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-05	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-06	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-07	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-08	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-09	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-10	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-11	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-12	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-13	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-14	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-15	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-16	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-17	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-18	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-19	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-20	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-21	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-22	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-23	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-24	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-25	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-26	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-27	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-28	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-29	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-30	\N	\N	\N	\N	\N	\N	\N	\N
2039-01-31	\N	\N	\N	\N	\N	\N	\N	\N
2039-02-01	\N	\N	\N	\N	\N	\N	\N	\N
2039-02-02	\N	\N	\N	\N	\N	\N	\N	\N
2039-02-03	\N	\N	\N	\N	\N	\N	\N	\N
2039-02-04	\N	\N	\N	\N	\N	\N	\N	\N
2039-02-05	\N	\N	\N	\N	\N	\N	\N	\N
2039-02-06	\N	\N	\N	\N	\N	\N	\N	\N
2039-02-07	\N	\N	\N	\N	\N	\N	\N	\N
2039-02-08	\N	\N	\N	\N	\N	\N	\N	\N
2039-02-09	\N	\N	\N	\N	\N	\N	\N	\N
2039-02-10	\N	\N	\N	\N	\N	\N	\N	\N
2039-02-11	\N	\N	\N	\N	\N	\N	\N	\N
2039-02-12	\N	\N	\N	\N	\N	\N	\N	\N
2039-02-13	\N	\N	\N	\N	\N	\N	\N	\N
2039-02-14	\N	\N	\N	\N	\N	\N	\N	\N
2039-02-15	\N	\N	\N	\N	\N	\N	\N	\N
2039-02-16	\N	\N	\N	\N	\N	\N	\N	\N
2039-02-17	\N	\N	\N	\N	\N	\N	\N	\N
2039-02-18	\N	\N	\N	\N	\N	\N	\N	\N
2039-02-19	\N	\N	\N	\N	\N	\N	\N	\N
2039-02-20	\N	\N	\N	\N	\N	\N	\N	\N
2039-02-21	\N	\N	\N	\N	\N	\N	\N	\N
2039-02-22	\N	\N	\N	\N	\N	\N	\N	\N
2039-02-23	\N	\N	\N	\N	\N	\N	\N	\N
2039-02-24	\N	\N	\N	\N	\N	\N	\N	\N
2039-02-25	\N	\N	\N	\N	\N	\N	\N	\N
2039-02-26	\N	\N	\N	\N	\N	\N	\N	\N
2039-02-27	\N	\N	\N	\N	\N	\N	\N	\N
2039-02-28	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-01	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-02	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-03	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-04	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-05	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-06	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-07	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-08	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-09	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-10	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-11	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-12	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-13	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-14	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-15	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-16	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-17	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-18	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-19	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-20	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-21	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-22	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-23	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-24	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-25	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-26	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-27	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-28	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-29	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-30	\N	\N	\N	\N	\N	\N	\N	\N
2039-03-31	\N	\N	\N	\N	\N	\N	\N	\N
2039-04-01	\N	\N	\N	\N	\N	\N	\N	\N
2039-04-02	\N	\N	\N	\N	\N	\N	\N	\N
2039-04-03	\N	\N	\N	\N	\N	\N	\N	\N
2039-04-04	\N	\N	\N	\N	\N	\N	\N	\N
2039-04-05	\N	\N	\N	\N	\N	\N	\N	\N
2039-04-06	\N	\N	\N	\N	\N	\N	\N	\N
2039-04-07	\N	\N	\N	\N	\N	\N	\N	\N
2039-04-08	\N	\N	\N	\N	\N	\N	\N	\N
2039-04-09	\N	\N	\N	\N	\N	\N	\N	\N
2039-04-10	\N	\N	\N	\N	\N	\N	\N	\N
2039-04-11	\N	\N	\N	\N	\N	\N	\N	\N
2039-04-12	\N	\N	\N	\N	\N	\N	\N	\N
2039-04-13	\N	\N	\N	\N	\N	\N	\N	\N
2039-04-14	\N	\N	\N	\N	\N	\N	\N	\N
2039-04-15	\N	\N	\N	\N	\N	\N	\N	\N
2039-04-16	\N	\N	\N	\N	\N	\N	\N	\N
2039-04-17	\N	\N	\N	\N	\N	\N	\N	\N
2039-04-18	\N	\N	\N	\N	\N	\N	\N	\N
2039-04-19	\N	\N	\N	\N	\N	\N	\N	\N
2039-04-20	\N	\N	\N	\N	\N	\N	\N	\N
2039-04-21	\N	\N	\N	\N	\N	\N	\N	\N
2039-04-22	\N	\N	\N	\N	\N	\N	\N	\N
2039-04-23	\N	\N	\N	\N	\N	\N	\N	\N
2039-04-24	\N	\N	\N	\N	\N	\N	\N	\N
2039-04-25	\N	\N	\N	\N	\N	\N	\N	\N
2039-04-26	\N	\N	\N	\N	\N	\N	\N	\N
2039-04-27	\N	\N	\N	\N	\N	\N	\N	\N
2039-04-28	\N	\N	\N	\N	\N	\N	\N	\N
2039-04-29	\N	\N	\N	\N	\N	\N	\N	\N
2039-04-30	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-01	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-02	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-03	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-04	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-05	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-06	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-07	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-08	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-09	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-10	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-11	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-12	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-13	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-14	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-15	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-16	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-17	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-18	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-19	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-20	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-21	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-22	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-23	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-24	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-25	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-26	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-27	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-28	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-29	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-30	\N	\N	\N	\N	\N	\N	\N	\N
2039-05-31	\N	\N	\N	\N	\N	\N	\N	\N
2039-06-01	\N	\N	\N	\N	\N	\N	\N	\N
2039-06-02	\N	\N	\N	\N	\N	\N	\N	\N
2039-06-03	\N	\N	\N	\N	\N	\N	\N	\N
2039-06-04	\N	\N	\N	\N	\N	\N	\N	\N
2039-06-05	\N	\N	\N	\N	\N	\N	\N	\N
2039-06-06	\N	\N	\N	\N	\N	\N	\N	\N
2039-06-07	\N	\N	\N	\N	\N	\N	\N	\N
2039-06-08	\N	\N	\N	\N	\N	\N	\N	\N
2039-06-09	\N	\N	\N	\N	\N	\N	\N	\N
2039-06-10	\N	\N	\N	\N	\N	\N	\N	\N
2039-06-11	\N	\N	\N	\N	\N	\N	\N	\N
2039-06-12	\N	\N	\N	\N	\N	\N	\N	\N
2039-06-13	\N	\N	\N	\N	\N	\N	\N	\N
2039-06-14	\N	\N	\N	\N	\N	\N	\N	\N
2039-06-15	\N	\N	\N	\N	\N	\N	\N	\N
2039-06-16	\N	\N	\N	\N	\N	\N	\N	\N
2039-06-17	\N	\N	\N	\N	\N	\N	\N	\N
2039-06-18	\N	\N	\N	\N	\N	\N	\N	\N
2039-06-19	\N	\N	\N	\N	\N	\N	\N	\N
2039-06-20	\N	\N	\N	\N	\N	\N	\N	\N
2039-06-21	\N	\N	\N	\N	\N	\N	\N	\N
2039-06-22	\N	\N	\N	\N	\N	\N	\N	\N
2039-06-23	\N	\N	\N	\N	\N	\N	\N	\N
2039-06-24	\N	\N	\N	\N	\N	\N	\N	\N
2039-06-25	\N	\N	\N	\N	\N	\N	\N	\N
2039-06-26	\N	\N	\N	\N	\N	\N	\N	\N
2039-06-27	\N	\N	\N	\N	\N	\N	\N	\N
2039-06-28	\N	\N	\N	\N	\N	\N	\N	\N
2039-06-29	\N	\N	\N	\N	\N	\N	\N	\N
2039-06-30	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-01	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-02	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-03	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-04	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-05	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-06	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-07	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-08	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-09	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-10	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-11	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-12	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-13	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-14	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-15	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-16	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-17	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-18	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-19	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-20	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-21	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-22	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-23	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-24	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-25	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-26	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-27	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-28	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-29	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-30	\N	\N	\N	\N	\N	\N	\N	\N
2039-07-31	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-01	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-02	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-03	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-04	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-05	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-06	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-07	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-08	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-09	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-10	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-11	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-12	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-13	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-14	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-15	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-16	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-17	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-18	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-19	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-20	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-21	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-22	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-23	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-24	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-25	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-26	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-27	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-28	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-29	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-30	\N	\N	\N	\N	\N	\N	\N	\N
2039-08-31	\N	\N	\N	\N	\N	\N	\N	\N
2039-09-01	\N	\N	\N	\N	\N	\N	\N	\N
2039-09-02	\N	\N	\N	\N	\N	\N	\N	\N
2039-09-03	\N	\N	\N	\N	\N	\N	\N	\N
2039-09-04	\N	\N	\N	\N	\N	\N	\N	\N
2039-09-05	\N	\N	\N	\N	\N	\N	\N	\N
2039-09-06	\N	\N	\N	\N	\N	\N	\N	\N
2039-09-07	\N	\N	\N	\N	\N	\N	\N	\N
2039-09-08	\N	\N	\N	\N	\N	\N	\N	\N
2039-09-09	\N	\N	\N	\N	\N	\N	\N	\N
2039-09-10	\N	\N	\N	\N	\N	\N	\N	\N
2039-09-11	\N	\N	\N	\N	\N	\N	\N	\N
2039-09-12	\N	\N	\N	\N	\N	\N	\N	\N
2039-09-13	\N	\N	\N	\N	\N	\N	\N	\N
2039-09-14	\N	\N	\N	\N	\N	\N	\N	\N
2039-09-15	\N	\N	\N	\N	\N	\N	\N	\N
2039-09-16	\N	\N	\N	\N	\N	\N	\N	\N
2039-09-17	\N	\N	\N	\N	\N	\N	\N	\N
2039-09-18	\N	\N	\N	\N	\N	\N	\N	\N
2039-09-19	\N	\N	\N	\N	\N	\N	\N	\N
2039-09-20	\N	\N	\N	\N	\N	\N	\N	\N
2039-09-21	\N	\N	\N	\N	\N	\N	\N	\N
2039-09-22	\N	\N	\N	\N	\N	\N	\N	\N
2039-09-23	\N	\N	\N	\N	\N	\N	\N	\N
2039-09-24	\N	\N	\N	\N	\N	\N	\N	\N
2039-09-25	\N	\N	\N	\N	\N	\N	\N	\N
2039-09-26	\N	\N	\N	\N	\N	\N	\N	\N
2039-09-27	\N	\N	\N	\N	\N	\N	\N	\N
2039-09-28	\N	\N	\N	\N	\N	\N	\N	\N
2039-09-29	\N	\N	\N	\N	\N	\N	\N	\N
2039-09-30	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-01	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-02	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-03	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-04	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-05	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-06	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-07	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-08	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-09	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-10	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-11	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-12	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-13	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-14	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-15	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-16	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-17	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-18	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-19	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-20	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-21	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-22	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-23	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-24	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-25	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-26	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-27	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-28	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-29	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-30	\N	\N	\N	\N	\N	\N	\N	\N
2039-10-31	\N	\N	\N	\N	\N	\N	\N	\N
2039-11-01	\N	\N	\N	\N	\N	\N	\N	\N
2039-11-02	\N	\N	\N	\N	\N	\N	\N	\N
2039-11-03	\N	\N	\N	\N	\N	\N	\N	\N
2039-11-04	\N	\N	\N	\N	\N	\N	\N	\N
2039-11-05	\N	\N	\N	\N	\N	\N	\N	\N
2039-11-06	\N	\N	\N	\N	\N	\N	\N	\N
2039-11-07	\N	\N	\N	\N	\N	\N	\N	\N
2039-11-08	\N	\N	\N	\N	\N	\N	\N	\N
2039-11-09	\N	\N	\N	\N	\N	\N	\N	\N
2039-11-10	\N	\N	\N	\N	\N	\N	\N	\N
2039-11-11	\N	\N	\N	\N	\N	\N	\N	\N
2039-11-12	\N	\N	\N	\N	\N	\N	\N	\N
2039-11-13	\N	\N	\N	\N	\N	\N	\N	\N
2039-11-14	\N	\N	\N	\N	\N	\N	\N	\N
2039-11-15	\N	\N	\N	\N	\N	\N	\N	\N
2039-11-16	\N	\N	\N	\N	\N	\N	\N	\N
2039-11-17	\N	\N	\N	\N	\N	\N	\N	\N
2039-11-18	\N	\N	\N	\N	\N	\N	\N	\N
2039-11-19	\N	\N	\N	\N	\N	\N	\N	\N
2039-11-20	\N	\N	\N	\N	\N	\N	\N	\N
2039-11-21	\N	\N	\N	\N	\N	\N	\N	\N
2039-11-22	\N	\N	\N	\N	\N	\N	\N	\N
2039-11-23	\N	\N	\N	\N	\N	\N	\N	\N
2039-11-24	\N	\N	\N	\N	\N	\N	\N	\N
2039-11-25	\N	\N	\N	\N	\N	\N	\N	\N
2039-11-26	\N	\N	\N	\N	\N	\N	\N	\N
2039-11-27	\N	\N	\N	\N	\N	\N	\N	\N
2039-11-28	\N	\N	\N	\N	\N	\N	\N	\N
2039-11-29	\N	\N	\N	\N	\N	\N	\N	\N
2039-11-30	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-01	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-02	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-03	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-04	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-05	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-06	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-07	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-08	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-09	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-10	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-11	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-12	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-13	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-14	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-15	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-16	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-17	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-18	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-19	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-20	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-21	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-22	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-23	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-24	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-25	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-26	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-27	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-28	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-29	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-30	\N	\N	\N	\N	\N	\N	\N	\N
2039-12-31	\N	\N	\N	\N	\N	\N	\N	\N
2019-01-01	t	Neujahr	\N	\N	\N	\N	t	Weihnachtsferien
2019-01-02	\N	\N	\N	\N	\N	\N	t	Weihnachtsferien
2019-01-03	\N	\N	\N	\N	\N	\N	t	Weihnachtsferien
2019-01-04	\N	\N	\N	\N	\N	\N	t	Weihnachtsferien
2019-01-05	\N	\N	\N	\N	\N	\N	\N	\N
2019-01-06	\N	\N	\N	\N	t	Heilige drei Könige	\N	\N
2019-01-07	\N	\N	\N	\N	\N	\N	\N	\N
2019-01-08	\N	\N	\N	\N	\N	\N	\N	\N
2019-01-09	\N	\N	\N	\N	\N	\N	\N	\N
2019-01-10	\N	\N	\N	\N	\N	\N	\N	\N
2019-01-11	\N	\N	\N	\N	\N	\N	\N	\N
2019-01-12	\N	\N	\N	\N	\N	\N	\N	\N
2019-01-13	\N	\N	\N	\N	\N	\N	\N	\N
2019-01-14	\N	\N	\N	\N	\N	\N	\N	\N
2019-01-15	\N	\N	\N	\N	\N	\N	\N	\N
2019-01-16	\N	\N	\N	\N	\N	\N	\N	\N
2019-01-17	\N	\N	\N	\N	\N	\N	\N	\N
2019-01-18	\N	\N	\N	\N	\N	\N	\N	\N
2019-01-19	\N	\N	\N	\N	\N	\N	\N	\N
2019-01-20	\N	\N	\N	\N	\N	\N	\N	\N
2019-01-21	\N	\N	\N	\N	\N	\N	\N	\N
2019-01-22	\N	\N	\N	\N	\N	\N	\N	\N
2019-01-23	\N	\N	\N	\N	\N	\N	\N	\N
2019-01-24	\N	\N	\N	\N	\N	\N	\N	\N
2019-01-25	\N	\N	\N	\N	\N	\N	\N	\N
2019-01-26	\N	\N	\N	\N	\N	\N	\N	\N
2019-01-27	\N	\N	\N	\N	\N	\N	\N	\N
2019-01-28	\N	\N	\N	\N	\N	\N	\N	\N
2019-01-29	\N	\N	\N	\N	\N	\N	\N	\N
2019-01-30	\N	\N	\N	\N	\N	\N	\N	\N
2019-01-31	\N	\N	\N	\N	\N	\N	\N	\N
2019-02-01	\N	\N	\N	\N	\N	\N	\N	\N
2019-02-02	\N	\N	\N	\N	\N	\N	\N	\N
2019-02-03	\N	\N	\N	\N	\N	\N	\N	\N
2019-02-04	\N	\N	\N	\N	\N	\N	\N	\N
2019-02-05	\N	\N	\N	\N	\N	\N	\N	\N
2019-02-06	\N	\N	\N	\N	\N	\N	\N	\N
2019-02-07	\N	\N	\N	\N	\N	\N	\N	\N
2019-02-08	\N	\N	\N	\N	\N	\N	\N	\N
2019-02-09	\N	\N	\N	\N	\N	\N	\N	\N
2019-02-10	\N	\N	\N	\N	\N	\N	\N	\N
2019-02-11	\N	\N	\N	\N	\N	\N	\N	\N
2019-02-12	\N	\N	\N	\N	\N	\N	\N	\N
2019-02-13	\N	\N	\N	\N	\N	\N	\N	\N
2019-02-14	\N	\N	\N	\N	\N	\N	\N	\N
2019-02-15	\N	\N	\N	\N	\N	\N	\N	\N
2019-02-16	\N	\N	\N	\N	\N	\N	\N	\N
2019-02-17	\N	\N	\N	\N	\N	\N	\N	\N
2019-02-18	\N	\N	\N	\N	\N	\N	t	Winterferien
2019-02-19	\N	\N	\N	\N	\N	\N	t	Winterferien
2019-02-20	\N	\N	\N	\N	\N	\N	t	Winterferien
2019-02-21	\N	\N	\N	\N	\N	\N	t	Winterferien
2019-02-22	\N	\N	\N	\N	\N	\N	t	Winterferien
2019-02-23	\N	\N	\N	\N	\N	\N	t	Winterferien
2019-02-24	\N	\N	\N	\N	\N	\N	t	Winterferien
2019-02-25	\N	\N	\N	\N	\N	\N	t	Winterferien
2019-02-26	\N	\N	\N	\N	\N	\N	t	Winterferien
2019-02-27	\N	\N	\N	\N	\N	\N	t	Winterferien
2019-02-28	\N	\N	\N	\N	\N	\N	t	Winterferien
2019-03-01	\N	\N	\N	\N	\N	\N	t	Winterferien
2019-03-02	\N	\N	\N	\N	\N	\N	t	Winterferien
2019-03-03	\N	\N	\N	\N	\N	\N	\N	\N
2019-03-04	\N	\N	\N	\N	\N	\N	\N	\N
2019-03-05	\N	\N	\N	\N	\N	\N	\N	\N
2019-03-06	\N	\N	\N	\N	\N	\N	\N	\N
2019-03-07	\N	\N	\N	\N	\N	\N	\N	\N
2019-03-08	\N	\N	\N	\N	\N	\N	\N	\N
2019-03-09	\N	\N	\N	\N	\N	\N	\N	\N
2019-03-10	\N	\N	\N	\N	\N	\N	\N	\N
2019-03-11	\N	\N	\N	\N	\N	\N	\N	\N
2019-03-12	\N	\N	\N	\N	\N	\N	\N	\N
2019-03-13	\N	\N	\N	\N	\N	\N	\N	\N
2019-03-14	\N	\N	\N	\N	\N	\N	\N	\N
2019-03-15	\N	\N	\N	\N	\N	\N	\N	\N
2019-03-16	\N	\N	\N	\N	\N	\N	\N	\N
2019-03-17	\N	\N	\N	\N	\N	\N	\N	\N
2019-03-18	\N	\N	\N	\N	\N	\N	\N	\N
2019-03-19	\N	\N	\N	\N	\N	\N	\N	\N
2019-03-20	\N	\N	\N	\N	\N	\N	\N	\N
2019-03-21	\N	\N	\N	\N	\N	\N	\N	\N
2019-03-22	\N	\N	\N	\N	\N	\N	\N	\N
2019-03-23	\N	\N	\N	\N	\N	\N	\N	\N
2019-03-24	\N	\N	\N	\N	\N	\N	\N	\N
2019-03-25	\N	\N	\N	\N	\N	\N	\N	\N
2019-03-26	\N	\N	\N	\N	\N	\N	\N	\N
2019-03-27	\N	\N	\N	\N	\N	\N	\N	\N
2019-03-28	\N	\N	\N	\N	\N	\N	\N	\N
2019-03-29	\N	\N	\N	\N	\N	\N	\N	\N
2019-03-30	\N	\N	\N	\N	\N	\N	\N	\N
2019-03-31	\N	\N	\N	\N	\N	\N	\N	\N
2019-04-01	\N	\N	\N	\N	\N	\N	\N	\N
2019-04-02	\N	\N	\N	\N	\N	\N	\N	\N
2019-04-03	\N	\N	\N	\N	\N	\N	\N	\N
2019-04-04	\N	\N	\N	\N	\N	\N	\N	\N
2019-04-05	\N	\N	\N	\N	\N	\N	\N	\N
2019-04-06	\N	\N	\N	\N	\N	\N	\N	\N
2019-04-07	\N	\N	\N	\N	\N	\N	\N	\N
2019-04-08	\N	\N	\N	\N	\N	\N	\N	\N
2019-04-09	\N	\N	\N	\N	\N	\N	\N	\N
2019-04-10	\N	\N	\N	\N	\N	\N	\N	\N
2019-04-11	\N	\N	\N	\N	\N	\N	\N	\N
2019-04-12	\N	\N	\N	\N	\N	\N	\N	\N
2019-04-13	\N	\N	\N	\N	\N	\N	\N	\N
2019-04-14	\N	\N	\N	\N	\N	\N	\N	\N
2019-04-15	\N	\N	\N	\N	\N	\N	\N	\N
2019-04-16	\N	\N	\N	\N	\N	\N	\N	\N
2019-04-17	\N	\N	\N	\N	\N	\N	\N	\N
2019-04-18	\N	\N	\N	\N	\N	\N	\N	\N
2019-04-19	t	Karfreitag	\N	\N	\N	\N	t	Osterferien
2019-04-20	\N	\N	\N	\N	\N	\N	t	Osterferien
2019-04-21	t	Ostersonntag	\N	\N	\N	\N	t	Osterferien
2019-04-22	t	Ostermontag	\N	\N	\N	\N	t	Osterferien
2019-04-23	\N	\N	\N	\N	\N	\N	t	Osterferien
2019-04-24	\N	\N	\N	\N	\N	\N	t	Osterferien
2019-04-25	\N	\N	\N	\N	\N	\N	t	Osterferien
2019-04-26	\N	\N	\N	\N	\N	\N	t	Osterferien
2019-04-27	\N	\N	\N	\N	\N	\N	\N	\N
2019-04-28	\N	\N	\N	\N	\N	\N	\N	\N
2019-04-29	\N	\N	\N	\N	\N	\N	\N	\N
2019-04-30	\N	\N	\N	\N	\N	\N	\N	\N
2019-05-01	t	Tag der Arbeit	\N	\N	\N	\N	\N	\N
2019-05-02	\N	\N	\N	\N	\N	\N	\N	\N
2019-05-03	\N	\N	\N	\N	\N	\N	\N	\N
2019-05-04	\N	\N	\N	\N	\N	\N	\N	\N
2019-05-05	\N	\N	\N	\N	\N	\N	\N	\N
2019-05-06	\N	\N	\N	\N	\N	\N	\N	\N
2019-05-07	\N	\N	\N	\N	\N	\N	\N	\N
2019-05-08	\N	\N	\N	\N	\N	\N	\N	\N
2019-05-09	\N	\N	\N	\N	\N	\N	\N	\N
2019-05-10	\N	\N	\N	\N	\N	\N	\N	\N
2019-05-11	\N	\N	\N	\N	\N	\N	\N	\N
2019-05-12	\N	\N	\N	\N	\N	\N	\N	\N
2019-05-13	\N	\N	\N	\N	\N	\N	\N	\N
2019-05-14	\N	\N	\N	\N	\N	\N	\N	\N
2019-05-15	\N	\N	\N	\N	\N	\N	\N	\N
2019-05-16	\N	\N	\N	\N	\N	\N	\N	\N
2019-05-17	\N	\N	\N	\N	\N	\N	\N	\N
2019-05-18	\N	\N	\N	\N	\N	\N	\N	\N
2019-05-19	\N	\N	\N	\N	\N	\N	\N	\N
2019-05-20	\N	\N	\N	\N	\N	\N	\N	\N
2019-05-21	\N	\N	\N	\N	\N	\N	\N	\N
2019-05-22	\N	\N	\N	\N	\N	\N	\N	\N
2019-05-23	\N	\N	\N	\N	\N	\N	\N	\N
2019-05-24	\N	\N	\N	\N	\N	\N	\N	\N
2019-05-25	\N	\N	\N	\N	\N	\N	\N	\N
2019-05-26	\N	\N	\N	\N	\N	\N	\N	\N
2019-05-27	\N	\N	\N	\N	\N	\N	\N	\N
2019-05-28	\N	\N	\N	\N	\N	\N	\N	\N
2019-05-29	\N	\N	\N	\N	\N	\N	\N	\N
2019-05-30	t	Christi Himmelfahrt	\N	\N	\N	\N	\N	\N
2019-05-31	\N	\N	\N	\N	\N	\N	t	Pfingstferien
2019-06-01	\N	\N	\N	\N	\N	\N	\N	\N
2019-06-02	\N	\N	\N	\N	\N	\N	\N	\N
2019-06-03	\N	\N	\N	\N	\N	\N	\N	\N
2019-06-04	\N	\N	\N	\N	\N	\N	\N	\N
2019-06-05	\N	\N	\N	\N	\N	\N	\N	\N
2019-06-06	\N	\N	\N	\N	\N	\N	\N	\N
2019-06-07	\N	\N	\N	\N	\N	\N	\N	\N
2019-06-08	\N	\N	\N	\N	\N	\N	\N	\N
2019-06-09	t	Pfingstsonntag	\N	\N	\N	\N	\N	\N
2019-06-10	t	Pfingstmontag	\N	\N	\N	\N	\N	\N
2019-06-11	\N	\N	\N	\N	\N	\N	\N	\N
2019-06-12	\N	\N	\N	\N	\N	\N	\N	\N
2019-06-13	\N	\N	\N	\N	\N	\N	\N	\N
2019-06-14	\N	\N	\N	\N	\N	\N	\N	\N
2019-06-15	\N	\N	\N	\N	\N	\N	\N	\N
2019-06-16	\N	\N	\N	\N	\N	\N	\N	\N
2019-06-17	\N	\N	\N	\N	\N	\N	\N	\N
2019-06-18	\N	\N	\N	\N	\N	\N	\N	\N
2019-06-19	\N	\N	\N	\N	\N	\N	\N	\N
2019-06-20	\N	\N	\N	\N	t	Fronleichnam	\N	\N
2019-06-21	\N	\N	\N	\N	\N	\N	\N	\N
2019-06-22	\N	\N	\N	\N	\N	\N	\N	\N
2019-06-23	\N	\N	\N	\N	\N	\N	\N	\N
2019-06-24	\N	\N	\N	\N	\N	\N	\N	\N
2019-06-25	\N	\N	\N	\N	\N	\N	\N	\N
2019-06-26	\N	\N	\N	\N	\N	\N	\N	\N
2019-06-27	\N	\N	\N	\N	\N	\N	\N	\N
2019-06-28	\N	\N	\N	\N	\N	\N	\N	\N
2019-06-29	\N	\N	\N	\N	\N	\N	\N	\N
2019-06-30	\N	\N	\N	\N	\N	\N	\N	\N
2019-07-01	\N	\N	\N	\N	\N	\N	\N	\N
2019-07-02	\N	\N	\N	\N	\N	\N	\N	\N
2019-07-03	\N	\N	\N	\N	\N	\N	\N	\N
2019-07-04	\N	\N	\N	\N	\N	\N	\N	\N
2019-07-05	\N	\N	\N	\N	\N	\N	\N	\N
2019-07-06	\N	\N	\N	\N	\N	\N	\N	\N
2019-07-07	\N	\N	\N	\N	\N	\N	\N	\N
2019-07-08	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-07-09	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-07-10	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-07-11	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-07-12	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-07-13	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-07-14	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-07-15	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-07-16	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-07-17	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-07-18	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-07-19	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-07-20	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-07-21	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-07-22	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-07-23	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-07-24	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-07-25	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-07-26	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-07-27	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-07-28	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-07-29	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-07-30	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-07-31	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-08-01	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-08-02	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-08-03	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-08-04	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-08-05	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-08-06	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-08-07	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-08-08	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-08-09	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-08-10	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-08-11	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-08-12	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-08-13	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-08-14	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-08-15	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-08-16	\N	\N	\N	\N	\N	\N	t	Sommerferien
2019-08-17	\N	\N	\N	\N	\N	\N	\N	\N
2019-08-18	\N	\N	\N	\N	\N	\N	\N	\N
2019-08-19	\N	\N	\N	\N	\N	\N	\N	\N
2019-08-20	\N	\N	\N	\N	\N	\N	\N	\N
2019-08-21	\N	\N	\N	\N	\N	\N	\N	\N
2019-08-22	\N	\N	\N	\N	\N	\N	\N	\N
2019-08-23	\N	\N	\N	\N	\N	\N	\N	\N
2019-08-24	\N	\N	\N	\N	\N	\N	\N	\N
2019-08-25	\N	\N	\N	\N	\N	\N	\N	\N
2019-08-26	\N	\N	\N	\N	\N	\N	\N	\N
2019-08-27	\N	\N	\N	\N	\N	\N	\N	\N
2019-08-28	\N	\N	\N	\N	\N	\N	\N	\N
2019-08-29	\N	\N	\N	\N	\N	\N	\N	\N
2019-08-30	\N	\N	\N	\N	\N	\N	\N	\N
2019-08-31	\N	\N	\N	\N	\N	\N	\N	\N
2019-09-01	\N	\N	\N	\N	\N	\N	\N	\N
2019-09-02	\N	\N	\N	\N	\N	\N	\N	\N
2019-09-03	\N	\N	\N	\N	\N	\N	\N	\N
2019-09-04	\N	\N	\N	\N	\N	\N	\N	\N
2019-09-05	\N	\N	\N	\N	\N	\N	\N	\N
2019-09-06	\N	\N	\N	\N	\N	\N	\N	\N
2019-09-07	\N	\N	\N	\N	\N	\N	\N	\N
2019-09-08	\N	\N	\N	\N	\N	\N	\N	\N
2019-09-09	\N	\N	\N	\N	\N	\N	\N	\N
2019-09-10	\N	\N	\N	\N	\N	\N	\N	\N
2019-09-11	\N	\N	\N	\N	\N	\N	\N	\N
2019-09-12	\N	\N	\N	\N	\N	\N	\N	\N
2019-09-13	\N	\N	\N	\N	\N	\N	\N	\N
2019-09-14	\N	\N	\N	\N	\N	\N	\N	\N
2019-09-15	\N	\N	\N	\N	\N	\N	\N	\N
2019-09-16	\N	\N	\N	\N	\N	\N	\N	\N
2019-09-17	\N	\N	\N	\N	\N	\N	\N	\N
2019-09-18	\N	\N	\N	\N	\N	\N	\N	\N
2019-09-19	\N	\N	\N	\N	\N	\N	\N	\N
2019-09-20	\N	\N	\N	\N	\N	\N	\N	\N
2019-09-21	\N	\N	\N	\N	\N	\N	\N	\N
2019-09-22	\N	\N	\N	\N	\N	\N	\N	\N
2019-09-23	\N	\N	\N	\N	\N	\N	\N	\N
2019-09-24	\N	\N	\N	\N	\N	\N	\N	\N
2019-09-25	\N	\N	\N	\N	\N	\N	\N	\N
2019-09-26	\N	\N	\N	\N	\N	\N	\N	\N
2019-09-27	\N	\N	\N	\N	\N	\N	\N	\N
2019-09-28	\N	\N	\N	\N	\N	\N	\N	\N
2019-09-29	\N	\N	\N	\N	\N	\N	\N	\N
2019-09-30	\N	\N	\N	\N	\N	\N	\N	\N
2019-10-01	\N	\N	\N	\N	\N	\N	\N	\N
2019-10-02	\N	\N	\N	\N	\N	\N	\N	\N
2019-10-03	t	Tag der deutschen Einheit	\N	\N	\N	\N	\N	\N
2019-10-04	\N	\N	\N	\N	\N	\N	\N	\N
2019-10-05	\N	\N	\N	\N	\N	\N	\N	\N
2019-10-06	\N	\N	\N	\N	\N	\N	\N	\N
2019-10-07	\N	\N	\N	\N	\N	\N	\N	\N
2019-10-08	\N	\N	\N	\N	\N	\N	\N	\N
2019-10-09	\N	\N	\N	\N	\N	\N	\N	\N
2019-10-10	\N	\N	\N	\N	\N	\N	\N	\N
2019-10-11	\N	\N	\N	\N	\N	\N	\N	\N
2019-10-12	\N	\N	\N	\N	\N	\N	\N	\N
2019-10-13	\N	\N	\N	\N	\N	\N	\N	\N
2019-10-14	\N	\N	\N	\N	\N	\N	t	Herbstferien
2019-10-15	\N	\N	\N	\N	\N	\N	t	Herbstferien
2019-10-16	\N	\N	\N	\N	\N	\N	t	Herbstferien
2019-10-17	\N	\N	\N	\N	\N	\N	t	Herbstferien
2019-10-18	\N	\N	\N	\N	\N	\N	t	Herbstferien
2019-10-19	\N	\N	\N	\N	\N	\N	t	Herbstferien
2019-10-20	\N	\N	\N	\N	\N	\N	t	Herbstferien
2019-10-21	\N	\N	\N	\N	\N	\N	t	Herbstferien
2019-10-22	\N	\N	\N	\N	\N	\N	t	Herbstferien
2019-10-23	\N	\N	\N	\N	\N	\N	t	Herbstferien
2019-10-24	\N	\N	\N	\N	\N	\N	t	Herbstferien
2019-10-25	\N	\N	\N	\N	\N	\N	t	Herbstferien
2019-10-26	\N	\N	\N	\N	\N	\N	\N	\N
2019-10-27	\N	\N	\N	\N	\N	\N	\N	\N
2019-10-28	\N	\N	\N	\N	\N	\N	\N	\N
2019-10-29	\N	\N	\N	\N	\N	\N	\N	\N
2019-10-30	\N	\N	\N	\N	\N	\N	\N	\N
2019-10-31	\N	\N	t	Reformationstag	\N	\N	\N	\N
2019-11-01	\N	\N	\N	\N	t	Allerheiligen	\N	\N
2019-11-02	\N	\N	\N	\N	\N	\N	\N	\N
2019-11-03	\N	\N	\N	\N	\N	\N	\N	\N
2019-11-04	\N	\N	\N	\N	\N	\N	\N	\N
2019-11-05	\N	\N	\N	\N	\N	\N	\N	\N
2019-11-06	\N	\N	\N	\N	\N	\N	\N	\N
2019-11-07	\N	\N	\N	\N	\N	\N	\N	\N
2019-11-08	\N	\N	\N	\N	\N	\N	\N	\N
2019-11-09	\N	\N	\N	\N	\N	\N	\N	\N
2019-11-10	\N	\N	\N	\N	\N	\N	\N	\N
2019-11-11	\N	\N	\N	\N	\N	\N	\N	\N
2019-11-12	\N	\N	\N	\N	\N	\N	\N	\N
2019-11-13	\N	\N	\N	\N	\N	\N	\N	\N
2019-11-14	\N	\N	\N	\N	\N	\N	\N	\N
2019-11-15	\N	\N	\N	\N	\N	\N	\N	\N
2019-11-16	\N	\N	\N	\N	\N	\N	\N	\N
2019-11-17	\N	\N	\N	\N	\N	\N	\N	\N
2019-11-18	\N	\N	\N	\N	\N	\N	\N	\N
2019-11-19	\N	\N	\N	\N	\N	\N	\N	\N
2019-11-20	\N	\N	t	Buß- und Bettag	\N	\N	\N	\N
2019-11-21	\N	\N	\N	\N	\N	\N	\N	\N
2019-11-22	\N	\N	\N	\N	\N	\N	\N	\N
2019-11-23	\N	\N	\N	\N	\N	\N	\N	\N
2019-11-24	\N	\N	\N	\N	\N	\N	\N	\N
2019-11-25	\N	\N	\N	\N	\N	\N	\N	\N
2019-11-26	\N	\N	\N	\N	\N	\N	\N	\N
2019-11-27	\N	\N	\N	\N	\N	\N	\N	\N
2019-11-28	\N	\N	\N	\N	\N	\N	\N	\N
2019-11-29	\N	\N	\N	\N	\N	\N	\N	\N
2019-11-30	\N	\N	\N	\N	\N	\N	\N	\N
2019-12-01	\N	\N	\N	\N	\N	\N	\N	\N
2019-12-02	\N	\N	\N	\N	\N	\N	\N	\N
2019-12-03	\N	\N	\N	\N	\N	\N	\N	\N
2019-12-04	\N	\N	\N	\N	\N	\N	\N	\N
2019-12-05	\N	\N	\N	\N	\N	\N	\N	\N
2019-12-06	\N	\N	\N	\N	\N	\N	\N	\N
2019-12-07	\N	\N	\N	\N	\N	\N	\N	\N
2019-12-08	\N	\N	\N	\N	\N	\N	\N	\N
2019-12-09	\N	\N	\N	\N	\N	\N	\N	\N
2019-12-10	\N	\N	\N	\N	\N	\N	\N	\N
2019-12-11	\N	\N	\N	\N	\N	\N	\N	\N
2019-12-12	\N	\N	\N	\N	\N	\N	\N	\N
2019-12-13	\N	\N	\N	\N	\N	\N	\N	\N
2019-12-14	\N	\N	\N	\N	\N	\N	\N	\N
2019-12-15	\N	\N	\N	\N	\N	\N	\N	\N
2019-12-16	\N	\N	\N	\N	\N	\N	\N	\N
2019-12-17	\N	\N	\N	\N	\N	\N	\N	\N
2019-12-18	\N	\N	\N	\N	\N	\N	\N	\N
2019-12-19	\N	\N	\N	\N	\N	\N	\N	\N
2019-12-20	\N	\N	\N	\N	\N	\N	\N	\N
2019-12-21	\N	\N	\N	\N	\N	\N	t	Weihnachtsferien
2019-12-22	\N	\N	\N	\N	\N	\N	t	Weihnachtsferien
2019-12-23	\N	\N	\N	\N	\N	\N	t	Weihnachtsferien
2019-12-24	\N	\N	\N	\N	\N	\N	t	Weihnachtsferien
2019-12-25	t	1. Weihnachtsfeiertag	\N	\N	\N	\N	t	Weihnachtsferien
2019-12-26	t	2.Weihnachtsfeiertag	\N	\N	\N	\N	t	Weihnachtsferien
2019-12-27	\N	\N	\N	\N	\N	\N	t	Weihnachtsferien
2019-12-28	\N	\N	\N	\N	\N	\N	t	Weihnachtsferien
2019-12-29	\N	\N	\N	\N	\N	\N	t	Weihnachtsferien
2019-12-30	\N	\N	\N	\N	\N	\N	t	Weihnachtsferien
2019-12-31	\N	\N	\N	\N	\N	\N	t	Weihnachtsferien
\.


--
-- Data for Name: kontakte; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kontakte (nachname, vorname, telefon1, telefon2, telefon3, email1, email2, email3, id, firma, fulltextarray, fulltext, user_id, showing) FROM stdin;
testing last	testing first	121232	123131	58585	ajasdkasd@email.com	aasdsad@email.com	amasdas@email.com	3	test	\N	\N	14	1
asASA	dasS	5242343	2432432	2432432	ajnasda@email.com	aadas@email.com	adadas@email.com	4	dsdaasdas	\N	\N	15	1
USER	TEST	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	13	1
adasdsa	adasdasd							6		\N	\N	4	0
Iqbal	Tamim	015112304805			tamin@gz.de			7	RF	\N	\N	16	0
	admin	54464564564	3424324234	2324324234	asddd@email.com	adasdasd@email.com	adasdasd@email.com	5	dfdsfsfs	\N	\N	2	1
\.


--
-- Data for Name: media; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.media (theme, name, path, iconpath, type, "timestamp", themeid, id, path2, iconpath2, path3, iconpath3, access_group, name2, name3) FROM stdin;
\N	Folien  Teil 1	training/videos/76ffa1eab1e46c8040e8dcaf836e1cef.mp4	training/videos/76ffa1eab1e46c8040e8dcaf836e1cef.jpg	video	\N	1	8	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 3.2.2 First floor interior walls	training/videos/8d1f38a70b4ce92da27b92bef0d514ff.mp4	training/videos/8d1f38a70b4ce92da27b92bef0d514ff.jpg	video	\N	38	43	\N	\N	\N	\N	\N	\N	\N
AutoCAD	\N	\N	training/icons/59a248bd095f0ecd0ef43802c9058842.jpg	\N	\N	\N	3	\N	\N	\N	\N	\N	\N	\N
\N	Blechquerschnitte Teil 1	training/videos/cdf41e4a3d43b89ed2525a9f58f1ee36.mp4	training/videos/cdf41e4a3d43b89ed2525a9f58f1ee36.jpg	video	\N	1	9	\N	\N	\N	\N	\N	\N	\N
\N	RF - Wandschraffur ändern	training/documents/93e8f5460db5d90d0044441e48c0690f.pdf	training/documents/93e8f5460db5d90d0044441e48c0690f.jpg	handbook	\N	3	29	\N	\N	\N	\N	\N	\N	\N
\N	Blechquerschnitte Teil 2	training/videos/611d4a30c3ad97c47d853f0bdef6c7dd.mp4	training/videos/611d4a30c3ad97c47d853f0bdef6c7dd.jpg	video	\N	1	10	\N	\N	\N	\N	\N	\N	\N
\N	Vom Winkelrahmen zur 3D-Auswertung Teil 1	training/videos/915f963dc652f55f7238f2162ce26ad7.mp4	training/videos/915f963dc652f55f7238f2162ce26ad7.jpg	video	\N	1	11	\N	\N	\N	\N	\N	\N	\N
\N	2D Dämmungen	training/videos/eaa9d98e3e7162e39d6cb8e675d73a72.mp4	training/videos/eaa9d98e3e7162e39d6cb8e675d73a72.jpg	video	\N	1	12	\N	\N	\N	\N	\N	\N	\N
\N	Füllungen erstellen, verwalten Teil 1	training/videos/8f2ca49fa6f097c91df6d1f636d4c692.mp4	training/videos/8f2ca49fa6f097c91df6d1f636d4c692.jpg	video	\N	1	13	\N	\N	\N	\N	\N	\N	\N
\N	Füllungen erstellen, verwalten Teil 2	training/videos/30ede7203c9b2e3d664b8ef287b71244.mp4	training/videos/30ede7203c9b2e3d664b8ef287b71244.jpg	video	\N	1	14	\N	\N	\N	\N	\N	\N	\N
\N	Versiegelung / Klotz / Flachdichtung	training/videos/4d03b344df52f9b4e91889d6b33c4dce.mp4	training/videos/4d03b344df52f9b4e91889d6b33c4dce.jpg	video	\N	1	15	\N	\N	\N	\N	\N	\N	\N
\N	Erstellen einer Zeichnung	training/documents/94d326215b8f8356a70953a3634d45b4.pdf	training/documents/94d326215b8f8356a70953a3634d45b4.jpg	handbook	\N	3	30	\N	\N	\N	\N	\N	\N	\N
\N	Punkt-Koordinaten zu Excel exportieren	training/documents/12d49ce066a3f66f079c6d5915bd686d.pdf	training/documents/12d49ce066a3f66f079c6d5915bd686d.jpg	handbook	\N	3	31	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 2.8.2 Ground floor curtain wall styles	training/videos/64ccc4ea345e8021d29000fcb83c179c.mp4	training/videos/64ccc4ea345e8021d29000fcb83c179c.jpg	video	\N	38	44	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 0.3 Level Manager	training/videos/34000f16e39ff9b74d653341523e663c.mp4	training/videos/34000f16e39ff9b74d653341523e663c.jpg	video	\N	38	46	\N	\N	\N	\N	\N	\N	\N
IKAVIOS	\N	\N	training/icons/c7574fed4b60f14cbcdac9488ce7e542.jpg	\N	\N	\N	2	\N	\N	\N	\N	\N	\N	\N
SSP - Specialized Security Products	\N	\N	training/icons/c49faeaef38c25450d20a954f4ba5861.jpg	\N	\N	\N	36	\N	\N	\N	\N	\N	\N	\N
\N	NT200 - Flush mount infrared no touch button with adjustable proximity range	training/videos/210f9ffbf657d61982ea6b88260c073d.mp4	training/videos/210f9ffbf657d61982ea6b88260c073d.jpg	video	\N	36	37	\N	\N	\N	\N	\N	\N	\N
\N	Normteile / Halbzeuge Teil 2	training/videos/78a049d544b69738575e087839e12ef4.mp4	training/videos/78a049d544b69738575e087839e12ef4.jpg	video	\N	1	17	\N	\N	\N	\N	\N	\N	\N
\N	Normteile / Halbzeuge Teil 3	training/videos/f10f1999fdc54188e391aee9a0a04702.mp4	training/videos/f10f1999fdc54188e391aee9a0a04702.jpg	video	\N	1	18	\N	\N	\N	\N	\N	\N	\N
\N	Blechbearbeitung Teil 1	training/videos/f3b10058a009b40953c64c4e52ce8a46.mp4	training/videos/f3b10058a009b40953c64c4e52ce8a46.jpg	video	\N	1	20	\N	\N	\N	\N	\N	\N	\N
\N	Vom Winkelrahmen zur 3D-Auswertung Teil 2	training/videos/96fb666a643905aaa263f3ed136cf315.mp4	training/videos/96fb666a643905aaa263f3ed136cf315.jpg	video	\N	1	19	\N	\N	\N	\N	\N	\N	\N
\N	Blechbearbeitung Teil 2	training/videos/5aa85baae515deecfc3bc549f0b31f0e.mp4	training/videos/5aa85baae515deecfc3bc549f0b31f0e.jpg	video	\N	1	21	\N	\N	\N	\N	\N	\N	\N
\N	Lieferziele	training/documents/845b176a0a5b2811af16c6f068df3555.pdf	training/documents/845b176a0a5b2811af16c6f068df3555.jpg	handbook	\N	2	6	\N	\N	\N	\N	\N	\N	\N
VisualARQ	\N	\N	training/icons/05a7ec2a787742be3b644c7e84ee63c2.jpg	\N	\N	\N	38	\N	\N	\N	\N	\N	\N	\N
\N	Folien Teil 2	training/videos/d16546898e20fb1706db3e1a07837c13.mp4	training/videos/d16546898e20fb1706db3e1a07837c13.jpg	video	\N	1	7	\N	\N	\N	\N	\N	\N	\N
\N	Normteile / Halbzeuge Teil 1	training/videos/e2e7850d068288ac6a9762a31dcbbc06.mp4	training/videos/e2e7850d068288ac6a9762a31dcbbc06.jpg	video	\N	1	16	\N	\N	\N	\N	\N	\N	\N
\N	Bedarfsmeldungen	training/documents/ea4cf99bbb0b890d647935d56334eff4.pdf	training/documents/ea4cf99bbb0b890d647935d56334eff4.jpg	handbook	\N	2	22	\N	\N	\N	\N	\N	\N	\N
\N	Fertigungsaufträge	training/documents/d5d833fdd52baaa17f71366b08a0d543.pdf	training/documents/d5d833fdd52baaa17f71366b08a0d543.jpg	handbook	\N	2	23	\N	\N	\N	\N	\N	\N	\N
\N	Lagerarten	training/documents/4fc56f49e8988601aeaecb5f75d4ccb2.pdf	training/documents/4fc56f49e8988601aeaecb5f75d4ccb2.jpg	handbook	\N	2	24	\N	\N	\N	\N	\N	\N	\N
\N	Lagerbuchungen	training/documents/7db4e9e285d961596a0e8f36cc8a16d1.pdf	training/documents/7db4e9e285d961596a0e8f36cc8a16d1.jpg	handbook	\N	2	25	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 3.4.1 First floor ramps	training/videos/7c989c93f1759d74c78b573fa2c1dff5.mp4	training/videos/7c989c93f1759d74c78b573fa2c1dff5.jpg	video	\N	38	40	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 3.6.1 First floor windows	training/videos/e5f152dfa025f25221e4e13185f602f0.mp4	training/videos/e5f152dfa025f25221e4e13185f602f0.jpg	video	\N	38	41	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 Flexible BIM Presentation	training/videos/e61ad5fb0ca2aa283d4a4f52fe31c304.mp4	training/videos/e61ad5fb0ca2aa283d4a4f52fe31c304.jpg	video	\N	38	42	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 3.5.1 First floor doors	training/videos/a368ab03c71ca99aa8fe4e4e1a2dee9a.mp4	training/videos/a368ab03c71ca99aa8fe4e4e1a2dee9a.jpg	video	\N	38	47	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 3.1.1 First floor slab	training/videos/26b81f2cca16903a00a622ec1bf0f59d.mp4	training/videos/26b81f2cca16903a00a622ec1bf0f59d.jpg	video	\N	38	48	\N	\N	\N	\N	\N	\N	\N
\N	Automatic 2D Plan Views in Rhino with Grasshopper and VisualARQ	training/videos/e9b8bc62d945af4ce0f3b8500df8ba21.mp4	training/videos/e9b8bc62d945af4ce0f3b8500df8ba21.jpg	video	\N	38	49	\N	\N	\N	\N	\N	\N	\N
\N	Parametric Truss with a Beam Grasshopper style	training/videos/47dec4b46ae2891ca10302a02444953e.mp4	training/videos/47dec4b46ae2891ca10302a02444953e.jpg	video	\N	38	50	\N	\N	\N	\N	\N	\N	\N
\N	2D Vector Drawing with lighting in Rhino	training/videos/cbb8b3dd5c87d8b540e08ad4de3c43d1.mp4	training/videos/cbb8b3dd5c87d8b540e08ad4de3c43d1.jpg	video	\N	38	51	\N	\N	\N	\N	\N	\N	\N
\N	RF - CAD - Richtlinie 2	training/documents/99d3a5b9c8331b2b5df158e9012250b8.pdf	training/documents/99d3a5b9c8331b2b5df158e9012250b8.jpg	handbook	\N	1	27	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 3.6.3 First floor window styles	training/videos/1e017c44458831eca82f00198bd8cc6d.mp4	training/videos/1e017c44458831eca82f00198bd8cc6d.jpg	video	\N	38	52	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 2.9.1 Ground floor stair	training/videos/64c43763c566807a76480e19225902e8.mp4	training/videos/64c43763c566807a76480e19225902e8.jpg	video	\N	38	53	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 3.7.1 First floor openings	training/videos/7ce05d8821c77edea710187b096d4f6d.mp4	training/videos/7ce05d8821c77edea710187b096d4f6d.jpg	video	\N	38	54	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 3.2.1 First floor exterior walls	training/videos/95ba823499667568cbf9b64fec790aa3.mp4	training/videos/95ba823499667568cbf9b64fec790aa3.jpg	video	\N	38	55	\N	\N	\N	\N	\N	\N	\N
AThena new name	\N	\N	training/icons/cf07d74436bcfcb7ef6fef5a901436c8.jpg	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 3.6.2 First floor ramp windows	training/videos/6c6fc7a4b2f8894323b89fbbc0840684.mp4	training/videos/6c6fc7a4b2f8894323b89fbbc0840684.jpg	video	\N	38	56	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 3.3.1 First floor columns	training/videos/4fbf90b11387c5632d05d0ab5528cd30.mp4	training/videos/4fbf90b11387c5632d05d0ab5528cd30.jpg	video	\N	38	57	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 0.2 Objects and styles	training/videos/e3dd9737d86c08622ee8905ec5e41d1f.mp4	training/videos/e3dd9737d86c08622ee8905ec5e41d1f.jpg	video	\N	38	58	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 2.9.2 Ground floor stair styles	training/videos/ecd9e747829e22d1a5a82b8c65dd804c.mp4	training/videos/ecd9e747829e22d1a5a82b8c65dd804c.jpg	video	\N	38	59	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 3.5.2 First floor door styles	training/videos/a15518c340b9deb3cd4a507fe9692f23.mp4	training/videos/a15518c340b9deb3cd4a507fe9692f23.jpg	video	\N	38	60	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 3.3.2 First floor column styles	training/videos/567aa2e18dee852da7bf4218a8bc89b4.mp4	training/videos/567aa2e18dee852da7bf4218a8bc89b4.jpg	video	\N	38	61	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 2.10.2 Ground floor stair railing styles	training/videos/cc35542bee7822f16dddd278fd62239f.mp4	training/videos/cc35542bee7822f16dddd278fd62239f.jpg	video	\N	38	62	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ running inside Revit with Rhino.Inside technology	training/videos/d56b36cf75000dbdc1ebdb8933f5bddb.mp4	training/videos/d56b36cf75000dbdc1ebdb8933f5bddb.jpg	video	\N	38	63	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 0.1 Toolbars overview	training/videos/7e5a79b7ec415cb4bc49f1102a85c0ce.mp4	training/videos/7e5a79b7ec415cb4bc49f1102a85c0ce.jpg	video	\N	38	64	\N	\N	\N	\N	\N	\N	\N
\N	Automatic 4 Elevations from a room	training/videos/c102b8b3a83bf69b30d824a2c46c5a9e.mp4	training/videos/c102b8b3a83bf69b30d824a2c46c5a9e.jpg	video	\N	38	65	\N	\N	\N	\N	\N	\N	\N
\N	Create a VisualARQ Grasshopper style in 3 steps	training/videos/de0aaeed754a736541bc1c4c8561a091.mp4	training/videos/de0aaeed754a736541bc1c4c8561a091.jpg	video	\N	38	66	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 2.6 Ground floor doors	training/videos/4b7147e7c84e13724fcd552e9ae0e8f1.mp4	training/videos/4b7147e7c84e13724fcd552e9ae0e8f1.jpg	video	\N	38	67	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 2.3 Ground floor Columns	training/videos/b7ce147bdf638060064cefa69f3dc6bd.mp4	training/videos/b7ce147bdf638060064cefa69f3dc6bd.jpg	video	\N	38	68	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 2.7.1 Ground floor windows	training/videos/be9db28a65a8c5b4fca602e38e384bd5.mp4	training/videos/be9db28a65a8c5b4fca602e38e384bd5.jpg	video	\N	38	69	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 2.2.1 Ground floor Walls	training/videos/a85ffaf6bc474ba01ac6f279e3135998.mp4	training/videos/a85ffaf6bc474ba01ac6f279e3135998.jpg	video	\N	38	70	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 2.1 Ground floor Slabs	training/videos/bb79fad05dbacc5d2a3dbeb5afbe0fa0.mp4	training/videos/bb79fad05dbacc5d2a3dbeb5afbe0fa0.jpg	video	\N	38	71	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 2.4.1 Ground floor ramp	training/videos/970325b596e941e8cd6c26e0678f54b2.mp4	training/videos/970325b596e941e8cd6c26e0678f54b2.jpg	video	\N	38	72	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 2.8.1 Ground floor curtain walls	training/videos/211ee4f00fddfa570b114ff9971c34ab.mp4	training/videos/211ee4f00fddfa570b114ff9971c34ab.jpg	video	\N	38	73	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 2.5 Ground floor beams	training/videos/19aa37eea7603f2637eacc34f054a44c.mp4	training/videos/19aa37eea7603f2637eacc34f054a44c.jpg	video	\N	38	74	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 2.10.1 Ground floor stair railings	training/videos/9e2d82da2e507f4eeff0f65d02c5822b.mp4	training/videos/9e2d82da2e507f4eeff0f65d02c5822b.jpg	video	\N	38	75	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 1.2 Insert drawing plans bitmaps	training/videos/5c8fb40446c0e8b4222cf7a69ae36f45.mp4	training/videos/5c8fb40446c0e8b4222cf7a69ae36f45.jpg	video	\N	38	77	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 1.3 Set Levels	training/videos/77f6e43b6c311ac2eebd0464ff94feac.mp4	training/videos/77f6e43b6c311ac2eebd0464ff94feac.jpg	video	\N	38	78	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 1.1. New document	training/videos/0c96fafe15b7651dc6bf6dc889086330.mp4	training/videos/0c96fafe15b7651dc6bf6dc889086330.jpg	video	\N	38	79	\N	\N	\N	\N	\N	\N	\N
\N	Folien  Teil 1	training/videos/76ffa1eab1e46c8040e8dcaf836e1cef.mp4	training/videos/76ffa1eab1e46c8040e8dcaf836e1cef.jpg	video	\N	1	8	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 3.2.2 First floor interior walls	training/videos/8d1f38a70b4ce92da27b92bef0d514ff.mp4	training/videos/8d1f38a70b4ce92da27b92bef0d514ff.jpg	video	\N	38	43	\N	\N	\N	\N	\N	\N	\N
AutoCAD	\N	\N	training/icons/59a248bd095f0ecd0ef43802c9058842.jpg	\N	\N	\N	3	\N	\N	\N	\N	\N	\N	\N
\N	Blechquerschnitte Teil 1	training/videos/cdf41e4a3d43b89ed2525a9f58f1ee36.mp4	training/videos/cdf41e4a3d43b89ed2525a9f58f1ee36.jpg	video	\N	1	9	\N	\N	\N	\N	\N	\N	\N
\N	RF - Wandschraffur ändern	training/documents/93e8f5460db5d90d0044441e48c0690f.pdf	training/documents/93e8f5460db5d90d0044441e48c0690f.jpg	handbook	\N	3	29	\N	\N	\N	\N	\N	\N	\N
\N	Blechquerschnitte Teil 2	training/videos/611d4a30c3ad97c47d853f0bdef6c7dd.mp4	training/videos/611d4a30c3ad97c47d853f0bdef6c7dd.jpg	video	\N	1	10	\N	\N	\N	\N	\N	\N	\N
\N	Vom Winkelrahmen zur 3D-Auswertung Teil 1	training/videos/915f963dc652f55f7238f2162ce26ad7.mp4	training/videos/915f963dc652f55f7238f2162ce26ad7.jpg	video	\N	1	11	\N	\N	\N	\N	\N	\N	\N
\N	2D Dämmungen	training/videos/eaa9d98e3e7162e39d6cb8e675d73a72.mp4	training/videos/eaa9d98e3e7162e39d6cb8e675d73a72.jpg	video	\N	1	12	\N	\N	\N	\N	\N	\N	\N
\N	Füllungen erstellen, verwalten Teil 1	training/videos/8f2ca49fa6f097c91df6d1f636d4c692.mp4	training/videos/8f2ca49fa6f097c91df6d1f636d4c692.jpg	video	\N	1	13	\N	\N	\N	\N	\N	\N	\N
\N	Füllungen erstellen, verwalten Teil 2	training/videos/30ede7203c9b2e3d664b8ef287b71244.mp4	training/videos/30ede7203c9b2e3d664b8ef287b71244.jpg	video	\N	1	14	\N	\N	\N	\N	\N	\N	\N
\N	Versiegelung / Klotz / Flachdichtung	training/videos/4d03b344df52f9b4e91889d6b33c4dce.mp4	training/videos/4d03b344df52f9b4e91889d6b33c4dce.jpg	video	\N	1	15	\N	\N	\N	\N	\N	\N	\N
\N	Erstellen einer Zeichnung	training/documents/94d326215b8f8356a70953a3634d45b4.pdf	training/documents/94d326215b8f8356a70953a3634d45b4.jpg	handbook	\N	3	30	\N	\N	\N	\N	\N	\N	\N
\N	Punkt-Koordinaten zu Excel exportieren	training/documents/12d49ce066a3f66f079c6d5915bd686d.pdf	training/documents/12d49ce066a3f66f079c6d5915bd686d.jpg	handbook	\N	3	31	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 2.8.2 Ground floor curtain wall styles	training/videos/64ccc4ea345e8021d29000fcb83c179c.mp4	training/videos/64ccc4ea345e8021d29000fcb83c179c.jpg	video	\N	38	44	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 0.3 Level Manager	training/videos/34000f16e39ff9b74d653341523e663c.mp4	training/videos/34000f16e39ff9b74d653341523e663c.jpg	video	\N	38	46	\N	\N	\N	\N	\N	\N	\N
IKAVIOS	\N	\N	training/icons/c7574fed4b60f14cbcdac9488ce7e542.jpg	\N	\N	\N	2	\N	\N	\N	\N	\N	\N	\N
SSP - Specialized Security Products	\N	\N	training/icons/c49faeaef38c25450d20a954f4ba5861.jpg	\N	\N	\N	36	\N	\N	\N	\N	\N	\N	\N
\N	NT200 - Flush mount infrared no touch button with adjustable proximity range	training/videos/210f9ffbf657d61982ea6b88260c073d.mp4	training/videos/210f9ffbf657d61982ea6b88260c073d.jpg	video	\N	36	37	\N	\N	\N	\N	\N	\N	\N
\N	Normteile / Halbzeuge Teil 2	training/videos/78a049d544b69738575e087839e12ef4.mp4	training/videos/78a049d544b69738575e087839e12ef4.jpg	video	\N	1	17	\N	\N	\N	\N	\N	\N	\N
AThena new name	\N	\N	training/icons/cf07d74436bcfcb7ef6fef5a901436c8.jpg	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
\N	Normteile / Halbzeuge Teil 3	training/videos/f10f1999fdc54188e391aee9a0a04702.mp4	training/videos/f10f1999fdc54188e391aee9a0a04702.jpg	video	\N	1	18	\N	\N	\N	\N	\N	\N	\N
\N	Blechbearbeitung Teil 1	training/videos/f3b10058a009b40953c64c4e52ce8a46.mp4	training/videos/f3b10058a009b40953c64c4e52ce8a46.jpg	video	\N	1	20	\N	\N	\N	\N	\N	\N	\N
\N	Vom Winkelrahmen zur 3D-Auswertung Teil 2	training/videos/96fb666a643905aaa263f3ed136cf315.mp4	training/videos/96fb666a643905aaa263f3ed136cf315.jpg	video	\N	1	19	\N	\N	\N	\N	\N	\N	\N
\N	Blechbearbeitung Teil 2	training/videos/5aa85baae515deecfc3bc549f0b31f0e.mp4	training/videos/5aa85baae515deecfc3bc549f0b31f0e.jpg	video	\N	1	21	\N	\N	\N	\N	\N	\N	\N
\N	Lieferziele	training/documents/845b176a0a5b2811af16c6f068df3555.pdf	training/documents/845b176a0a5b2811af16c6f068df3555.jpg	handbook	\N	2	6	\N	\N	\N	\N	\N	\N	\N
VisualARQ	\N	\N	training/icons/05a7ec2a787742be3b644c7e84ee63c2.jpg	\N	\N	\N	38	\N	\N	\N	\N	\N	\N	\N
\N	Folien Teil 2	training/videos/d16546898e20fb1706db3e1a07837c13.mp4	training/videos/d16546898e20fb1706db3e1a07837c13.jpg	video	\N	1	7	\N	\N	\N	\N	\N	\N	\N
\N	Normteile / Halbzeuge Teil 1	training/videos/e2e7850d068288ac6a9762a31dcbbc06.mp4	training/videos/e2e7850d068288ac6a9762a31dcbbc06.jpg	video	\N	1	16	\N	\N	\N	\N	\N	\N	\N
\N	Bedarfsmeldungen	training/documents/ea4cf99bbb0b890d647935d56334eff4.pdf	training/documents/ea4cf99bbb0b890d647935d56334eff4.jpg	handbook	\N	2	22	\N	\N	\N	\N	\N	\N	\N
\N	Fertigungsaufträge	training/documents/d5d833fdd52baaa17f71366b08a0d543.pdf	training/documents/d5d833fdd52baaa17f71366b08a0d543.jpg	handbook	\N	2	23	\N	\N	\N	\N	\N	\N	\N
\N	Lagerarten	training/documents/4fc56f49e8988601aeaecb5f75d4ccb2.pdf	training/documents/4fc56f49e8988601aeaecb5f75d4ccb2.jpg	handbook	\N	2	24	\N	\N	\N	\N	\N	\N	\N
\N	Lagerbuchungen	training/documents/7db4e9e285d961596a0e8f36cc8a16d1.pdf	training/documents/7db4e9e285d961596a0e8f36cc8a16d1.jpg	handbook	\N	2	25	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 3.4.1 First floor ramps	training/videos/7c989c93f1759d74c78b573fa2c1dff5.mp4	training/videos/7c989c93f1759d74c78b573fa2c1dff5.jpg	video	\N	38	40	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 3.6.1 First floor windows	training/videos/e5f152dfa025f25221e4e13185f602f0.mp4	training/videos/e5f152dfa025f25221e4e13185f602f0.jpg	video	\N	38	41	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 Flexible BIM Presentation	training/videos/e61ad5fb0ca2aa283d4a4f52fe31c304.mp4	training/videos/e61ad5fb0ca2aa283d4a4f52fe31c304.jpg	video	\N	38	42	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 3.5.1 First floor doors	training/videos/a368ab03c71ca99aa8fe4e4e1a2dee9a.mp4	training/videos/a368ab03c71ca99aa8fe4e4e1a2dee9a.jpg	video	\N	38	47	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 3.1.1 First floor slab	training/videos/26b81f2cca16903a00a622ec1bf0f59d.mp4	training/videos/26b81f2cca16903a00a622ec1bf0f59d.jpg	video	\N	38	48	\N	\N	\N	\N	\N	\N	\N
\N	Automatic 2D Plan Views in Rhino with Grasshopper and VisualARQ	training/videos/e9b8bc62d945af4ce0f3b8500df8ba21.mp4	training/videos/e9b8bc62d945af4ce0f3b8500df8ba21.jpg	video	\N	38	49	\N	\N	\N	\N	\N	\N	\N
\N	Parametric Truss with a Beam Grasshopper style	training/videos/47dec4b46ae2891ca10302a02444953e.mp4	training/videos/47dec4b46ae2891ca10302a02444953e.jpg	video	\N	38	50	\N	\N	\N	\N	\N	\N	\N
\N	2D Vector Drawing with lighting in Rhino	training/videos/cbb8b3dd5c87d8b540e08ad4de3c43d1.mp4	training/videos/cbb8b3dd5c87d8b540e08ad4de3c43d1.jpg	video	\N	38	51	\N	\N	\N	\N	\N	\N	\N
\N	RF - CAD - Richtlinie 2	training/documents/99d3a5b9c8331b2b5df158e9012250b8.pdf	training/documents/99d3a5b9c8331b2b5df158e9012250b8.jpg	handbook	\N	1	27	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 3.6.3 First floor window styles	training/videos/1e017c44458831eca82f00198bd8cc6d.mp4	training/videos/1e017c44458831eca82f00198bd8cc6d.jpg	video	\N	38	52	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 2.9.1 Ground floor stair	training/videos/64c43763c566807a76480e19225902e8.mp4	training/videos/64c43763c566807a76480e19225902e8.jpg	video	\N	38	53	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 3.7.1 First floor openings	training/videos/7ce05d8821c77edea710187b096d4f6d.mp4	training/videos/7ce05d8821c77edea710187b096d4f6d.jpg	video	\N	38	54	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 3.2.1 First floor exterior walls	training/videos/95ba823499667568cbf9b64fec790aa3.mp4	training/videos/95ba823499667568cbf9b64fec790aa3.jpg	video	\N	38	55	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 3.6.2 First floor ramp windows	training/videos/6c6fc7a4b2f8894323b89fbbc0840684.mp4	training/videos/6c6fc7a4b2f8894323b89fbbc0840684.jpg	video	\N	38	56	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 3.3.1 First floor columns	training/videos/4fbf90b11387c5632d05d0ab5528cd30.mp4	training/videos/4fbf90b11387c5632d05d0ab5528cd30.jpg	video	\N	38	57	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 0.2 Objects and styles	training/videos/e3dd9737d86c08622ee8905ec5e41d1f.mp4	training/videos/e3dd9737d86c08622ee8905ec5e41d1f.jpg	video	\N	38	58	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 2.9.2 Ground floor stair styles	training/videos/ecd9e747829e22d1a5a82b8c65dd804c.mp4	training/videos/ecd9e747829e22d1a5a82b8c65dd804c.jpg	video	\N	38	59	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 3.5.2 First floor door styles	training/videos/a15518c340b9deb3cd4a507fe9692f23.mp4	training/videos/a15518c340b9deb3cd4a507fe9692f23.jpg	video	\N	38	60	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 3.3.2 First floor column styles	training/videos/567aa2e18dee852da7bf4218a8bc89b4.mp4	training/videos/567aa2e18dee852da7bf4218a8bc89b4.jpg	video	\N	38	61	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 2.10.2 Ground floor stair railing styles	training/videos/cc35542bee7822f16dddd278fd62239f.mp4	training/videos/cc35542bee7822f16dddd278fd62239f.jpg	video	\N	38	62	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ running inside Revit with Rhino.Inside technology	training/videos/d56b36cf75000dbdc1ebdb8933f5bddb.mp4	training/videos/d56b36cf75000dbdc1ebdb8933f5bddb.jpg	video	\N	38	63	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 0.1 Toolbars overview	training/videos/7e5a79b7ec415cb4bc49f1102a85c0ce.mp4	training/videos/7e5a79b7ec415cb4bc49f1102a85c0ce.jpg	video	\N	38	64	\N	\N	\N	\N	\N	\N	\N
\N	Automatic 4 Elevations from a room	training/videos/c102b8b3a83bf69b30d824a2c46c5a9e.mp4	training/videos/c102b8b3a83bf69b30d824a2c46c5a9e.jpg	video	\N	38	65	\N	\N	\N	\N	\N	\N	\N
\N	Create a VisualARQ Grasshopper style in 3 steps	training/videos/de0aaeed754a736541bc1c4c8561a091.mp4	training/videos/de0aaeed754a736541bc1c4c8561a091.jpg	video	\N	38	66	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 2.6 Ground floor doors	training/videos/4b7147e7c84e13724fcd552e9ae0e8f1.mp4	training/videos/4b7147e7c84e13724fcd552e9ae0e8f1.jpg	video	\N	38	67	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 2.3 Ground floor Columns	training/videos/b7ce147bdf638060064cefa69f3dc6bd.mp4	training/videos/b7ce147bdf638060064cefa69f3dc6bd.jpg	video	\N	38	68	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 2.7.1 Ground floor windows	training/videos/be9db28a65a8c5b4fca602e38e384bd5.mp4	training/videos/be9db28a65a8c5b4fca602e38e384bd5.jpg	video	\N	38	69	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 2.2.1 Ground floor Walls	training/videos/a85ffaf6bc474ba01ac6f279e3135998.mp4	training/videos/a85ffaf6bc474ba01ac6f279e3135998.jpg	video	\N	38	70	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 2.1 Ground floor Slabs	training/videos/bb79fad05dbacc5d2a3dbeb5afbe0fa0.mp4	training/videos/bb79fad05dbacc5d2a3dbeb5afbe0fa0.jpg	video	\N	38	71	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 2.4.1 Ground floor ramp	training/videos/970325b596e941e8cd6c26e0678f54b2.mp4	training/videos/970325b596e941e8cd6c26e0678f54b2.jpg	video	\N	38	72	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 2.8.1 Ground floor curtain walls	training/videos/211ee4f00fddfa570b114ff9971c34ab.mp4	training/videos/211ee4f00fddfa570b114ff9971c34ab.jpg	video	\N	38	73	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 2.5 Ground floor beams	training/videos/19aa37eea7603f2637eacc34f054a44c.mp4	training/videos/19aa37eea7603f2637eacc34f054a44c.jpg	video	\N	38	74	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 2.10.1 Ground floor stair railings	training/videos/9e2d82da2e507f4eeff0f65d02c5822b.mp4	training/videos/9e2d82da2e507f4eeff0f65d02c5822b.jpg	video	\N	38	75	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 1.2 Insert drawing plans bitmaps	training/videos/5c8fb40446c0e8b4222cf7a69ae36f45.mp4	training/videos/5c8fb40446c0e8b4222cf7a69ae36f45.jpg	video	\N	38	77	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 1.3 Set Levels	training/videos/77f6e43b6c311ac2eebd0464ff94feac.mp4	training/videos/77f6e43b6c311ac2eebd0464ff94feac.jpg	video	\N	38	78	\N	\N	\N	\N	\N	\N	\N
\N	VisualARQ 2 tutorial - 1.1. New document	training/videos/0c96fafe15b7651dc6bf6dc889086330.mp4	training/videos/0c96fafe15b7651dc6bf6dc889086330.jpg	video	\N	38	79	\N	\N	\N	\N	\N	\N	\N
NEW TEST 848	\N	\N	\N	\N	\N	\N	84	\N	\N	\N	\N	\N	\N	\N
annn	\N	\N	\N	\N	\N	\N	85	\N	\N	\N	\N	\N	\N	\N
ffff	\N	\N	\N	\N	\N	\N	87	\N	\N	\N	\N	\N	\N	\N
\N	1A	training/documents/ebf3fc4d101e5d1b2156700e7028ac27.pdf	training/documents/ebf3fc4d101e5d1b2156700e7028ac27.jpg	handbook	\N	123	148	training/documents/455fed94c931e50312244bfca3c55dc0.pdf	training/documents/455fed94c931e50312244bfca3c55dc0.jpg	training/documents/930008ec097f44c5d64c007badc995ae.pdf	training/documents/930008ec097f44c5d64c007badc995ae.jpg	\N	\N	\N
fffffH	\N	\N	\N	\N	\N	\N	86	\N	\N	\N	\N	\N	\N	\N
sd	\N	\N	\N	\N	\N	\N	88	\N	\N	\N	\N	\N	\N	\N
qwe	\N	\N	\N	\N	\N	\N	89	\N	\N	\N	\N	\N	\N	\N
aaaa	\N	\N	\N	\N	\N	\N	91	\N	\N	\N	\N	\N	\N	\N
erw	\N	\N	training/icons/83231f929020a2531ebde603535605c9.jpg	\N	\N	\N	90	\N	\N	\N	\N	\N	\N	\N
sd	\N	\N	\N	\N	\N	\N	92	\N	\N	\N	\N	\N	\N	\N
ttrtr	\N	\N	\N	\N	\N	\N	93	\N	\N	\N	\N	\N	\N	\N
dd	\N	\N	\N	\N	\N	\N	94	\N	\N	\N	\N	\N	\N	\N
sds	\N	\N	\N	\N	\N	\N	95	\N	\N	\N	\N	\N	\N	\N
\N	A111112	training/documents/924c7b5bcb24aa88a051e548b8ea3201.pdf	training/documents/924c7b5bcb24aa88a051e548b8ea3201.jpg	handbook	\N	123	149	training/documents/18b5f77ea3b8444785811f242b4a8064.pdf	training/documents/18b5f77ea3b8444785811f242b4a8064.jpg	training/documents/fefb4faab9a70a2b6a58ff8bdc04ffe4.pdf	training/documents/fefb4faab9a70a2b6a58ff8bdc04ffe4.jpg	\N	\N	\N
kkDe	\N	\N	\N	\N	\N	\N	96	\N	\N	\N	\N	\N	\N	\N
hello	\N	\N	\N	\N	\N	\N	97	\N	\N	\N	\N	\N	\N	\N
hello2edit	\N	\N	\N	\N	\N	\N	98	\N	\N	\N	\N	\N	\N	\N
babu	\N	\N	\N	\N	\N	\N	99	\N	\N	\N	\N	\N	\N	\N
bbbbbbbbb	\N	\N	\N	\N	\N	\N	100	\N	\N	\N	\N	\N	\N	\N
lalu	\N	\N	\N	\N	\N	\N	101	\N	\N	\N	\N	\N	\N	\N
lalus	\N	\N	\N	\N	\N	\N	102	\N	\N	\N	\N	\N	\N	\N
Babu	\N	\N		\N	\N	\N	103	\N	\N	\N	\N	\N	\N	\N
sds	\N	\N		\N	\N	\N	104	\N	\N	\N	\N	\N	\N	\N
inner	\N	\N		\N	\N	\N	105	\N	\N	\N	\N	\N	\N	\N
erewre	\N	\N		\N	\N	\N	106	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	image/	\N	\N	\N	107	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	training/icons/	\N	\N	\N	108	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	training/icons/	\N	\N	\N	109	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N		\N	\N	\N	111	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N		\N	\N	\N	112	\N	\N	\N	\N	\N	\N	\N
er	\N	\N	training/icons/f9891c35bdca8defd35bc8a52506416f.jpg	\N	\N	\N	113	\N	\N	\N	\N	\N	\N	\N
Shoaib Bin	\N	\N	\N	\N	\N	\N	114	\N	\N	\N	\N	\N	\N	\N
\N	aaa	\N	\N	\N	\N	91	115	\N	\N	\N	\N	\N	\N	\N
\N	LLL	\N	\N	\N	\N	91	116	\N	\N	\N	\N	\N	\N	\N
\N	6636	\N	\N	\N	\N	91	117	\N	\N	\N	\N	\N	\N	\N
ddd	\N	\N	\N	\N	\N	\N	118	\N	\N	\N	\N	\N	\N	\N
\N	dsdsd	training/documents/47b89054576827de1d6b6cd84bc7fa7c.pdf	training/documents/47b89054576827de1d6b6cd84bc7fa7c.jpg	handbook	\N	91	119	\N	\N	\N	\N	\N	\N	\N
\N	sdfds	training/documents/6ef384c97fe9082a242d9433c7bf61ec.pdf	training/documents/6ef384c97fe9082a242d9433c7bf61ec.jpg	handbook	\N	1	120	\N	\N	\N	\N	\N	\N	\N
\N	cvc	training/documents/5b3cd12a1a06a59492a0323989e7bc67.pdf	training/documents/5b3cd12a1a06a59492a0323989e7bc67.jpg	handbook	\N	1	121	\N	\N	\N	\N	\N	\N	\N
\N	test1	training/documents/8ffc0c06b6743dedbce54f73a1996637.pdf	training/documents/8ffc0c06b6743dedbce54f73a1996637.jpg	handbook	\N	3	122	\N	\N	\N	\N	\N	\N	\N
a1	\N	\N	training/icons/d64bbf2dabaf93ba861b38e0408e54d6.jpg	\N	\N	\N	123	\N	\N	\N	\N	\N	\N	\N
\N	a1vvv	training/documents/eec00791b4fe2438e90244f1fad0a96a.pdf	training/documents/eec00791b4fe2438e90244f1fad0a96a.jpg	handbook	\N	123	124	\N	\N	\N	\N	\N	\N	\N
\N	dgt	\N	\N	\N	\N	123	125	\N	\N	\N	\N	\N	\N	\N
\N	ds	\N	\N	\N	\N	123	126	\N	\N	\N	\N	\N	\N	\N
\N	sds	\N	\N	\N	\N	123	127	\N	\N	\N	\N	\N	\N	\N
\N	df	training/documents/37234b0f91a0a35e1c6c89bff7b63e8b.pdf	training/documents/37234b0f91a0a35e1c6c89bff7b63e8b.jpg	handbook	\N	123	129	\N	\N	\N	\N	\N	\N	\N
\N	sfsd	training/documents/453b3244a72934b694c00a4003e825ed.pdf	training/documents/453b3244a72934b694c00a4003e825ed.jpg	handbook	\N	123	130	\N	\N	\N	\N	\N	\N	\N
\N	kk	training/documents/55380981665808c9c593380c8f62c890.pdf	training/documents/55380981665808c9c593380c8f62c890.jpg	handbook	\N	123	131	\N	\N	\N	\N	\N	\N	\N
\N	babu	training/documents/6a3001186e936d01b66955e79916f9cd.pdf	training/documents/6a3001186e936d01b66955e79916f9cd.jpg	handbook	\N	123	132	\N	\N	\N	\N	\N	\N	\N
\N	test	training/videos/6800214f9fa60df49db0311d28d366bd.mp4	training/videos/6800214f9fa60df49db0311d28d366bd.jpg	video	\N	123	133	\N	\N	\N	\N	\N	\N	\N
\N	mmm	\N	\N	\N	\N	123	134	\N	\N	\N	\N	\N	\N	\N
\N	633	training/videos/da65a921f9d30cb2309f51a63d568a12.mp4	training/videos/da65a921f9d30cb2309f51a63d568a12.jpg	video	\N	123	135	\N	\N	\N	\N	\N	\N	\N
\N	vvvvv	training/videos/d6c07c87976a4aa46239335a01fe589e.mp4	training/videos/d6c07c87976a4aa46239335a01fe589e.jpg	video	\N	123	136	\N	\N	\N	\N	\N	\N	\N
\N	220	\N	\N	\N	\N	123	137	\N	\N	\N	\N	\N	\N	\N
\N	kkjn202	\N	\N	\N	\N	123	138	\N	\N	\N	\N	\N	\N	\N
\N	llkk	training/videos/c5a6ee2142f1e4cb7852a6602e2a47ac.mp4	training/videos/c5a6ee2142f1e4cb7852a6602e2a47ac.jpg	video	\N	123	139	\N	\N	\N	\N	\N	\N	\N
\N	220	training/videos/e445098ce6254febf0e3a32737191bc2.mp4	training/videos/e445098ce6254febf0e3a32737191bc2.jpg	video	\N	123	140	\N	\N	\N	\N	\N	\N	\N
Testhhh	\N	\N	\N	\N	\N	\N	142	\N	\N	\N	\N	\N	\N	\N
\N	German Test			handbook	\N	123	143	training/documents/8ffb08211edd7e014ca4ac47841c0d83.pdf	training/documents/8ffb08211edd7e014ca4ac47841c0d83.jpg			\N	\N	\N
\N	English	training/documents/3c68cd5a0456f65ee2357f81565d1cbd.pdf	training/documents/3c68cd5a0456f65ee2357f81565d1cbd.jpg	handbook	\N	123	144					\N	\N	\N
\N	HIIIIIIII	training/documents/32fd64b69c165e22095f4d3dc05826f2.pdf	training/documents/32fd64b69c165e22095f4d3dc05826f2.jpg	handbook	\N	123	145	training/documents/ac7fe58bb2fb0e4bbf20dfc6855fda4b.pdf	training/documents/ac7fe58bb2fb0e4bbf20dfc6855fda4b.jpg	training/documents/4bb000f0417a939712ee497dc9d4ef3c.pdf	training/documents/4bb000f0417a939712ee497dc9d4ef3c.jpg	\N	\N	\N
\N	All Test	training/documents/b22aac5f50e3494f2b77b44be9129693.pdf	training/documents/b22aac5f50e3494f2b77b44be9129693.jpg	handbook	\N	123	147	training/documents/295c64d006c9f82d119e2271648f42c1.pdf	training/documents/295c64d006c9f82d119e2271648f42c1.jpg	training/documents/b65a71e5f956c60f33b4e520a9512d3c.pdf	training/documents/b65a71e5f956c60f33b4e520a9512d3c.jpg	\N	\N	\N
\N	ALLTEST EGLISH DE POL	training/documents/129271469ad47aed44305b3173ba6d09.pdf	training/documents/129271469ad47aed44305b3173ba6d09.jpg	handbook	\N	123	150	training/documents/3550fc5dfe76f51c7a31d4ab512e6c8d.pdf	training/documents/3550fc5dfe76f51c7a31d4ab512e6c8d.jpg	training/documents/b4b22666da1f4649a62e7fefb32f4631.pdf	training/documents/b4b22666da1f4649a62e7fefb32f4631.jpg	\N	\N	\N
\N	tEST VIDEO	training/videos/bed0c22175ab7be213bbcabfe6ddba1b.mp4	training/videos/bed0c22175ab7be213bbcabfe6ddba1b.jpg	video	\N	123	151	\N	\N	\N	\N	\N	\N	\N
\N	lll	training/videos/a4d631fede0be79fb924dac6e10131d4.mp4	training/videos/a4d631fede0be79fb924dac6e10131d4.jpg	video	\N	123	152	\N	\N	\N	\N	\N	\N	\N
abcd	\N	\N	\N	\N	\N	\N	153	\N	\N	\N	\N	\N	\N	\N
\N	Hello 999	training/documents/cb411e20267f8eaa56c1080bb91fde62.pdf	training/documents/cb411e20267f8eaa56c1080bb91fde62.jpg	handbook	\N	123	154					\N	\N	\N
\N	week 50	training/documents/6a5455dd620bd9bb3f584ffa8c5ce279.pdf	training/documents/6a5455dd620bd9bb3f584ffa8c5ce279.jpg	handbook	\N	123	155					\N	\N	\N
\N	vQIJAN	training/documents/6640c7e75e49711cf55200979291aeaa.pdf	training/documents/6640c7e75e49711cf55200979291aeaa.jpg	handbook	\N	123	156					\N	\N	\N
\N	Today Tuesday	training/videos/e940f95f08c690383538c782c636ad17.mp4	training/videos/e940f95f08c690383538c782c636ad17.jpg	video	\N	123	157	\N	\N	\N	\N	\N	\N	\N
\N	1B	training/documents/efb324da7520d79e6f94e7d1ae48c43d.pdf	training/documents/efb324da7520d79e6f94e7d1ae48c43d.jpg	handbook	\N	123	158					\N	\N	\N
\N	Hello Test	training/documents/f468f0835e057fe4139d41155bed041a.pdf	training/documents/f468f0835e057fe4139d41155bed041a.jpg	handbook	\N	123	159	training/documents/fc9061d014bbf28da5c80084925944be.pdf	training/documents/fc9061d014bbf28da5c80084925944be.jpg	training/documents/24bd5b49df42e7d4dea1c78f88d44061.pdf	training/documents/24bd5b49df42e7d4dea1c78f88d44061.jpg	\N	\N	\N
\N	Test RF	training/videos/4ced8f854b29a4a59b7c4df1414942cd.mp4	training/videos/4ced8f854b29a4a59b7c4df1414942cd.jpg	video	\N	123	160	\N	\N	\N	\N	\N	\N	\N
\N	11A	training/videos/3877beb33014779562b2270d654163d5.mp4	training/videos/3877beb33014779562b2270d654163d5.jpg	video	\N	123	162	\N	\N	\N	\N	\N	\N	\N
\N	ST	training/videos/d4052a5561d49e57a67d94abccdf76a7.mp4	training/videos/d4052a5561d49e57a67d94abccdf76a7.jpg	video	\N	123	163	\N	\N	\N	\N	\N	\N	\N
\N	1EEE	training/videos/11419791d2f78bdfb7ad14656fec4555.mp4	training/videos/11419791d2f78bdfb7ad14656fec4555.jpg	video	\N	123	164	\N	\N	\N	\N	\N	\N	\N
\N	AAA234	training/videos/529255915d52e83a7788653ff8aec72d.mp4	training/videos/529255915d52e83a7788653ff8aec72d.jpg	video	\N	123	165	\N	\N	\N	\N	\N	\N	\N
LOLLL	\N	\N	\N	\N	\N	\N	166	\N	\N	\N	\N	\N	\N	\N
tesrtG	\N	\N	\N	\N	\N	\N	167	\N	\N	\N	\N	\N	\N	\N
sdfds dsf	\N	\N	\N	\N	\N	\N	168	\N	\N	\N	\N	\N	\N	\N
vdfv	\N	\N	\N	\N	\N	\N	169	\N	\N	\N	\N	\N	\N	\N
fdg 	\N	\N	\N	\N	\N	\N	170	\N	\N	\N	\N	\N	\N	\N
frg 	\N	\N	\N	\N	\N	\N	171	\N	\N	\N	\N	\N	\N	\N
v	\N	\N	\N	\N	\N	\N	172	\N	\N	\N	\N	\N	\N	\N
rtr	\N	\N	\N	\N	\N	\N	173	\N	\N	\N	\N	\N	\N	\N
test_trainig int	\N	\N	\N	\N	\N	\N	174	\N	\N	\N	\N	\N	\N	\N
sdfds 	\N	\N	\N	\N	\N	\N	175	\N	\N	\N	\N	\N	\N	\N
dsfds	\N	\N	\N	\N	\N	\N	176	\N	\N	\N	\N	\N	\N	\N
3rd test	\N	\N	\N	\N	\N	\N	177	\N	\N	\N	\N	\N	\N	\N
fref	\N	\N	\N	\N	\N	\N	178	\N	\N	\N	\N	\N	\N	\N
varchar	\N	\N	\N	\N	\N	\N	179	\N	\N	\N	\N	\N	\N	\N
test var	\N	\N	\N	\N	\N	\N	180	\N	\N	\N	\N	\N	\N	\N
text flk	\N	\N	\N	\N	\N	\N	181	\N	\N	\N	\N	\N	\N	\N
var tsdfg 	\N	\N	\N	\N	\N	\N	182	\N	\N	\N	\N	\N	\N	\N
var tsdfg 	\N	\N	\N	\N	\N	\N	183	\N	\N	\N	\N	\N	\N	\N
test length	\N	\N	\N	\N	\N	\N	184	\N	\N	\N	\N	\N	\N	\N
test length[]	\N	\N	\N	\N	\N	\N	185	\N	\N	\N	\N	\N	\N	\N
test length[]	\N	\N	\N	\N	\N	\N	186	\N	\N	\N	\N	\N	\N	\N
test length[]	\N	\N	\N	\N	\N	\N	187	\N	\N	\N	\N	\N	\N	\N
inthgh 	\N	\N	\N	\N	\N	\N	188	\N	\N	\N	\N	{4,10,11}	\N	\N
HHNNSNS	\N	\N	\N	\N	\N	\N	189	\N	\N	\N	\N	{9,10,12}	\N	\N
adminnot	\N	\N	\N	\N	\N	\N	191	\N	\N	\N	\N	{25,23}	\N	\N
adminnotaccessible	\N	\N	\N	\N	\N	\N	193	\N	\N	\N	\N	{25,23}	\N	\N
\N	asa	training/videos/c2bcf3a62163fb78873cedd19f06161a.mp4	training/videos/c2bcf3a62163fb78873cedd19f06161a.jpg	video	\N	189	201	\N	\N	\N	\N	{4,9,10,11,14}	\N	\N
\N	dfds	training/documents/253af40e0ae13194a844fe60fc286138.pdf	training/documents/253af40e0ae13194a844fe60fc286138.jpg	handbook	\N	192	194	training/documents/1ab488195a67a05e3df45419a1958d35.pdf	training/documents/1ab488195a67a05e3df45419a1958d35.jpg	training/documents/b4ed783206cb3c1718bdff854d7dd983.pdf	training/documents/b4ed783206cb3c1718bdff854d7dd983.jpg	\N	\N	\N
\N	ssfsf sdf	training/documents/5b5dbcf71625f9a37fde8ba7485042d7.pdf	training/documents/5b5dbcf71625f9a37fde8ba7485042d7.jpg	handbook	\N	192	195	training/documents/4b61f80b7a669b0412e13815e238c5e9.pdf	training/documents/4b61f80b7a669b0412e13815e238c5e9.jpg	training/documents/b86e5d25e69e13f90bea774c5a05f3ed.pdf	training/documents/b86e5d25e69e13f90bea774c5a05f3ed.jpg	{9,10,11,14}	\N	\N
\N	without id 4	training/documents/e39f5ea64fe8ca5183de24121a2b0f44.pdf	training/documents/e39f5ea64fe8ca5183de24121a2b0f44.jpg	handbook	\N	192	196	training/documents/15b1bca3800b20ac7260ad2409aec1e6.pdf	training/documents/15b1bca3800b20ac7260ad2409aec1e6.jpg	training/documents/16c09086c5d3c5d23a8f684c8755dbc8.pdf	training/documents/16c09086c5d3c5d23a8f684c8755dbc8.jpg	{13,15,18}	\N	\N
\N	test_video	training/videos/80cd334378c498b0e7d6f5ed61aa33d8.mp4	training/videos/80cd334378c498b0e7d6f5ed61aa33d8.jpg	video	\N	192	197	\N	\N	\N	\N	{}	\N	\N
\N	dscds	training/videos/6dc0868fdaa83580d4f75b860ccafedb.mp4	training/videos/6dc0868fdaa83580d4f75b860ccafedb.jpg	video	\N	192	198	\N	\N	\N	\N	{}	\N	\N
\N	32232	training/videos/577a9a28dc49ca045150122c9d843dcc.mp4	training/videos/577a9a28dc49ca045150122c9d843dcc.jpg	video	\N	192	199	\N	\N	\N	\N	{4,9,11,12,15}	\N	\N
\N	sdsd	training/videos/8e130adc32630b9f937d39f546bb81c2.mp4	training/videos/8e130adc32630b9f937d39f546bb81c2.jpg	video	\N	192	200	\N	\N	\N	\N	{11,13}	\N	\N
BNNP V2	\N	\N	\N	\N	\N	\N	192	\N	\N	\N	\N	{}	\N	\N
svd2	\N	\N	\N	\N	\N	\N	190	\N	\N	\N	\N	{10,12,14,17,18,25,23}	\N	\N
\N	defedf	training/videos/15c0af0342e56fd8c73c7fe216f2c696.mp4	training/videos/15c0af0342e56fd8c73c7fe216f2c696.jpg	video	\N	189	203	\N	\N	\N	\N	{4,9,10,11,12,14}	\N	\N
\N	defedf	training/videos/7c3717e8a9e1fa7a5eebf4746fac78bf.mp4	training/videos/7c3717e8a9e1fa7a5eebf4746fac78bf.jpg	video	\N	189	204	\N	\N	\N	\N	{4,9,10,11,12,14}	\N	\N
\N	defedf	training/videos/87f348c3d9ceb0f34c2d284d2cf885d1.mp4	training/videos/87f348c3d9ceb0f34c2d284d2cf885d1.jpg	video	\N	189	205	\N	\N	\N	\N	{4,9,10,11,12,14}	\N	\N
\N	sfsd  ss	training/videos/49dae010ce78e9a31b0a3d853bab1b66.mp4	training/videos/49dae010ce78e9a31b0a3d853bab1b66.jpg	video	\N	189	206	\N	\N	\N	\N	{4,9,10,11,12,14}	\N	\N
\N	dsfds	training/videos/73b6e90059deb42c51de33e063cef4ce.mp4	training/videos/73b6e90059deb42c51de33e063cef4ce.jpg	video	\N	189	207	\N	\N	\N	\N	{4,9,10,11,12,13}	\N	\N
\N	sdfdsf	training/videos/b37aefd68deff11688bce23513deaf73.mp4	training/videos/b37aefd68deff11688bce23513deaf73.jpg	video	\N	189	208	\N	\N	\N	\N	{4,9,10,11,12,13,15}	\N	\N
\N	sadsad	training/videos/6a5969b210e61f86d6a3cf5921a79e7b.mp4	training/videos/6a5969b210e61f86d6a3cf5921a79e7b.jpg	video	\N	189	209	\N	\N	\N	\N	{4,9,10,11,13}	\N	\N
\N	dsfdsfsdfsd	training/videos/2a3299881de517340b20bf074960bc33.mp4	training/videos/2a3299881de517340b20bf074960bc33.jpg	video	\N	189	210	\N	\N	\N	\N	{4,9,10,11,13}	\N	\N
\N	dsfdsdsfdssdf	training/videos/7997fda4641d5ad2a6df32e791642d35.mp4	training/videos/7997fda4641d5ad2a6df32e791642d35.jpg	video	\N	189	211	\N	\N	\N	\N	{4,9,10,11}	\N	\N
\N	asdsadas	training/videos/39b1946865e33c5d90810fdc45fc0b14.mp4	training/videos/39b1946865e33c5d90810fdc45fc0b14.jpg	video	\N	189	212	\N	\N	\N	\N	{4,9,10,12,13}	\N	\N
\N	sd	\N	\N	\N	\N	189	213	\N	\N	\N	\N	\N	\N	\N
test spinner	\N	\N	\N	\N	\N	\N	216	\N	\N	\N	\N	{4,10,12,13,14}	\N	\N
asdas 2	\N	\N	\N	\N	\N	\N	215	\N	\N	\N	\N	{4,9,10,12,13,14}	\N	\N
\N	asdas 2	training/documents/efef893f2c01975b4722e73f1c292e23.pdf	training/documents/efef893f2c01975b4722e73f1c292e23.jpg	handbook	\N	189	214	training/documents/290970c663f52503de05b1c2b09aeb98.pdf	training/documents/290970c663f52503de05b1c2b09aeb98.jpg	training/documents/6523d41ee080858b66239bf1d6758b2d.pdf	training/documents/6523d41ee080858b66239bf1d6758b2d.jpg	{4,9,10,11,12,13}	\N	\N
\N	abasd 2	training/videos/6e4f0eaaf500067afc8b24bbd61a1cc4.mp4	training/videos/6e4f0eaaf500067afc8b24bbd61a1cc4.jpg	video	\N	189	202	\N	\N	\N	\N	{4,9,10,12,13}	\N	\N
Hi	\N	\N	\N	\N	\N	\N	217	\N	\N	\N	\N	{4,10,11,12,13,14,16}	\N	\N
\N	adas	training/videos/d4ae1d53d1636c7e158043dc847e124f.mp4	training/videos/d4ae1d53d1636c7e158043dc847e124f.jpg	video	\N	215	218	\N	\N	\N	\N	{4,9,10,12}	\N	\N
\N	sdsd	\N	\N	\N	\N	215	219	\N	\N	\N	\N	\N	\N	\N
\N	sasasa	training/videos/a1540f7bb7b50fc8a734606d21abad38.mp4	training/videos/a1540f7bb7b50fc8a734606d21abad38.jpg	video	\N	215	220	\N	\N	\N	\N	{4,9,10,11,12,13}	\N	\N
\N	ewwe	training/documents/a676f845423c44903487286b692d1378.pdf	training/documents/a676f845423c44903487286b692d1378.jpg	handbook	\N	215	221	training/documents/eea7f229363dd18d5688d4e44f4733fe.pdf	training/documents/eea7f229363dd18d5688d4e44f4733fe.jpg	training/documents/6205e7f2afb78a47186913667dac6a0c.pdf	training/documents/6205e7f2afb78a47186913667dac6a0c.jpg	{9,10,11,12}	ded	ded
\.


--
-- Data for Name: medien; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.medien (id, name, path, level1, level2, level3, type, iconpath, "timestamp", themeid, theme) FROM stdin;
2	\N	\N	ATHENA	\N	\N	\N	theme-icon/1dde4c9ca66877d987aca3ab6e850b4c.jpg	\N	\N	ATHENA
7	\N	\N	AUTOCAD	\N	\N	\N	theme-icon/d61e64d8fbfe5970a68a9544c543e6e4.jpg	\N	\N	AUTOCAD
1	\N	\N	IKAVIOS	\N	\N	\N	theme-icon/5b8aa6bfdb1fbc9f0396e47fd28f8b10.jpg	\N	\N	IKAVIOS
8	Athena-Handbuch	media/documents/4561dc9b6e62f310076f62fedd388b01.pdf	ATHENA	Handbücher	Athena-Handbuch	handbook	media/documents/4561dc9b6e62f310076f62fedd388b01.jpg	\N	2	\N
10	IKAVIOS-Bedarfsmeldungen	media/documents/b5bde05212325cdf9b8592a37c2e2944.pdf	IKAVIOS	Handbücher	IKAVIOS-Bedarfsmeldungen	handbook	media/documents/b5bde05212325cdf9b8592a37c2e2944.jpg	\N	1	\N
12	IKAVIOS-Lieferziele	media/documents/98cdb9c294e2cdb23b5307e9809fdc7d.pdf	IKAVIOS	Handbücher	IKAVIOS-Lieferziele	handbook	media/documents/98cdb9c294e2cdb23b5307e9809fdc7d.jpg	\N	1	\N
14	IKAVIOS-Lagerbuchungen	media/documents/eca2d076651716a6d1b1a98b6e07cc76.pdf	IKAVIOS	Handbücher	IKAVIOS-Lagerbuchungen	handbook	media/documents/eca2d076651716a6d1b1a98b6e07cc76.jpg	\N	1	\N
16	Athena - 2D - Folien Teil  2	media/videos/27007b38184522fa44c81b62a5fea56b.mp4	ATHENA	Videos	Athena - 2D - Folien Teil  2	video	media/videos/27007b38184522fa44c81b62a5fea56b.jpg	\N	2	\N
18	Athena - 2D - Blechquerschnitte Teil 2	media/videos/252a19f10bf11de28ad54f9f63429b4e.mp4	ATHENA	Videos	Athena - 2D - Blechquerschnitte Teil 2	video	media/videos/252a19f10bf11de28ad54f9f63429b4e.jpg	\N	2	\N
21	Test	media/documents/1dc284f5e0c93831e04a88362ca67ea4.pdf	ATHENA	Handbücher	Test	handbook	media/documents/1dc284f5e0c93831e04a88362ca67ea4.jpg	\N	\N	\N
9	Autocad-Tastaturkürzel	media/documents/9f8c4452149d3c8253a42540310a8aa7.pdf	AUTOCAD	Handbücher	Autocad-Tastaturkürzel	handbook	media/documents/9f8c4452149d3c8253a42540310a8aa7.jpg	\N	7	\N
11	IKAVIOS-Fertigungsaufträge	media/documents/951e918407b19b70b9d8c3bc673b6fd5.pdf	IKAVIOS	Handbücher	IKAVIOS-Fertigungsaufträge	handbook	media/documents/951e918407b19b70b9d8c3bc673b6fd5.jpg	\N	1	\N
13	IKAVIOS-Lagerarten	media/documents/91fa892fd2b23b7958f255a8176522a5.pdf	IKAVIOS	Handbücher	IKAVIOS-Lagerarten	handbook	media/documents/91fa892fd2b23b7958f255a8176522a5.jpg	\N	1	\N
17	Athena - 2D - Blechquerschnitte Teil 1	media/videos/08ab8f91236ebb00a435ed75b605a724.mp4	ATHENA	Videos	Athena - 2D - Blechquerschnitte Teil 1	video	media/videos/08ab8f91236ebb00a435ed75b605a724.jpg	\N	2	\N
19	Athena - 2D - Dämmungen	media/videos/9f4c34cb847cb713c990a16742b5fcac.mp4	ATHENA	Videos	Athena - 2D - Dämmungen	video	media/videos/9f4c34cb847cb713c990a16742b5fcac.jpg	\N	2	\N
15	Athena - 2D - Folien Teil  1	media/videos/b37cf6632ce60f306b5ae67d3f8e7101.mp4	ATHENA	Videos	Athena - 2D - Folien Teil  1	video	media/videos/b37cf6632ce60f306b5ae67d3f8e7101.jpg	\N	2	\N
20	Big Bang 1	media/videos/43f19f7bf7b524be91d5d0d1569f83f9.mp4	ATHENA	Videos	Big Bang 1	video	media/videos/43f19f7bf7b524be91d5d0d1569f83f9.jpg	\N	\N	\N
\.


--
-- Data for Name: mlevel1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mlevel1 (id, name) FROM stdin;
\.


--
-- Data for Name: mlevel2; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mlevel2 (id, level1, name) FROM stdin;
\.


--
-- Data for Name: module; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.module (modulnr, modulname, beschreibung) FROM stdin;
1	bekanntmachung	\N
2	telefonnummern	innerbetriebliche telefonnummern
1	bekanntmachung	\N
2	telefonnummern	innerbetriebliche telefonnummern
\.


--
-- Data for Name: sessions_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions_log (user_id, session_id, start, finish) FROM stdin;
\.


--
-- Data for Name: stamm; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stamm (id, text1, text2) FROM stdin;
1	erster text	zweiter text
2	zweiter erster text	zweiter zweiter text
3	dritter erster Text	dritter zweiter text
\.


--
-- Data for Name: user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_groups (id, user_id, group_id) FROM stdin;
14	2	4
15	3	11
16	3	12
17	4	4
18	4	9
19	4	10
21	6	4
22	7	10
23	7	14
24	7	17
25	7	23
26	8	9
27	8	12
28	8	17
29	8	18
30	8	20
31	8	21
32	9	4
33	9	9
34	9	10
38	2	9
39	2	10
40	2	11
41	2	12
42	2	13
43	2	14
44	2	15
45	2	16
46	2	17
47	2	18
48	2	19
49	10	12
50	10	14
51	11	4
52	11	9
53	11	23
54	11	22
55	12	4
56	12	9
57	12	23
58	12	22
59	13	4
60	13	9
61	13	23
62	13	22
63	14	4
64	14	9
65	14	10
66	14	11
67	14	12
68	14	13
69	14	14
70	15	4
71	15	9
72	15	10
73	15	11
74	15	12
75	15	13
76	16	9
77	16	11
78	16	12
\.


--
-- Data for Name: username; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.username (id, username, password, vorname, nachname) FROM stdin;
1	steffen	steffen	Steffen	Förster
2	heiner	muster	Heiner	Muster
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, first_name, last_name, login_name, password, user_type, telephone1, telephone2, telephone3, email1, email2, email3, company) FROM stdin;
6	nkkasdsakndakaadsaka	asknaskdsakdsakdk	asknaskdnkasndk	askasdkasdk	U	\N	\N	\N	\N	\N	\N	\N
7	adasd	adasdasd	adasd	adasd	U	\N	\N	\N	\N	\N	\N	\N
8	adadasda	adadas	adsadasd	adsadsa	U	\N	\N	\N	\N	\N	\N	\N
9	shaoib	shoaib	shoaib	aadasdad	U	\N	\N	\N	\N	\N	\N	\N
10	test1	test1	test1	123456	A	\N	\N	\N	\N	\N	\N	\N
11	jony	last	jony2020	123456	U	\N	\N	\N	\N	\N	\N	\N
12	testuser	test last name	testuser	123456	U	\N	\N	\N	\N	\N	\N	\N
13	TEST	USER	testuser	123456	U	\N	\N	\N	\N	\N	\N	\N
14	testing first	testing last	testingadded	123456	U	\N	\N	\N	\N	\N	\N	\N
15	dasS	asASA	SAsaS	1123123	U	5242343	2432432	2432432	ajnasda@email.com	aadas@email.com	adadas@email.com	dsdaasdas
4	adasdasd	adasdsa	dsadas	dasdasd	U							
16	Tamim	Iqbal	tamim	tamim	U	015112304805			tamin@gz.de			RF
3	addadasdaa	adada	adasd	adadsad	U							
2	admin		admin	123456	A	54464564564	3424324234	2324324234	asddd@email.com	adasdasd@email.com	adasdasd@email.com	dfdsfsfs
\.


--
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.groups_id_seq', 25, true);


--
-- Name: information_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.information_id_seq', 34, true);


--
-- Name: information_inhalt_pol_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.information_inhalt_pol_seq', 36, true);


--
-- Name: kontakte_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kontakte_id_seq', 7, true);


--
-- Name: media_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.media_id_seq', 221, true);


--
-- Name: user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_groups_id_seq', 1, false);


--
-- Name: user_groups_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_groups_id_seq1', 78, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: users_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq1', 16, true);


--
-- Name: kontakte ID; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kontakte
    ADD CONSTRAINT "ID" PRIMARY KEY (id);


--
-- Name: username Primärschlüssel; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.username
    ADD CONSTRAINT "Primärschlüssel" PRIMARY KEY (id);


--
-- Name: handbuch dokumente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.handbuch
    ADD CONSTRAINT dokumente_pkey PRIMARY KEY (id);


--
-- Name: firmen firmen_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.firmen
    ADD CONSTRAINT firmen_pkey PRIMARY KEY (firma);


--
-- Name: forms forms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forms
    ADD CONSTRAINT forms_pkey PRIMARY KEY (id);


--
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: medien id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medien
    ADD CONSTRAINT id PRIMARY KEY (id);


--
-- Name: information information_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.information
    ADD CONSTRAINT information_pkey PRIMARY KEY (id);


--
-- Name: kalenderbasis kalenderbasis_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kalenderbasis
    ADD CONSTRAINT kalenderbasis_pkey PRIMARY KEY (datum);


--
-- Name: kalender primary_Key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kalender
    ADD CONSTRAINT "primary_Key" PRIMARY KEY (datum);


--
-- Name: stamm stamm_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stamm
    ADD CONSTRAINT stamm_pkey PRIMARY KEY (id);


--
-- Name: user_groups user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_groups
    ADD CONSTRAINT user_groups_pkey PRIMARY KEY (id);


--
-- Name: TABLE adressen_kpf; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.adressen_kpf TO PUBLIC;


--
-- Name: TABLE kalender; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.kalender TO PUBLIC;


--
-- Name: TABLE kontakte; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.kontakte TO PUBLIC;


--
-- Name: TABLE medien; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.medien TO PUBLIC;


--
-- Name: TABLE username; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.username TO PUBLIC;


--
-- PostgreSQL database dump complete
--

